@extends('layouts.app')

@section('content')
    <div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    {{-- STATISTICS CARDS --}}
                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Total Employees</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $totalCount ?? ($employees->total() ?? 0) }}</h4>
                                        <p class="text-success mb-0">(+{{ $activePercentage ?? 0 }}%)</p>
                                    </div>
                                    <small>Active Employees</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="bx bx-group icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Male / Female</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $maleCount ?? 0 }} / {{ $femaleCount ?? 0 }}</h4>
                                        <p class="text-success mb-0">(+0%)</p>
                                    </div>
                                    <small>Gender Distribution</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="bx bx-male-female icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">With Disability</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $withDisability ?? 0 }}</h4>
                                        <p class="text-success mb-0">(+0%)</p>
                                    </div>
                                    <small>Special Needs</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="bx bx-accessibility"></i> </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Inactive</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $inactiveCount ?? 0 }}</h4>
                                        <p class="text-danger mb-0">(-0%)</p>
                                    </div>
                                    <small>Deleted/Inactive</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-danger">
                                        <i class="bx bx-user-minus icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- FLASH MESSAGES --}}
                    @if (session('success'))
                        <div class="alert alert-success alert-dismissible">
                            {{ session('success') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    @endif

                    @if (session('error'))
                        <div class="alert alert-danger alert-dismissible">
                            {{ session('error') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    @endif

                    @if (session('warning'))
                        <div class="alert alert-warning alert-dismissible">
                            {{ session('warning') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    @endif

                    {{-- IMPORT ERRORS --}}
                    @if (session('import_errors'))
                        <div class="alert alert-danger">
                            <h5>Import Errors:</h5>
                            <ul>
                                @foreach (session('import_errors') as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    {{-- MAIN CARD --}}
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary d-flex justify-content-between align-items-center">
                                <h4 class="card-title mb-0">@yield('title', 'Employees Management')</h4>

                                {{-- Status Filter Tabs --}}
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link {{ !request('status') || request('status') == 'active' ? 'active' : '' }}"
                                            href="{{ request()->fullUrlWithQuery(['status' => 'active', 'page' => 1]) }}">
                                            Active
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ request('status') == 'inactive' ? 'active' : '' }}"
                                            href="{{ request()->fullUrlWithQuery(['status' => 'inactive', 'page' => 1]) }}">
                                            Inactive
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ request('status') == 'all' ? 'active' : '' }}"
                                            href="{{ request()->fullUrlWithQuery(['status' => 'all', 'page' => 1]) }}">
                                            All
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="card-body">
                                {{-- FILTERS + ACTIONS --}}
                                <div class="row mb-3">
                                    {{-- FILTERS --}}
                                    <div class="col-md-6">
                                        <form method="GET" action="{{ url()->current() }}" class="row g-2">
                                            <div class="col-md-3">
                                                <select name="job_title" class="form-select form-select-sm">
                                                    <option value="">All Jobs</option>
                                                    @foreach ($jobTitles ?? [] as $title)
                                                        <option value="{{ $title }}"
                                                            {{ request('job_title') == $title ? 'selected' : '' }}>
                                                            {{ $title }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <select name="region" class="form-select form-select-sm">
                                                    <option value="">All Regions</option>
                                                    @foreach ($regions ?? [] as $region)
                                                        <option value="{{ $region }}"
                                                            {{ request('region') == $region ? 'selected' : '' }}>
                                                            {{ $region }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select name="gender" class="form-select form-select-sm">
                                                    <option value="">Gender</option>
                                                    <option value="Male"
                                                        {{ request('gender') == 'Male' ? 'selected' : '' }}>Male</option>
                                                    <option value="Female"
                                                        {{ request('gender') == 'Female' ? 'selected' : '' }}>Female
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select name="education_level" class="form-select form-select-sm">
                                                    <option value="">Education</option>
                                                    @foreach ($educationLevels ?? [] as $level)
                                                        <option value="{{ $level }}"
                                                            {{ request('education_level') == $level ? 'selected' : '' }}>
                                                            {{ $level }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="btn btn-sm btn-primary w-100">Filter</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="@yield('import')" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <div class="d-flex gap-2">
                                                <input type="file" name="file" class="form-control">
                                                <button class="btn btn-sm btn-primary">
                                                    Import
                                                </button>
                                            </div>


                                        </form>

                                    </div>


                                    {{-- ACTION BUTTONS --}}
                                    <div class="col-md-4 text-end">
                                        {{-- EXPORT --}}
                                        <a href="emp/{{$zone }}"
                                            class="btn btn-sm btn-info">
                                            <i class="bx bx-download"></i> Export
                                        </a>

                                        {{-- ADD BUTTON --}}
                                        <a href="{{ route('employees.create') }}" class="btn btn-sm btn-primary">
                                            <i class="bx bx-plus"></i> Add
                                        </a>
                                    </div>
                                </div>

                                {{-- REGION PILLS (if regions exist) --}}
                                {{-- @if (isset($regions) && count($regions) > 0)
                                    <div class="row mb-3">
                                        <div class="col-xl-12">
                                            <div class="nav-align-top">
                                                <ul class="nav nav-pills flex-nowrap overflow-auto gap-1">

                                                    <li class="nav-item">
                                                        <a class="nav-link {{ !request('region_filter') ? 'active' : '' }}"
                                                            href="{{ request()->fullUrlWithQuery(['region_filter' => null, 'page' => 1]) }}">
                                                            All Regions
                                                            <span class="badge bg-success rounded-pill ms-1">
                                                                {{ $totalCount ?? 0 }}
                                                            </span>
                                                        </a>
                                                    </li>

                                                    @foreach ($regionCount as $region)
                                                        <li class="nav-item">
                                                            <a class="nav-link {{ request('region_filter') == $region ? 'active' : '' }}"
                                                                href="{{ request()->fullUrlWithQuery(['region_filter' => $region, 'page' => 1]) }}">
                                                                {{ $region }}
                                                                <span class="badge bg-success rounded-pill ms-1">
                                                                    {{ $rcount[$region] ?? 0 }}
                                                                </span>
                                                            </a>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                @endif --}}

                                {{-- BULK ACTIONS --}}
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <form id="bulk-action-form" method="POST"
                                            action="{{ route('employees.bulk-delete') }}" class="d-inline">
                                            @csrf
                                            <input type="hidden" name="ids" id="bulk-ids">
                                            <button type="button" class="btn btn-sm btn-danger" onclick="bulkDelete()"
                                                disabled id="bulk-delete-btn">
                                                <i class="bx bx-trash"></i> Delete Selected
                                            </button>
                                        </form>

                                        @if (request('status') == 'inactive')
                                            <form id="bulk-restore-form" method="POST"
                                                action="{{ route('employees.bulk-activate') }}" class="d-inline ms-2">
                                                @csrf
                                                <input type="hidden" name="ids" id="bulk-restore-ids">
                                                <button type="button" class="btn btn-sm btn-success"
                                                    onclick="bulkRestore()" disabled id="bulk-restore-btn">
                                                    <i class="bx bx-refresh"></i> Restore Selected
                                                </button>
                                            </form>
                                        @endif
                                    </div>
                                </div>

                                {{-- TABLE --}}
                                <div class="table-responsive">
                                    @yield('table')
                                </div>

                                {{-- PAGINATION --}}
                                <div class="mt-3">
                                    {{ $employees->appends(request()->query())->links('pagination::bootstrap-5') }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- JavaScript for Bulk Actions --}}
    <script>
        function bulkDelete() {
            let selected = [];
            document.querySelectorAll('input[name="employee_ids[]"]:checked').forEach(cb => {
                selected.push(cb.value);
            });

            if (selected.length > 0 && confirm('Delete ' + selected.length + ' employees?')) {
                document.getElementById('bulk-ids').value = JSON.stringify(selected);
                document.getElementById('bulk-action-form').submit();
            }
        }

        function bulkRestore() {
            let selected = [];
            document.querySelectorAll('input[name="employee_ids[]"]:checked').forEach(cb => {
                selected.push(cb.value);
            });

            if (selected.length > 0 && confirm('Restore ' + selected.length + ' employees?')) {
                document.getElementById('bulk-restore-ids').value = JSON.stringify(selected);
                document.getElementById('bulk-restore-form').submit();
            }
        }

        // Enable/disable bulk action buttons based on checkbox selection
        document.addEventListener('DOMContentLoaded', function() {
            const checkboxes = document.querySelectorAll('input[name="employee_ids[]"]');
            const deleteBtn = document.getElementById('bulk-delete-btn');
            const restoreBtn = document.getElementById('bulk-restore-btn');

            function updateBulkButtons() {
                let checked = document.querySelectorAll('input[name="employee_ids[]"]:checked').length;
                if (deleteBtn) deleteBtn.disabled = checked === 0;
                if (restoreBtn) restoreBtn.disabled = checked === 0;
            }

            // Add select all checkbox functionality
            const selectAll = document.getElementById('select-all');
            if (selectAll) {
                selectAll.addEventListener('change', function() {
                    checkboxes.forEach(cb => cb.checked = this.checked);
                    updateBulkButtons();
                });
            }

            checkboxes.forEach(cb => {
                cb.addEventListener('change', updateBulkButtons);
            });
        });
    </script>
@endsection
