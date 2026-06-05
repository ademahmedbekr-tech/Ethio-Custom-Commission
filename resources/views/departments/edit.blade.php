@extends('layouts.app')

@section('content')
    <div class="card shadow-sm border-0">
        <div class="card-header bg-transparent d-flex justify-content-between align-items-center pt-4 px-4">
            <h4 class="mb-0 font-weight-bold text-dark">Edit Department</h4>
            <a href="{{ route('departments.index') }}" class="btn btn-secondary btn-sm shadow-sm">
                <i class="fas fa-arrow-left mr-1"></i> Back
            </a>
        </div>

        <div class="card-body px-4 pb-4">
            <form action="{{ route('departments.update', $department->id) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Office <span class="text-danger">*</span></label>
                    <select name="branch_id" id="branch_selector" class="form-select" required>
                        <option value="" disabled>Select Branch</option>
                        @foreach($branch as $branches)
                            <option value="{{ $branches->id }}"
                                {{ old('branch_id', $department->branch_id) == $branches->id ? 'selected' : '' }}>
                                {{ $branches->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Directorate <span class="text-danger">*</span></label>
                    <select name="directorate_id" id="directorate_selector" class="form-select" required>
                        <option value="" disabled>Select Directorate</option>
                        @foreach($directorates as $dir)
                            <option value="{{ $dir->id }}"
                                {{ old('directorate_id', $department->directorate_id) == $dir->id ? 'selected' : '' }}>
                                {{ $dir->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Department Name <span class="text-danger">*</span></label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           value="{{ old('name', $department->name) }}"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Department Code <span class="text-danger">*</span></label>
                    <input type="text"
                           name="code"
                           class="form-control"
                           value="{{ old('code', $department->code) }}"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Description</label>
                    <textarea name="description" class="form-control" rows="3">{{ old('description', $department->description) }}</textarea>
                </div>

                <button type="submit" class="btn btn-primary px-4 shadow-sm">
                    <i class="fas fa-save mr-1"></i> Update Department
                </button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#branch_selector').on('change', function() {
                var branchId = $(this).val();

                // Clear the target selector and inject a loading state flag
                $('#directorate_selector')
                    .empty()
                    .append('<option value="" selected disabled>Loading Directorates...</option>')
                    .prop('disabled', false);

                if (branchId) {
                    $.ajax({
                        url: '/ajax/branches/' + branchId + '/directorates',
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            $('#directorate_selector').empty().append('<option value="" selected disabled>Select Directorate</option>');

                            if(data.length > 0) {
                                $.each(data, function(key, directorate) {
                                    $('#directorate_selector').append('<option value="' + directorate.id + '">' + directorate.name + '</option>');
                                });
                            } else {
                                $('#directorate_selector').empty().append('<option value="" selected disabled>No Directorates assigned to this branch</option>');
                            }
                        },
                        error: function() {
                            $('#directorate_selector').empty().append('<option value="" selected disabled>Error loading records</option>');
                        }
                    });
                }
            });
        });
    </script>
@endsection
