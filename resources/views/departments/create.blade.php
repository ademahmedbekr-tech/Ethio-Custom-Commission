@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header text-black">
                    <i class="bx bx-home-heart"></i> Create New Deaprtment
                </h5>
                <div class="card-body">
                    <form action="{{ route('departments.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <!-- Personal Information Section -->


                        <!-- Work Experience -->
                        <h6 class="text-primary mt-4 mb-3"></h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">

                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Department Name</label>
                                            <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="code" class="form-label">Department Code</label>
                                            <input type="text" class="form-control" id="code" name="code" value="{{ old('code') }}">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card mb-3">

                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="head_id" class="form-label">Department Head</label>
                                            <input type="number" class="form-control" id="head_id" name="head_id" value="{{ old('head_id') }}">

                                    @error('head_id')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="description" class="form-label">Department Description</label>
                                            <textarea class="form-control" id="description" name="description" rows="2">{{ old('description') }}</textarea>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional Information -->

                        <!-- Submit Buttons -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-save"></i> Save
                                </button>
                                <a href="{{ route('departments.index') }}" class="btn btn-secondary">
                                    <i class="bx bx-x"></i> ሰርዝ / Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
