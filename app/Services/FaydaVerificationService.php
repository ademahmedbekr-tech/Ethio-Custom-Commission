<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class FaydaVerificationService
{
    protected $clientId;
    protected $redirectUri;
    protected $authorizationEndpoint;
    protected $tokenEndpoint;
    protected $userinfoEndpoint;
    protected $isTestMode;
    protected $testFinNumber;
    protected $testOtp;

    public function __construct()
    {
        $this->clientId = config('fayda.client_id');
        $this->redirectUri = config('fayda.redirect_uri');
        $this->authorizationEndpoint = config('fayda.authorization_endpoint');
        $this->tokenEndpoint = config('fayda.token_endpoint');
        $this->userinfoEndpoint = config('fayda.userinfo_endpoint');
        $this->isTestMode = config('fayda.test_mode', false);
        $this->testFinNumber = config('fayda.test_fin_number');
        $this->testOtp = config('fayda.test_otp');
    }

    /**
     * Step 1: Generate Authorization URL
     * Redirect user to Fayda's login/consent page [citation:1][citation:4]
     */
    public function getAuthorizationUrl(): string
    {
        // Generate state for CSRF protection [citation:4]
        $state = bin2hex(random_bytes(16));
        session(['fayda_verification_state' => $state]);

        // Generate PKCE code verifier and challenge [citation:4]
        $codeVerifier = $this->generateCodeVerifier();
        $codeChallenge = $this->generateCodeChallenge($codeVerifier);

        session(['fayda_code_verifier' => $codeVerifier]);

        $params = [
            'client_id' => $this->clientId,
            'redirect_uri' => $this->redirectUri,
            'response_type' => 'code',
            'scope' => 'openid profile',
            'state' => $state,
            'code_challenge' => $codeChallenge,
            'code_challenge_method' => 'S256',
        ];

        return $this->authorizationEndpoint . '?' . http_build_query($params);
    }

    /**
     * Step 2: Exchange Authorization Code for Tokens
     * After user consents, exchange code for access_token [citation:1][citation:4]
     */
    public function getTokens(string $code, string $state): array
    {
        // Validate state parameter (CSRF protection) [citation:4]
        if (!$this->validateState($state)) {
            throw new \Exception('Invalid state parameter - possible CSRF attack');
        }

        $codeVerifier = session('fayda_code_verifier');

        $response = Http::asForm()->post($this->tokenEndpoint, [
            'grant_type' => 'authorization_code',
            'client_id' => $this->clientId,
            'redirect_uri' => $this->redirectUri,
            'code' => $code,
            'code_verifier' => $codeVerifier,
        ]);

        if (!$response->successful()) {
            Log::error('Fayda token exchange failed', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            throw new \Exception('Token exchange failed: ' . $response->body());
        }

        return $response->json();
    }

    /**
     * Step 3: Get Verified User Information
     * Fetch the verified identity data [citation:1][citation:4]
     */
    public function getUserInfo(string $accessToken): array
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $accessToken,
        ])->get($this->userinfoEndpoint);

        if (!$response->successful()) {
            Log::error('Fayda userinfo fetch failed', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            throw new \Exception('Failed to fetch user information: ' . $response->body());
        }

        return $response->json();
    }

    /**
     * Validate state parameter
     */
    public function validateState(string $state): bool
    {
        $storedState = session('fayda_verification_state');
        session()->forget('fayda_verification_state');

        return hash_equals($storedState, $state);
    }

    /**
     * Generate PKCE code verifier [citation:4]
     */
    protected function generateCodeVerifier(): string
    {
        return rtrim(strtr(base64_encode(random_bytes(32)), '+/', '-_'), '=');
    }

    /**
     * Generate PKCE code challenge [citation:4]
     */
    protected function generateCodeChallenge(string $codeVerifier): string
    {
        return rtrim(strtr(base64_encode(hash('sha256', $codeVerifier, true)), '+/', '-_'), '=');
    }

    /**
     * Check if in test mode
     */
    public function isTestMode(): bool
    {
        return $this->isTestMode;
    }

    /**
     * Get test credentials
     */
    public function getTestCredentials(): array
    {
        return [
            'fin' => $this->testFinNumber,
            'otp' => $this->testOtp,
        ];
    }
}
