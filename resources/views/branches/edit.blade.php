@extends('layouts.app')

@section('title', 'Edit Branch')

@section('content')

<div class="card">

    <div class="card-header d-flex justify-content-between align-items-center">

        <h4 class="mb-0">Edit Branch</h4>

        <a href="{{ route('branches.index') }}"
           class="btn btn-secondary">

            Back

        </a>

    </div>

    <div class="card-body">

        @if ($errors->any())

            <div class="alert alert-danger">

                <ul class="mb-0">

                    @foreach ($errors->all() as $error)

                        <li>{{ $error }}</li>

                    @endforeach

                </ul>

            </div>

        @endif

        <form action="{{ route('branches.update', $branch->id) }}"
              method="POST">

            @csrf
            @method('PUT')

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Branch Name
                    </label>

                    <input type="text"
                           name="name"
                           class="form-control"
                           value="{{ old('name', $branch->name) }}"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Branch Code
                    </label>

                    <input type="text"
                           name="code"
                           class="form-control"
                           value="{{ old('code', $branch->code) }}"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Branch Type
                    </label>

                    <select name="branch_type"
                            class="form-select">

                        <option value="">
                            Select Type
                        </option>

                        <option value="Head Office"
                            {{ $branch->branch_type == 'Head Office' ? 'selected' : '' }}>
                            Head Office
                        </option>

                        <option value="Dry Port"
                            {{ $branch->branch_type == 'Dry Port' ? 'selected' : '' }}>
                            Dry Port
                        </option>

                        <option value="Airport Customs"
                            {{ $branch->branch_type == 'Airport Customs' ? 'selected' : '' }}>
                            Airport Customs
                        </option>

                        <option value="Border Office"
                            {{ $branch->branch_type == 'Border Office' ? 'selected' : '' }}>
                            Border Office
                        </option>

                        <option value="Regional Office"
                            {{ $branch->branch_type == 'Regional Office' ? 'selected' : '' }}>
                            Regional Office
                        </option>

                    </select>

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Region
                    </label>

                    <input type="text"
                           name="region"
                           class="form-control"
                           value="{{ old('region', $branch->region) }}">

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        City
                    </label>

                    <input type="text"
                           name="city"
                           class="form-control"
                           value="{{ old('city', $branch->city) }}">

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Phone
                    </label>

                    <input type="text"
                           name="phone"
                           class="form-control"
                           value="{{ old('phone', $branch->phone) }}">

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Email
                    </label>

                    <input type="email"
                           name="email"
                           class="form-control"
                           value="{{ old('email', $branch->email) }}">

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Status
                    </label>

                    <select name="is_active"
                            class="form-select">

                        <option value="1"
                            {{ $branch->is_active ? 'selected' : '' }}>
                            Active
                        </option>

                        <option value="0"
                            {{ !$branch->is_active ? 'selected' : '' }}>
                            Inactive
                        </option>

                    </select>

                </div>

                <div class="col-md-12 mb-3">

                    <label class="form-label">
                        Address
                    </label>

                    <textarea name="address"
                              rows="4"
                              class="form-control">{{ old('address', $branch->address) }}</textarea>

                </div>

            </div>

            <button type="submit"
                    class="btn btn-primary">

                Update Branch

            </button>

        </form>

    </div>

</div>

@endsection
