<?php
// config/fayda.php

return [
    /*
    |--------------------------------------------------------------------------
    | Fayda IDA Configuration
    |--------------------------------------------------------------------------
    */

    // API Endpoints (Production vs Sandbox)
    'base_url' => env('FAYDA_BASE_URL', 'https://api.fayda.et'),
    'sandbox_mode' => env('FAYDA_SANDBOX_MODE', false),

    // Partner Credentials
    'partner_id' => env('FAYDA_PARTNER_ID'),
    'partner_api_key' => env('FAYDA_PARTNER_API_KEY'),
    'misp_license_key' => env('FAYDA_MISP_LICENSE_KEY'),
    'ida_reference_id' => env('FAYDA_IDA_REFERENCE_ID', 'PARTNER'),

    // PKCS12 Certificate (Required for encryption)
    'p12_certificate_path' => env('FAYDA_P12_CERTIFICATE_PATH'),
    'p12_certificate_password' => env('FAYDA_P12_CERTIFICATE_PASSWORD'),

    // Request Timeouts
    'timeout' => env('FAYDA_TIMEOUT', 30),
    'connect_timeout' => env('FAYDA_CONNECT_TIMEOUT', 10),

    // OTP Settings
    'otp_channels' => env('FAYDA_OTP_CHANNELS', 'email,sms'), // email, sms, or both
    'otp_expiry_minutes' => env('FAYDA_OTP_EXPIRY', 5),

    // SSL Verification (Disable for sandbox only)
    'ssl_verify' => env('FAYDA_SSL_VERIFY', false),

    // Test credentials (Sandbox only)
    'test_fin' => env('FAYDA_TEST_FIN', '701643173984'),
    'test_otp' => env('FAYDA_TEST_OTP', '111111'),
];
