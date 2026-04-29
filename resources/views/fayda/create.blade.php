@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Fayda Identity Verification</h4>
                </div>

                <div class="card-body">
                    @if(session('error'))
                        <div class="alert alert-danger">{{ session('error') }}</div>
                    @endif

                    @if($testMode)
                        <div class="alert alert-info">
                            <strong>Test Mode Active</strong><br>
                            Use these test credentials:<br>
                            FIN: <code>{{ $testCredentials['fin'] }}</code><br>
                            OTP: <code>{{ $testCredentials['otp'] }}</code>
                        </div>
                    @endif

                    <form method="POST" action="{{ route('fayda.initiate') }}">
                        @csrf

                        <div class="mb-3">
                            <label for="fan" class="form-label">Fayda Alias Number (FAN) / FIN</label>
                            <input type="text"
                                   class="form-control form-control-lg @error('fan') is-invalid @enderror"
                                   id="fan"
                                   name="fan"
                                   value="{{ old('fan') }}"
                                   placeholder="Enter your 12-16 digit FAN or FIN"
                                   required autofocus>
                            <div class="form-text">
                                Your Fayda Alias Number can be found on your digital Fayda credential or the FaydaPass app.
                            </div>
                            @error('fan')
                                <span class="invalid-feedback">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="captcha" class="form-label">Security Verification</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text"
                                           class="form-control @error('captcha') is-invalid @enderror"
                                           id="captcha"
                                           name="captcha"
                                           placeholder="Enter the code below"
                                           required>
                                </div>
                                <div class="col-md-6">
                                    <div class="bg-light p-2 text-center rounded">
                                        {{-- Simple math captcha --}}
                                        @php
                                            $num1 = rand(10, 99);
                                            $num2 = rand(10, 99);
                                            session(['captcha_result' => $num1 + $num2]);
                                        @endphp
                                        <strong class="fs-4">{{ $num1 }} + {{ $num2 }} = ?</strong>
                                        <input type="hidden" name="captcha_expected" value="{{ session('captcha_result') }}">
                                    </div>
                                </div>
                            </div>
                            @error('captcha')
                                <span class="invalid-feedback">{{ $message }}</span>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100">
                            <i class="fas fa-id-card"></i> Proceed to Verification
                        </button>
                    </form>

                    <hr class="my-4">

                    <div class="text-center">
                        <p class="text-muted small mb-0">
                            Your information will be securely verified through the
                            <strong>National ID Program (NIDP)</strong> using the Fayda eSignet system.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
