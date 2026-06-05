@extends('layouts.app')

@section('title', 'Create Branch')

@section('content')

<div class="card shadow-sm border-0">
    <div class="card-header d-flex justify-content-between align-items-center bg-transparent border-0 pt-4 px-4">
        <h4 class="mb-0 font-weight-bold text-dark">Register New Branch Office</h4>
        <a href="{{ route('branches.index') }}" class="btn btn-secondary px-3 shadow-sm">
            <i class="fas fa-arrow-left mr-1"></i> Back
        </a>
    </div>

    <div class="card-body px-4 pb-4">
        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show border-0 shadow-sm mb-4" role="alert">
                <ul class="mb-0 font-weight-bold">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <form action="{{ route('branches.store') }}" method="POST">
            @csrf

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Name <span class="text-danger">*</span></label>
                    <input type="text"
                           name="name"
                           class="form-control @error('name') is-invalid @enderror"
                           value="{{ old('name') }}"
                           placeholder="e.g., የሞጆ ጉምሩክ ቅ/ጽ/ቤት / Mojo Customs Branch"
                           required>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">
                        Branch Code <span class="text-danger">*</span>
                    </label>
                    <input type="text"
                           name="code"
                           class="form-control font-monospace @error('code') is-invalid @enderror"
                           value="{{ old('code') }}"
                           placeholder="e.g., ECC-MOJ"
                           required>
                    <div class="form-text text-muted small">Critical unique identifier used to lock down historical records and logs.</div>
                    @error('code')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Operational Type <span class="text-danger">*</span></label>
                    <select name="branch_type" class="form-select @error('branch_type') is-invalid @enderror" required>
                        <option value="" selected disabled>Select Type</option>
                        <option value="Head Office" {{ old('branch_type') == 'Head Office' ? 'selected' : '' }}>
                            Head Office (Exclusive Directorate Structure)
                        </option>
                        <option value="Dry Port" {{ old('branch_type') == 'Dry Port' ? 'selected' : '' }}>
                            Dry Port (Regional Work Process Structure)
                        </option>
                        <option value="Airport Customs" {{ old('branch_type') == 'Airport Customs' ? 'selected' : '' }}>
                            Airport Customs
                        </option>
                        <option value="Border Office" {{ old('branch_type') == 'Border Office' ? 'selected' : '' }}>
                            Border Office
                        </option>
                        <option value="Regional Office" {{ old('branch_type') == 'Regional Office' ? 'selected' : '' }}>
                            Regional Office
                        </option>
                    </select>
                    @error('branch_type')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Region</label>
                    <input type="text"
                           name="region"
                           class="form-control"
                           placeholder="e.g., Oromia, Addis Ababa"
                           value="{{ old('region') }}">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">City</label>
                    <input type="text"
                           name="city"
                           class="form-control"
                           placeholder="e.g., Mojo"
                           value="{{ old('city') }}">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Phone Contact</label>
                    <input type="text"
                           name="phone"
                           class="form-control"
                           placeholder="e.g., +251..."
                           value="{{ old('phone') }}">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Email Address</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           placeholder="e.g., branch@customs.gov.et"
                           value="{{ old('email') }}">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Operational Status</label>
                    <select name="is_active" class="form-select">
                        <option value="1" {{ old('is_active', '1') == '1' ? 'selected' : '' }}>
                            Active (Online and accepting data routing)
                        </option>
                        <option value="0" {{ old('is_active') == '0' ? 'selected' : '' }}>
                            Inactive (Offline)
                        </option>
                    </select>
                </div>

                <div class="col-md-12 mb-4">
                    <label class="form-label font-weight-bold text-dark">Physical Address Description</label>
                    <textarea name="address"
                              rows="3"
                              class="form-control"
                              placeholder="Describe physical building parameters or landmarks...">{{ old('address') }}</textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary px-4 shadow-sm">
                <i class="fas fa-plus-circle mr-1"></i> Register Branch
            </button>
        </form>
    </div>
</div>

@endsection
