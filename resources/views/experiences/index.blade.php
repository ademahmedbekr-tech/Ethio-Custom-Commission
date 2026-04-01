@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">

            <!-- Stats Cards -->
            <div class="row g-6 mb-6">
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Total Experiences</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $totalExperiences ?? 0 }}</h4>
                                        <p class="text-success mb-0">(+{{ $experienceGrowth ?? 0 }}%)</p>
                                    </div>
                                    <small class="mb-0">All work experiences</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="icon-base bx bx-briefcase icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Current</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $currentExperiences ?? 0 }}</h4>
                                        <p class="text-success mb-0">Active</p>
                                    </div>
                                    <small class="mb-0">Current positions</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="icon-base bx bx-user-check icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Previous</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $previousExperiences ?? 0 }}</h4>
                                        <p class="text-danger mb-0">Past positions</p>
                                    </div>
                                    <small class="mb-0">Completed experiences</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="icon-base bx bx-time icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Total Years</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $totalYears ?? 0 }}</h4>
                                        <p class="text-success mb-0">Experience</p>
                                    </div>
                                    <small class="mb-0">Combined work history</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="icon-base bx bx-calendar icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Employee Info Card -->
            @if(isset($employee))
            <div class="card mb-6">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1">{{ $employee->employee_name }}</h5>
                            <p class="mb-0 text-muted">File Number: {{ $employee->file_number }}</p>
                            <p class="mb-0 text-muted">Current Position: {{ $employee->current_job_title ?? 'Not specified' }}</p>
                        </div>
                        <div>
                            <a href="{{ route('employees.show', $employee->id) }}" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employee
                            </a>
                            <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add Experience
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            @endif

            <!-- Experiences List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">Work Experiences</h5>
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-text"><i class="bx bx-search"></i></span>
                                <input type="text" id="searchInput" class="form-control" placeholder="Search by employee, job title or institution...">
                            </div>
                        </div>
                        <div class="col-md-6 text-end">
                            @if(isset($employee))
                            <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add New Experience
                            </a>
                            @else
                            <a href="{{ route('employees.index') }}" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employees
                            </a>
                            @endif
                            <button type="button" class="btn btn-sm btn-secondary" id="exportBtn">
                                <i class="bx bx-download"></i> Export
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-datatable">
                    <table class="datatables-users table border-top table-striped" id="experiencesTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                @if(!isset($employee))
                                <th>Employee Name</th>
                                <th>File Number</th>
                                @endif
                                <th>Job Title</th>
                                <th>Institution</th>
                                <th>From Date</th>
                                <th>To Date</th>
                                <th>Duration</th>
                                <th>Type</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($experiences as $exp)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                @if(!isset($employee))
                                <td>
                                    <strong>{{ $exp->employee->employee_name ?? 'N/A' }}</strong>
                                </td>
                                <td>
                                    <span class="text-muted">{{ $exp->employee->file_number ?? 'N/A' }}</span>
                                </td>
                                @endif
                                <td>
                                    <strong>{{ $exp->job_title }}</strong>
                                    @if($exp->is_current || $exp->experience_type == 'current')
                                        <span class="badge bg-success ms-1">Current</span>
                                    @endif
                                </td>
                                <td>{{ $exp->institution ?? 'N/A' }}</td>
                                <td>{{ $exp->from_date ? date('M Y', strtotime($exp->from_date)) : 'N/A' }}</td>
                                <td>
                                    @if($exp->to_date)
                                        {{ date('M Y', strtotime($exp->to_date)) }}
                                    @elseif($exp->is_current || $exp->experience_type == 'current')
                                        <span class="badge bg-info">Present</span>
                                    @else
                                        N/A
                                    @endif
                                </td>
                                <td>
                                    @php
                                        $start = $exp->from_date ? new DateTime($exp->from_date) : null;
                                        $end = $exp->to_date ? new DateTime($exp->to_date) : (($exp->is_current || $exp->experience_type == 'current') ? new DateTime() : null);
                                        if ($start && $end) {
                                            $diff = $start->diff($end);
                                            $years = $diff->y;
                                            $months = $diff->m;
                                            if ($years > 0) {
                                                echo $years . ' yr ' . ($months > 0 ? $months . ' mo' : '');
                                            } elseif ($months > 0) {
                                                echo $months . ' months';
                                            } else {
                                                echo '< 1 month';
                                            }
                                        } else {
                                            echo 'N/A';
                                        }
                                    @endphp
                                </td>
                                <td>
                                    @if($exp->experience_type == 'current')
                                        <span class="badge bg-success">Current</span>
                                    @else
                                        <span class="badge bg-secondary">Previous</span>
                                    @endif
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            Actions
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="{{ route('experiences.show', $exp->id) }}">
                                                    <i class="bx bx-show"></i> View
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ route('experiences.edit', $exp->id) }}">
                                                    <i class="bx bx-edit"></i> Edit
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ route('employees.show', $exp->employee_id) }}">
                                                    <i class="bx bx-user"></i> View Employee
                                                </a>
                                            </li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li>
                                                <a class="dropdown-item text-danger" href="#" onclick="event.preventDefault(); if(confirm('Are you sure you want to delete this experience?')) document.getElementById('delete-form-{{ $exp->id }}').submit();">
                                                    <i class="bx bx-trash"></i> Delete
                                                </a>
                                                <form id="delete-form-{{ $exp->id }}" action="{{ route('experiences.destroy', $exp->id) }}" method="POST" style="display: none;">
                                                    @csrf
                                                    @method('DELETE')
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="{{ isset($employee) ? '8' : '10' }}" class="text-center py-5">
                                    <i class="bx bx-briefcase-alt bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No experiences found</p>
                                    @if(isset($employee))
                                    <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-plus"></i> Add First Experience
                                    </a>
                                    @else
                                    <a href="{{ route('employees.index') }}" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-user-plus"></i> Go to Employees
                                    </a>
                                    @endif
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                @if(isset($experiences) && method_exists($experiences, 'links'))
                <div class="mt-3 px-3">
                    {{ $experiences->appends(request()->query())->links('pagination::bootstrap-5') }}
                </div>
                @endif
            </div>
        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
    </div>
@endsection

@push('scripts')
<script>
    // Search functionality
    document.getElementById('searchInput')?.addEventListener('keyup', function() {
        let searchText = this.value.toLowerCase();
        let table = document.getElementById('experiencesTable');
        let rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            let row = rows[i];
            let employeeName = row.cells[1]?.textContent.toLowerCase() || '';
            let fileNumber = row.cells[2]?.textContent.toLowerCase() || '';
            let jobTitle = row.cells[{{ isset($employee) ? '1' : '3' }}]?.textContent.toLowerCase() || '';
            let institution = row.cells[{{ isset($employee) ? '2' : '4' }}]?.textContent.toLowerCase() || '';

            if (employeeName.includes(searchText) ||
                fileNumber.includes(searchText) ||
                jobTitle.includes(searchText) ||
                institution.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    });

    // Export functionality
    document.getElementById('exportBtn')?.addEventListener('click', function() {
        let table = document.getElementById('experiencesTable');
        let rows = table.getElementsByTagName('tr');
        let csv = [];

        // Get headers
        let headers = [];
        let headerRow = rows[0];
        for (let i = 0; i < headerRow.cells.length - 1; i++) {
            headers.push(headerRow.cells[i].textContent);
        }
        csv.push(headers.join(','));

        // Get data
        for (let i = 1; i < rows.length; i++) {
            let row = rows[i];
            if (row.style.display !== 'none') {
                let rowData = [];
                for (let j = 0; j < row.cells.length - 1; j++) {
                    let cellText = row.cells[j].textContent.replace(/,/g, ';');
                    rowData.push('"' + cellText + '"');
                }
                csv.push(rowData.join(','));
            }
        }

        // Download CSV
        let blob = new Blob([csv.join('\n')], { type: 'text/csv' });
        let link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = 'experiences_export.csv';
        link.click();
    });
</script>
@endpush

@push('styles')
<style>
    .badge {
        font-weight: 500;
        padding: 0.35em 0.65em;
    }
    .table th {
        font-weight: 600;
        background-color: #f8f9fa;
    }
    .dropdown-menu {
        min-width: 150px;
    }
    .dropdown-menu .dropdown-item i {
        margin-right: 8px;
    }
    .card-header .input-group {
        max-width: 400px;
    }
    .avatar .bx {
        font-size: 1.5rem;
    }
    .table td {
        vertical-align: middle;
    }
</style>
@endpush
