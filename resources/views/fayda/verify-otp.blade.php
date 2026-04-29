@extends('layouts.app')

@section('content')
<div class="container mx-auto px-4 py-8 max-w-md">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <div class="text-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Enter Verification Code</h1>
            <p class="text-gray-600 mt-2">
                We've sent a 6-digit code to your registered
                {{ config('fayda.otp_channels') === 'email' ? 'email address' : 'phone number' }}
            </p>
            <p class="text-sm text-gray-500 mt-1">Fayda ID: {{ substr($fin, 0, 4) . str_repeat('*', 4) . substr($fin, -4) }}</p>
        </div>

        @if(session('error'))
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                {{ session('error') }}
                @if(session('remaining_attempts'))
                    <br><span class="text-sm">{{ session('remaining_attempts') }} attempts remaining</span>
                @endif
            </div>
        @endif

        @if(session('test_otp') && config('fayda.sandbox_mode'))
            <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded mb-4">
                <strong>Sandbox Mode:</strong> Test OTP is <strong>{{ session('test_otp') }}</strong>
            </div>
        @endif

        <form id="otpForm" action="{{ route('fayda.verify-otp') }}" method="POST">
            @csrf

            <div class="mb-4">
                <label for="otp" class="block text-gray-700 font-medium mb-2">Verification Code</label>
                <input type="text"
                       name="otp"
                       id="otp"
                       class="w-full px-4 py-2 text-center text-2xl tracking-widest border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="000000"
                       maxlength="6"
                       pattern="\d{6}"
                       autocomplete="off"
                       required>
            </div>

            <div class="mb-4 text-center">
                <div class="text-sm text-gray-600">
                    Code expires in: <span id="timer" class="font-mono font-bold text-red-600"></span>
                </div>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white font-bold py-3 px-4 rounded-lg hover:bg-blue-700 transition duration-200">
                Verify Identity
            </button>
        </form>

        <div class="mt-4 text-center">
            <button id="resendBtn"
                    onclick="resendOtp()"
                    class="text-blue-600 hover:text-blue-800 text-sm disabled:text-gray-400 disabled:cursor-not-allowed"
                    disabled>
                Resend verification code
            </button>
        </div>

        <div class="mt-6 text-center border-t pt-4">
            <a href="{{ route('fayda.verify') }}" class="text-gray-500 hover:text-gray-700 text-sm">
                ← Use a different Fayda ID
            </a>
        </div>
    </div>
</div>

@push('scripts')
<script>
    let countdownInterval;
    const expiresAt = new Date('{{ $expiresAt }}');
    const resendBtn = document.getElementById('resendBtn');
    const timerElement = document.getElementById('timer');

    function updateTimer() {
        const now = new Date();
        const diff = expiresAt - now;

        if (diff <= 0) {
            clearInterval(countdownInterval);
            timerElement.textContent = 'Expired';
            document.getElementById('otpForm').querySelector('button[type="submit"]').disabled = true;
            resendBtn.disabled = false;
            return;
        }

        const minutes = Math.floor(diff / 60000);
        const seconds = Math.floor((diff % 60000) / 1000);
        timerElement.textContent = `${minutes}:${seconds.toString().padStart(2, '0')}`;
    }

    function resendOtp() {
        resendBtn.disabled = true;
        resendBtn.textContent = 'Sending...';

        fetch('{{ route("fayda.resend-otp") }}', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Refresh page to show new timer and OTP info
                window.location.reload();
            } else {
                alert(data.error || 'Failed to resend code');
                resendBtn.disabled = false;
                resendBtn.textContent = 'Resend verification code';
            }
        })
        .catch(error => {
            alert('Network error. Please try again.');
            resendBtn.disabled = false;
            resendBtn.textContent = 'Resend verification code';
        });
    }

    // Start timer
    updateTimer();
    countdownInterval = setInterval(updateTimer, 1000);

    // Auto-resend capability check
    const canResend = {{ $resendAvailable ? 'true' : 'false' }};
    if (canResend) {
        resendBtn.disabled = false;
    }
</script>
@endpush
@endsection
