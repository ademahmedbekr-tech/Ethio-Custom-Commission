@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <!-- Content -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row invoice-add">
            <!-- Employee Details Card -->
            <div class="col-lg-9 col-12 mb-lg-0 mb-6">
                <div class="card invoice-preview-card p-sm-12 p-6">
                    <div class="card-body invoice-preview-header rounded">
                        <div class="d-flex flex-wrap flex-column flex-sm-row justify-content-between text-heading">
                            <div class="mb-md-0 mb-6">
                                <div class="d-flex svg-illustration mb-6 gap-2 align-items-center">
                                    <span class="app-brand-logo demo">
                                        <img src="{{ asset('Photo/p.png') }}" alt="Logo" style="height: 40px;">
                                    </span>
                                    <span class="app-brand-text demo fw-bold ms-50">Employee Profile</span>
                                </div>
                                <h4 class="mb-2">{{ $employee->employee_name }}</h4>
                                <p class="mb-2">File Number: {{ $employee->file_number }}</p>
                                <p class="mb-2">Job Title: {{ $employee->job_title ?? 'N/A' }}</p>
                                <p class="mb-3">Department: {{ $employee->department ?? 'N/A' }}</p>
                            </div>
                            <div class="col-md-5 col-8 pe-0 ps-0 ps-md-2">
                                <dl class="row mb-0 gx-4">
                                    <dt class="col-sm-5 mb-2 d-md-flex align-items-center justify-content-end">
                                        <span class="h5 text-capitalize mb-0 text-nowrap">Employee ID</span>
                                    </dt>
                                    <dd class="col-sm-7">
                                        <input type="text" class="form-control" disabled value="#{{ $employee->id }}" />
                                    </dd>
                                    <dt class="col-sm-5 mb-1 d-md-flex align-items-center justify-content-end">
                                        <span class="fw-normal">Hire Date:</span>
                                    </dt>
                                    <dd class="col-sm-7">
                                        <input type="text" class="form-control" disabled value="{{ $employee->hire_date ? \Carbon\Carbon::parse($employee->hire_date)->format('d/m/Y') : 'N/A' }}" />
                                    </dd>
                                    <dt class="col-sm-5 d-md-flex align-items-center justify-content-end">
                                        <span class="fw-normal">Years of Service:</span>
                                    </dt>
                                    <dd class="col-sm-7 mb-0">
                                        <input type="text" class="form-control" disabled value="{{ $employee->years_of_service ?? 'N/A' }}" />
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>

                    <!-- Personal Information Section -->
                    <div class="card-body px-0">
                        <div class="row">
                            <div class="col-md-6 col-sm-5 col-12 mb-sm-0 mb-6">
                                <h6>Personal Information</h6>
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">Date of Birth:</td>
                                            <td>{{ $employee->date_of_birth ? \Carbon\Carbon::parse($employee->date_of_birth)->format('d/m/Y') : 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Gender:</td>
                                            <td>{{ $employee->gender == 'ወ' ? 'ወንድ' : ($employee->gender == 'ሴ' ? 'ሴት' : 'N/A') }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Marital Status:</td>
                                            <td>{{ $employee->marital_status ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Ethnicity:</td>
                                            <td>{{ $employee->ethnicity ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Religion:</td>
                                            <td>{{ $employee->religion ?? 'N/A' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6 col-sm-7">
                                <h6>Contact Information</h6>
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">Phone:</td>
                                            <td>{{ $employee->phone_number ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Email:</td>
                                            <td>{{ $employee->email ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Region:</td>
                                            <td>{{ $employee->region ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Zone:</td>
                                            <td>{{ $employee->zone ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">District:</td>
                                            <td>{{ $employee->district ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">House Number:</td>
                                            <td>{{ $employee->house_number ?? 'N/A' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <hr class="mt-0 mb-6" />

                    <!-- Education Section -->
                    <div class="card-body px-0">
                        <h6>Education Information</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">Education Level:</td>
                                            <td>{{ $employee->education_level ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Education Type:</td>
                                            <td>{{ $employee->education_type ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Institution:</td>
                                            <td>{{ $employee->institution ?? 'N/A' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">CGPA:</td>
                                            <td>{{ $employee->cgpa ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Graduation Date:</td>
                                            <td>{{ $employee->graduation_date ? \Carbon\Carbon::parse($employee->graduation_date)->format('d/m/Y') : 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">COC Certificate:</td>
                                            <td>{{ $employee->coc_certificate ? 'Yes' : 'No' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <hr class="my-0" />

                    <!-- Compensation Section -->
                    <div class="card-body px-0">
                        <div class="row row-gap-4">
                            <div class="col-md-6 mb-md-0 mb-4">
                                <h6>Compensation Details</h6>
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">Job Level:</td>
                                            <td>{{ $employee->job_level ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Step:</td>
                                            <td>{{ $employee->step ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Salary:</td>
                                            <td>{{ $employee->salary ? number_format($employee->salary, 2) : 'N/A' }} ETB</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Allowance:</td>
                                            <td>{{ $employee->allowance ? number_format($employee->allowance, 2) : 'N/A' }} ETB</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Housing Allowance:</td>
                                            <td>{{ $employee->housing_allowance ? number_format($employee->housing_allowance, 2) : 'N/A' }} ETB</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h6>Other Information</h6>
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">Pension ID:</td>
                                            <td>{{ $employee->pension_id ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Assignment Date:</td>
                                            <td>{{ $employee->assignment_date ? \Carbon\Carbon::parse($employee->assignment_date)->format('d/m/Y') : 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Disability Type:</td>
                                            <td>{{ $employee->disability_type ?? 'N/A' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <hr class="my-0" />

                    <!-- Work Experience Section -->
                    <div class="card-body px-0 pb-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h6 class="mb-0">Work Experience</h6>
                                    <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-sm btn-primary">
                                        <i class="bx bx-plus"></i> Add Experience
                                    </a>
                                </div>

                                @if($employee->experiences && $employee->experiences->count() > 0)
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
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
                                            @foreach($employee->experiences->sortBy('display_order') as $index => $exp)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $exp->job_title ?? 'N/A' }}</td>
                                                <td>{{ $exp->institution ?? 'N/A' }}</td>
                                                <td>{{ $exp->from_date ? \Carbon\Carbon::parse($exp->from_date)->format('d/m/Y') : 'N/A' }}</td>
                                                <td>
                                                    @if($exp->to_date)
                                                        {{ \Carbon\Carbon::parse($exp->to_date)->format('d/m/Y') }}
                                                    @elseif($exp->experience_type == 'current')
                                                        <span class="badge bg-success">Present</span>
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                                <td>
                                                    @php
                                                        $start = $exp->from_date ? \Carbon\Carbon::parse($exp->from_date) : null;
                                                        $end = $exp->to_date ? \Carbon\Carbon::parse($exp->to_date) : ($exp->experience_type == 'current' ? \Carbon\Carbon::now() : null);
                                                        if($start && $end) {
                                                            $diff = $start->diff($end);
                                                            echo $diff->y . ' yrs ' . $diff->m . ' mos';
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
                                                        <button class="btn btn-sm btn-icon dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
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
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li>
                                                                <a class="dropdown-item text-danger" href="#" onclick="event.preventDefault(); if(confirm('Are you sure?')) document.getElementById('delete-exp-{{ $exp->id }}').submit();">
                                                                    <i class="bx bx-trash"></i> Delete
                                                                </a>
                                                                <form id="delete-exp-{{ $exp->id }}" action="{{ route('experiences.destroy', $exp->id) }}" method="POST" style="display: none;">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                </form>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                @else
                                <div class="text-center py-4">
                                    <i class="bx bx-briefcase-alt bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No work experience records found.</p>
                                    <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-plus"></i> Add First Experience
                                    </a>
                                </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    <hr class="my-0" />

                    <!-- Additional Information -->
                    <div class="card-body px-0 pb-0">
                        <div class="row">
                            <div class="col-12">
                                <h6>Additional Information</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td class="pe-4 fw-medium">Diagnosis:</td>
                                                    <td>{{ $employee->diagnosis ?? 'N/A' }}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-6">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td class="pe-4 fw-medium">Created At:</td>
                                                    <td>{{ $employee->created_at ? \Carbon\Carbon::parse($employee->created_at)->format('d/m/Y H:i') : 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pe-4 fw-medium">Last Updated:</td>
                                                    <td>{{ $employee->updated_at ? \Carbon\Carbon::parse($employee->updated_at)->format('d/m/Y H:i') : 'N/A' }}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Employee Actions Sidebar -->
            <div class="col-lg-3 col-12 invoice-actions">
                <div class="card mb-6">
                    <div class="card-body">
                        <a href="{{ route('employees.edit', $employee->id) }}" class="btn btn-primary d-grid w-100 mb-4">
                            <span class="d-flex align-items-center justify-content-center text-nowrap">
                                <i class="bx bx-edit icon-xs me-2"></i>Edit Employee
                            </span>
                        </a>
                        <a href="{{ route('employees.pdf', $employee->id) }}" target="_blank" class="btn btn-label-secondary d-grid w-100 mb-4">
                            <i class="bx bx-download me-2"></i>Export to PDF
                        </a>
                        <a href="{{ route('experiences.create', ['employee_id' => $employee->id]) }}" class="btn btn-label-secondary d-grid w-100 mb-4">
                            <i class="bx bx-briefcase me-2"></i>Add Experience
                        </a>
                        <button type="button" class="btn btn-label-danger d-grid w-100" onclick="event.preventDefault(); if(confirm('Are you sure you want to delete this employee? This action cannot be undone.')) document.getElementById('delete-employee-form').submit();">
                            <i class="bx bx-trash me-2"></i>Delete Employee
                        </button>
                        <form id="delete-employee-form" action="{{ route('employees.destroy', $employee->id) }}" method="POST" style="display: none;">
                            @csrf
                            @method('DELETE')
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h6>Quick Stats</h6>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Total Experiences:</span>
                            <span class="fw-medium">{{ $employee->experiences->count() }}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Current Position:</span>
                            <span class="fw-medium">{{ $employee->current_job_title ?? 'N/A' }}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Years of Service:</span>
                            <span class="fw-medium">{{ $employee->years_of_service ?? 'N/A' }}</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <span>Status:</span>
                            <span class="badge bg-success">Active</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / Content -->

    <div class="content-backdrop fade"></div>
</div>
@endsection

@push('styles')
<style>
    .table-borderless td, .table-borderless th {
        border: none;
        padding: 8px 0;
    }
    .table-borderless td:first-child {
        width: 40%;
    }
    .invoice-preview-card {
        background: #fff;
    }
    .badge.bg-success {
        background-color: #28a745 !important;
    }
    .badge.bg-secondary {
        background-color: #6c757d !important;
    }
</style>
@endpush
