<?php
// app/Http/Controllers/FaydaVerificationController.php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\FaydaIDAService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class FaydaVerificationController extends Controller
{
    protected $fayda;

    public function __construct(FaydaIDAService $fayda)
    {
        $this->fayda = $fayda;
    }

    /**
     * Show the FIN input form
     */
    public function showInputForm()
    {
        // If user is already verified, redirect to dashboard
        if (Auth::check() && Auth::user()->fayda_verified_at) {
            return redirect()->route('dashboard')->with('info', 'You are already verified with Fayda ID');
        }

        return view('fayda.verify-form');
    }

    /**
     * Initiate verification process with FIN
     */
   // In FaydaVerificationController@initiateVerification

public function initiateVerification(Request $request)
{
    $request->validate([
        'fin' => 'required|string|size:12',
    ]);

    $fin = $request->input('fin');
    $transactionId = Str::uuid()->toString();

    session([
        'fayda_verification' => [
            'fin' => $fin,
            'transaction_id' => $transactionId,
            'initiated_at' => now(),
        ]
    ]);

    // Request OTP - This will work in sandbox mode without certificates
    $otpResponse = $this->fayda->requestOtp($fin, $transactionId);

    if (!$otpResponse['success']) {
        return back()->with('error', $otpResponse['error'] ?? 'Service unavailable. Please try again.');
    }

    // Store OTP info in session
    session([
        'fayda_verification.otp_requested_at' => now(),
        'fayda_verification.otp_expires_at' => now()->addMinutes(5)
    ]);

    // In sandbox mode, show the test OTP for development
    if (config('fayda.sandbox_mode') && isset($otpResponse['testOtp'])) {
        return redirect()->route('fayda.callback')->with([
            'success' => 'Development Mode: Use OTP: ' . $otpResponse['testOtp'],
            'test_otp' => $otpResponse['testOtp'],
            'sandbox_mode' => true
        ]);
    }

    return redirect()->route('fayda.callback')
        ->with('success', 'Verification code sent to your registered email/phone');
}
    /**
     * Show OTP verification form (callback page)
     */
    public function handleCallback(Request $request)
    {
        // Check if verification session exists
        if (!session('fayda_verification')) {
            return redirect()->route('fayda.verify')
                ->with('error', 'Verification session expired. Please start over.');
        }

        $verification = session('fayda_verification');

        // Check if OTP is expired
        if (now()->gt($verification['otp_expires_at'] ?? now())) {
            session()->forget('fayda_verification');
            return redirect()->route('fayda.verify')
                ->with('error', 'Verification code expired. Please request a new one.');
        }

        // Check attempt limit
        if (($verification['attempts'] ?? 0) >= 5) {
            session()->forget('fayda_verification');
            return redirect()->route('fayda.verify')
                ->with('error', 'Too many failed attempts. Please restart verification.');
        }

        return view('fayda.verify-otp', [
            'fin' => $verification['fin'],
            'transactionId' => $verification['transaction_id'],
            'expiresAt' => $verification['otp_expires_at'],
            'resendAvailable' => now()->diffInSeconds($verification['otp_requested_at']) > 30,
        ]);
    }

    /**
     * Process OTP verification and complete authentication
     */
    public function processOtpVerification(Request $request)
    {
        $request->validate([
            'otp' => 'required|string|size:6',
        ]);

        $verification = session('fayda_verification');

        if (!$verification) {
            return redirect()->route('fayda.verify')
                ->with('error', 'Verification session expired. Please start over.');
        }

        // Increment attempt counter
        $verification['attempts'] = ($verification['attempts'] ?? 0) + 1;
        session(['fayda_verification' => $verification]);

        $fin = $verification['fin'];
        $otp = $request->input('otp');
        $transactionId = $verification['transaction_id'];

        // Authenticate with Fayda
        $authResponse = $this->fayda->authenticate($fin, $otp, $transactionId);

        if (!$authResponse['success'] || !$authResponse['authenticated']) {
            $remainingAttempts = 5 - $verification['attempts'];

            if ($remainingAttempts <= 0) {
                session()->forget('fayda_verification');
                return redirect()->route('fayda.verify')
                    ->with('error', 'Maximum attempts exceeded. Please restart verification.');
            }

            return back()
                ->with('error', $authResponse['error'] ?? 'Invalid verification code')
                ->with('remaining_attempts', $remainingAttempts);
        }

        // Authentication successful - Get eKYC data
        $ekycResponse = $this->fayda->getEkycData($fin, $otp, $transactionId);

        if (!$ekycResponse['success']) {
            Log::error('Failed to retrieve eKYC after successful auth', [
                'fin' => $fin,
                'error' => $ekycResponse['error'] ?? 'Unknown'
            ]);

            return redirect()->route('fayda.verify')
                ->with('error', 'Authentication successful but failed to retrieve your data. Please contact support.');
        }

        // Process the verified user
        try {
            $user = $this->processVerifiedUser($fin, $ekycResponse['data'], $transactionId);

            // Clear verification session
            session()->forget('fayda_verification');

            // Log the user in
            Auth::login($user, $request->boolean('remember'));

            return redirect()->route('fayda.success');

        } catch (\Exception $e) {
            Log::error('User processing failed after Fayda verification', [
                'fin' => $fin,
                'error' => $e->getMessage()
            ]);

            return redirect()->route('fayda.verify')
                ->with('error', 'Failed to complete verification. Please contact support.');
        }
    }

    /**
     * Process OTP resend request
     */
    public function resendOtp(Request $request)
    {
        $verification = session('fayda_verification');

        if (!$verification) {
            return response()->json(['error' => 'Session expired'], 422);
        }

        // Rate limit resend requests (minimum 30 seconds between resends)
        $lastRequest = $verification['otp_requested_at'] ?? null;
        if ($lastRequest && now()->diffInSeconds($lastRequest) < 30) {
            return response()->json([
                'error' => 'Please wait ' . (30 - now()->diffInSeconds($lastRequest)) . ' seconds before requesting again'
            ], 429);
        }

        // Generate new transaction ID for security
        $newTransactionId = Str::uuid()->toString();

        // Request new OTP
        $otpResponse = $this->fayda->requestOtp($verification['fin'], $newTransactionId);

        if (!$otpResponse['success']) {
            return response()->json(['error' => $otpResponse['error'] ?? 'Failed to resend code'], 422);
        }

        // Update session with new transaction ID and timestamp
        $verification['transaction_id'] = $newTransactionId;
        $verification['otp_requested_at'] = now();
        $verification['otp_expires_at'] = now()->addMinutes(config('fayda.otp_expiry_minutes', 5));
        $verification['attempts'] = 0;
        session(['fayda_verification' => $verification]);

        // Update user record if logged in
        if (Auth::check()) {
            Auth::user()->update(['fayda_transaction_id' => $newTransactionId]);
        }

        return response()->json([
            'success' => true,
            'message' => 'New verification code sent',
            'expires_at' => $verification['otp_expires_at'],
            'test_otp' => $otpResponse['testOtp'] ?? null, // Sandbox only
        ]);
    }

    /**
     * Show success page after verification
     */
    public function showSuccess()
    {
        if (!Auth::check() || !Auth::user()->fayda_verified_at) {
            return redirect()->route('fayda.verify')
                ->with('error', 'Verification required');
        }

        $user = Auth::user();

        return view('fayda.verification-success', [
            'user' => $user,
            'verificationDate' => $user->fayda_verified_at,
        ]);
    }

    /**
     * Process and create/update user based on Fayda eKYC data
     */
    protected function processVerifiedUser(string $fin, array $ekycData, string $transactionId)
    {
        return DB::transaction(function () use ($fin, $ekycData, $transactionId) {
            // Extract user data from eKYC response
            $userData = [
                'fayda_fin' => $fin,
                'fayda_transaction_id' => $transactionId,
                'fayda_ekyc_data' => $ekycData,
                'fayda_verified_at' => now(),
                'fayda_verification_status' => 'verified',
                'fayda_national_id' => $ekycData['nationalId'] ?? $fin,
                'fayda_date_of_birth' => $ekycData['dateOfBirth'] ?? null,
                'fayda_phone' => $ekycData['phoneNumber'] ?? null,
            ];

            // Map name fields
            $fullName = $ekycData['fullName'] ??
                       ($ekycData['givenName'] . ' ' . ($ekycData['familyName'] ?? ''));

            // Find existing user or create new one
            $user = User::where('fayda_fin', $fin)->first();

            if ($user) {
                // Update existing user
                $user->update(array_merge($userData, [
                    'name' => $user->name ?? $fullName,
                    'email' => $user->email ?? ($ekycData['email'] ?? null),
                ]));
            } else {
                // Check if user exists with same email (from eKYC)
                $email = $ekycData['email'] ?? null;
                $user = User::where('email', $email)->first();

                if ($user) {
                    // Link existing account to Fayda
                    $user->update($userData);
                } else {
                    // Create new user
                    $user = User::create(array_merge($userData, [
                        'name' => $fullName,
                        'email' => $email,
                        'password' => bcrypt(Str::random(32)), // Random password, user can reset later
                    ]));
                }
            }

            return $user;
        });
    }
}
