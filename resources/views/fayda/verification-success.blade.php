@extends('layouts.app')

@section('content')
<div class="container mx-auto px-4 py-8 max-w-2xl">
    <div class="bg-white rounded-lg shadow-lg p-8 text-center">
        <div class="mb-4">
            <div class="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
            </div>
        </div>

        <h1 class="text-2xl font-bold text-gray-800 mb-2">Verification Successful!</h1>
        <p class="text-gray-600 mb-6">Your identity has been verified through Fayda National ID System</p>

        <div class="bg-gray-50 rounded-lg p-6 text-left mb-6">
            <h2 class="font-semibold text-gray-700 mb-3">Verified Information</h2>
            <div class="space-y-2 text-sm">
                <p><span class="text-gray-500">Name:</span> <strong>{{ $user->name }}</strong></p>
                <p><span class="text-gray-500">Fayda ID:</span> <strong>{{ substr($user->fayda_fin, 0, 4) . str_repeat('*', 4) . substr($user->fayda_fin, -4) }}</strong></p>
                <p><span class="text-gray-500">Verified on:</span> <strong>{{ $verificationDate->format('F d, Y \a\t h:i A') }}</strong></p>
            </div>
        </div>

        <div class="flex flex-col sm:flex-row gap-3 justify-center">
            <a href="{{ route('dashboard') }}" class="bg-blue-600 text-white font-bold py-2 px-6 rounded-lg hover:bg-blue-700 transition">
                Go to Dashboard
            </a>
            <a href="{{ route('profile') }}" class="border border-gray-300 text-gray-700 font-bold py-2 px-6 rounded-lg hover:bg-gray-50 transition">
                View Profile
            </a>
        </div>
    </div>
</div>
@endsection
