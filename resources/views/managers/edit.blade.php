@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <h5 class="card-header text-black">
                        <i class="bx bx-home-heart"></i> Create New Manager
                    </h5>
                    <div class="card-body">
                        <form action="{{ route('managers.update', $managers->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')


                            <!-- Personal Information Section -->


                            <!-- Work Experience -->
                            <h6 class="text-primary mt-4 mb-3"></h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card mb-3">

                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Manager Name</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                    value="{{ old('name', $managers->name) }}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="department_id" class="form-label">Manager Department</label>
                                                <select class="form-select" id="department_id" name="department_id">
                                                    <option value="">Select Manager</option>
                                                    @foreach ($department ?? [] as $dept)
                                                      <option value="{{ $dept }}"
                                                        {{ request('department_id') == $dept ? 'selected' : '' }}>
                                                        {{ $dept }}
                                                        </option>
                                                    @endforeach


                                                </select>
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
                                        <a href="{{ route('managers.index') }}" class="btn btn-secondary">
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
