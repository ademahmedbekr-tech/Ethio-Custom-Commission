<?php
// app/Services/FaydaIDAService.php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class FaydaIDAService
{
    protected $config;
    protected $privateKey = null; // Initialize as null
    protected $isSandbox;
    protected $certificateLoaded = false;

    public function __construct()
    {
        $this->config = config('fayda');
        $this->isSandbox = $this->config['sandbox_mode'] ?? true;

        Log::info('Fayda Service Initialized', [
            'mode' => $this->isSandbox ? 'SANDBOX' : 'PRODUCTION',
            'certificate_configured' => !empty($this->config['p12_certificate_path'])
        ]);

        // Only try to load certificate in production mode
        if (!$this->isSandbox) {
            $this->loadPrivateKey();
        }
    }

    /**
     * Load PKCS12 certificate and extract private key
     */
    protected function loadPrivateKey()
    {
        $certPath = $this->config['p12_certificate_path'] ?? null;

        if (empty($certPath)) {
            Log::error('PKCS12 certificate path not configured for production');
            throw new \Exception('Certificate not configured. Please contact administrator.');
        }

        if (!file_exists($certPath)) {
            Log::error('Certificate file not found', ['path' => $certPath]);
            throw new \Exception('Certificate file not found. Please contact administrator.');
        }

        try {
            $p12Content = file_get_contents($certPath);
            $certs = [];
            $password = $this->config['p12_certificate_password'] ?? '';

            if (!openssl_pkcs12_read($p12Content, $certs, $password)) {
                throw new \Exception('Invalid certificate password or corrupted file');
            }

            if (!isset($certs['pkey'])) {
                throw new \Exception('No private key found in certificate');
            }

            $this->privateKey = $certs['pkey'];
            $this->certificateLoaded = true;

            Log::info('PKCS12 certificate loaded successfully');

        } catch (\Exception $e) {
            Log::error('Failed to load certificate', ['error' => $e->getMessage()]);
            throw new \Exception('Certificate configuration error: ' . $e->getMessage());
        }
    }

    /**
     * Generate JWS signature for request payload
     */
    protected function generateJwsSignature(string $payload): string
    {
        // In sandbox mode, return a mock signature
        if ($this->isSandbox) {
            return base64_encode('mock_signature_' . Str::random(32));
        }

        // Production mode - must have private key loaded
        if (!$this->certificateLoaded || !$this->privateKey) {
            throw new \Exception('Private key not loaded. Certificate required for production.');
        }

        $privateKey = openssl_pkey_get_private($this->privateKey);
        if (!$privateKey) {
            throw new \Exception('Invalid private key');
        }

        $signature = '';
        if (!openssl_sign($payload, $signature, $privateKey, OPENSSL_ALGO_SHA256)) {
            throw new \Exception('Failed to generate signature');
        }

        return base64_encode($signature);
    }

    /**
     * Request OTP - Works in sandbox mode without certificate
     */
    public function requestOtp(string $fin, string $transactionId, array $channels = null)
    {
        Log::info('Requesting OTP', [
            'fin' => $this->maskFin($fin),
            'mode' => $this->isSandbox ? 'sandbox' : 'production'
        ]);

        // SANDBOX MODE - Mock response (no real email sent)
        if ($this->isSandbox) {
            $mockOtp = $this->config['test_otp'] ?? '111111';

            // Store mock OTP for verification
            Cache::put("fayda_otp_{$transactionId}", $mockOtp, now()->addMinutes(5));

            return [
                'success' => true,
                'message' => 'Sandbox mode: Use OTP: ' . $mockOtp,
                'transactionId' => $transactionId,
                'testOtp' => $mockOtp,
                'sandbox' => true
            ];
        }

        // PRODUCTION MODE - Real API call with JWS signature
        try {
            // Build the required payload structure
            $payload = [
                "id" => "fayda.identity.otp",
                "requestTime" => now()->toIso8601String(),
                "env" => "Production",
                "version" => "1.0",
                "domainUri" => $this->config['base_url'],
                "transactionID" => $transactionId,
                "individualId" => $fin,
                "individualIdType" => "UIN",
                "otpChannel" => $channels ?? ["EMAIL"]
            ];

            $payloadJson = json_encode($payload);

            // Generate signature using private key
            $signature = $this->generateJwsSignature($payloadJson);

            // Send request with proper headers
            $response = Http::timeout($this->config['timeout'] ?? 30)
                ->withHeaders([
                    'Content-Type' => 'application/jose+json',
                    'signature' => $signature,
                    'Partner-Id' => $this->config['partner_id'],
                    'API-Key' => $this->config['partner_api_key'],
                    'MISP-License-Key' => $this->config['misp_license_key'],
                ])
                ->withOptions(['verify' => $this->config['ssl_verify'] ?? false])
                ->post($this->config['base_url'] . '/v1/ida/otp/request', $payloadJson);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'message' => 'OTP sent successfully',
                    'transactionId' => $transactionId,
                    'response' => $response->json()
                ];
            }

            Log::error('Fayda OTP Request Failed', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return [
                'success' => false,
                'error' => $response->json()['error'] ?? 'Failed to send OTP',
                'status_code' => $response->status()
            ];

        } catch (\Exception $e) {
            Log::error('Fayda OTP Exception', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return [
                'success' => false,
                'error' => 'Service error: ' . $e->getMessage()
            ];
        }
    }

    /**
     * Authenticate user with FIN + OTP
     */
    public function authenticate(string $fin, string $otp, string $transactionId)
    {
        Log::info('Authenticating user', [
            'fin' => $this->maskFin($fin),
            'mode' => $this->isSandbox ? 'sandbox' : 'production'
        ]);

        // SANDBOX MODE - Mock authentication
        if ($this->isSandbox) {
            $cachedOtp = Cache::get("fayda_otp_{$transactionId}");
            $testOtp = $this->config['test_otp'] ?? '111111';

            // Accept either cached OTP or global test OTP
            if ($otp === $testOtp || ($cachedOtp && $otp === $cachedOtp)) {
                return [
                    'success' => true,
                    'authenticated' => true,
                    'transactionId' => $transactionId,
                    'sandbox' => true
                ];
            }

            return [
                'success' => false,
                'authenticated' => false,
                'error' => 'Invalid OTP. Use ' . $testOtp . ' in sandbox mode.'
            ];
        }

        // PRODUCTION MODE - Real authentication
        try {
            $payload = [
                "id" => "fayda.identity.auth",
                "requestTime" => now()->toIso8601String(),
                "env" => "Production",
                "version" => "1.0",
                "transactionID" => $transactionId,
                "individualId" => $fin,
                "individualIdType" => "UIN",
                "otp" => $otp
            ];

            $payloadJson = json_encode($payload);
            $signature = $this->generateJwsSignature($payloadJson);

            $response = Http::timeout($this->config['timeout'] ?? 30)
                ->withHeaders([
                    'Content-Type' => 'application/jose+json',
                    'signature' => $signature,
                    'Partner-Id' => $this->config['partner_id'],
                    'API-Key' => $this->config['partner_api_key'],
                ])
                ->post($this->config['base_url'] . '/v1/ida/auth/yes-no', $payloadJson);

            if ($response->successful() && ($response->json()['authenticated'] ?? false)) {
                return [
                    'success' => true,
                    'authenticated' => true,
                    'data' => $response->json()
                ];
            }

            return [
                'success' => false,
                'authenticated' => false,
                'error' => $response->json()['error'] ?? 'Authentication failed'
            ];

        } catch (\Exception $e) {
            Log::error('Authentication failed', ['error' => $e->getMessage()]);
            return [
                'success' => false,
                'authenticated' => false,
                'error' => 'Authentication service error'
            ];
        }
    }

    /**
     * Get eKYC data after successful authentication
     */
    public function getEkycData(string $fin, string $otp, string $transactionId)
    {
        // SANDBOX MODE - Mock eKYC data
        if ($this->isSandbox) {
            return [
                'success' => true,
                'data' => $this->getMockEkycData($fin),
                'sandbox' => true
            ];
        }

        // PRODUCTION MODE - Real eKYC request
        try {
            $payload = [
                "id" => "fayda.identity.ekyc",
                "requestTime" => now()->toIso8601String(),
                "env" => "Production",
                "version" => "1.0",
                "transactionID" => $transactionId,
                "individualId" => $fin,
                "individualIdType" => "UIN"
            ];

            $payloadJson = json_encode($payload);
            $signature = $this->generateJwsSignature($payloadJson);

            $response = Http::timeout($this->config['timeout'] ?? 30)
                ->withHeaders([
                    'Content-Type' => 'application/jose+json',
                    'signature' => $signature,
                    'Partner-Id' => $this->config['partner_id'],
                    'API-Key' => $this->config['partner_api_key'],
                ])
                ->post($this->config['base_url'] . '/v1/ida/ekyc', $payloadJson);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'data' => $response->json()
                ];
            }

            return [
                'success' => false,
                'error' => $response->json()['error'] ?? 'Failed to retrieve eKYC data'
            ];

        } catch (\Exception $e) {
            Log::error('eKYC failed', ['error' => $e->getMessage()]);
            return [
                'success' => false,
                'error' => 'eKYC service error'
            ];
        }
    }

    /**
     * Mask FIN for logging
     */
    protected function maskFin(string $fin): string
    {
        if (strlen($fin) <= 4) {
            return '****';
        }
        return substr($fin, 0, 2) . str_repeat('*', strlen($fin) - 4) . substr($fin, -2);
    }

    /**
     * Validate FIN format
     */
    public function validateFin(string $fin): bool
    {
        return preg_match('/^\d{12}$/', $fin) === 1;
    }

    /**
     * Mock eKYC data for sandbox testing
     */
    protected function getMockEkycData(string $fin): array
    {
        return [
            'fin' => $fin,
            'fullName' => 'Test User',
            'givenName' => 'Test',
            'familyName' => 'User',
            'email' => 'ademahmedbekr@gmail.com',
            'phoneNumber' => '+25168292069',
            'dateOfBirth' => '1990-01-01',
            'nationality' => 'Ethiopian',
            'sex' => 'MALE',
            'placeOfBirth' => 'Addis Ababa',
        ];
    }
}
