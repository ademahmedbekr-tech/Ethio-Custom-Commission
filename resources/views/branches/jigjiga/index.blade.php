@extends('layouts.components.index')


@section('model', 'ECC')
@section('count', $count)
@section('title', 'Head-Quarter')
@section('insert', 'ECC-HQ')
@section('icons', 'layout')
@section('route', route('zone1.create'))
@section('import', route('jigjiga.import'))
@section('filterAction', route('zone1.index'))
@section('filterName', 'woreda')
@section('filterLabel', 'Woreda')
@section('filterButton', 'Show Data')
@section('exportEnabled', true)
{{-- @section('exportRoute', url('zoneMember-export/' . $zone . '/' . $woreda)) --}}
@section('exportText', 'export')

@section('table')

<table class="table table-bordered table-striped" style="font-size: 12px;">
    <thead>
        {{-- <tr>
            <th colspan="13" class="bg-primary text-white text-center">EMPLOYEE INFORMATION</th>
            <th colspan="5" class="bg-success text-white text-center">JOB & COMPENSATION</th>
            <th colspan="8" class="bg-info text-white text-center">PERSONAL & CONTACT</th>
            <th colspan="7" class="bg-warning text-white text-center">EDUCATION</th>
            <th colspan="9" class="bg-secondary text-white text-center">WORK EXPERIENCE</th>
            <th colspan="4" class="bg-danger text-white text-center">ADDITIONAL</th>
            <th colspan="3" class="bg-dark text-white text-center">ACTIONS</th>
        </tr> --}}
        <tr>
            <!-- EMPLOYEE INFORMATION (13 columns) -->
            <th>ID</th>
            <th>File No.</th>
            <th>Name</th>
            <th>Job Title</th>
            <th>Gender</th>
            <th>Job Level</th>
            <th>Branch</th>
            <th>Ethnicity</th>
            <th>Religion</th>
            <th>DOB</th>
            <th>Age</th>
            <th>Hire Date</th>
            <th>Years Serv.</th>
            <th>Pension ID</th>

            <!-- JOB & COMPENSATION (5 columns) -->
            <th>Step</th>
            <th>Salary</th>
            <th>Allowance</th>
            <th>Housing</th>
            <th>Total Salary</th>

            <!-- PERSONAL & CONTACT (8 columns) -->
            <th>Marital</th>
            <th>Region</th>
            <th>Zone</th>
            <th>District</th>
            <th>Location</th>
            <th>House #</th>
            <th>Phone</th>
            <th>Email</th>

            <!-- EDUCATION (7 columns) -->
            <th>Edu Type</th>
            <th>Edu Level</th>
            <th>CGPA</th>
            <th>Institution</th>
            <th>Grad Date</th>
            <th>COC</th>
            <th>Higher Ed</th>

            <!-- WORK EXPERIENCE (9 columns) -->
            <th>Current Job</th>
            <th>Current Inst.</th>
            <th>Exp From</th>
            <th>Exp To</th>
            <th>Exp Dur.</th>
            <th>Previous Job</th>
            <th>Previous Inst.</th>
            <th>Prev From</th>
            <th>Prev To</th>

            <!-- ADDITIONAL (4 columns) -->
            <th>Col 40</th>
            <th>Diagnosis</th>
            <th>Disability</th>
            <th>Status</th>

            <!-- ACTIONS (3 columns) -->
            <th>Photo</th>
            <th>Document</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($employees as $employee)
            <tr>
                <!-- EMPLOYEE INFORMATION -->
                <td>{{ $employee->id }}</td>
                <td>{{ $employee->file_number ?? 'N/A' }}</td>

                <td>{{ $employee->employee_name ?? 'N/A' }}</td>
                <td>{{ $employee->job_title ?? 'N/A' }}</td>
                <td>{{ $employee->gender ?? 'N/A' }}</td>
                <td>{{ $employee->job_level ?? 'N/A' }}</td>
                <td>{{ $employee->branch_name ?? 'N/A' }}</td>
                <td>{{ $employee->ethnicity ?? 'N/A' }}</td>
                <td>{{ $employee->religion ?? 'N/A' }}</td>
                <td>{{ $employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : 'N/A' }}</td>
                <td>{{ $employee->age ?? 'N/A' }}</td>
                <td>{{ $employee->hire_date ? $employee->hire_date->format('d/m/Y') : 'N/A' }}</td>
                <td>{{ $employee->years_of_service ?? 'N/A' }}</td>
                <td>{{ $employee->pension_id ?? 'N/A' }}</td>

                <!-- JOB & COMPENSATION -->
                <td>{{ $employee->step ?? 'N/A' }}</td>
                <td>{{ $employee->formatSalary() }}</td>
                <td>{{ $employee->allowance ? number_format($employee->allowance, 2) : 'N/A' }}</td>
                <td>{{ $employee->housing_allowance ? number_format($employee->housing_allowance, 2) : 'N/A' }}</td>
                <td>{{ number_format($employee->total_salary, 2) }} ETB</td>

                <!-- PERSONAL & CONTACT -->
                <td>{{ $employee->marital_status ?? 'N/A' }}</td>
                <td>{{ $employee->region ?? 'N/A' }}</td>
                <td>{{ $employee->zone ?? 'N/A' }}</td>
                <td>{{ $employee->district ?? 'N/A' }}</td>
                <td>{{ $employee->specific_location ?? 'N/A' }}</td>
                <td>{{ $employee->house_number ?? 'N/A' }}</td>
                <td>{{ $employee->phone_number ?? 'N/A' }}</td>
                <td>{{ $employee->email ?? 'N/A' }}</td>

                <!-- EDUCATION -->
                <td>{{ $employee->education_type ?? 'N/A' }}</td>
                <td>{{ $employee->education_level ?? 'N/A' }}</td>
                <td>{{ $employee->cgpa ?? 'N/A' }}</td>
                <td>{{ $employee->institution ?? 'N/A' }}</td>
                <td>{{ $employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : 'N/A' }}</td>
                <td>
                    @if($employee->coc_certificate)
                        <span class="badge bg-success">Yes</span>
                    @else
                        <span class="badge bg-secondary">No</span>
                    @endif
                </td>
                <td>
                    @if($employee->higher_ed_verified)
                        <span class="badge bg-success">Yes</span>
                    @else
                        <span class="badge bg-secondary">No</span>
                    @endif
                </td>

                <!-- WORK EXPERIENCE -->
                <td>{{ $employee->current_job_title ?? 'N/A' }}</td>
                <td>{{ $employee->current_institution ?? 'N/A' }}</td>
                <td>{{ $employee->experience_from ? $employee->experience_from->format('d/m/Y') : 'N/A' }}</td>
                <td>{{ $employee->experience_to ? $employee->experience_to->format('d/m/Y') : 'Present' }}</td>
                <td>{{ $employee->experience_duration ?? 'N/A' }}</td>
                <td>{{ $employee->previous_job_title ?? 'N/A' }}</td>
                <td>{{ $employee->previous_institution ?? 'N/A' }}</td>
                <td>{{ $employee->previous_from ? $employee->previous_from->format('d/m/Y') : 'N/A' }}</td>
                <td>{{ $employee->previous_to ? $employee->previous_to->format('d/m/Y') : 'N/A' }}</td>

                <!-- ADDITIONAL -->
                <td>{{ $employee->column_40 ?? 'N/A' }}</td>
                <td>{{ Str::limit($employee->diagnosis, 15) ?? 'N/A' }}</td>
                <td>{{ $employee->disability_type ?? 'None' }}</td>
                <td>
                    @if($employee->trashed())
                        <span class="badge bg-danger">Inactive</span>
                    @else
                        <span class="badge bg-success">Active</span>
                    @endif
                </td>

                <!-- ACTIONS -->
                <td>
                    @if($employee->photo)
                        <a href="{{ asset($employee->photo) }}" target="_blank" class="btn btn-sm btn-info">
                            <i class="bi bi-image"></i>
                        </a>
                    @else
                        <span class="badge bg-secondary">No</span>
                    @endif
                </td>
                <td>
                    @if($employee->document)
                        <a href="{{ asset($employee->document) }}" target="_blank" class="btn btn-sm btn-info">
                            <i class="bi bi-file-text"></i>
                        </a>
                    @else
                        <span class="badge bg-secondary">No</span>
                    @endif
                </td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button"
                            id="actionDropdown{{ $employee->id }}" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="actionDropdown{{ $employee->id }}">
                            <li>
                                <a class="dropdown-item" href="{{ route('employees.show', $employee->id) }}">
                                    <i class="bi bi-eye"></i> View Full Details
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('employees.edit', $employee->id) }}">
                                    <i class="bi bi-pencil"></i> Edit
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('employees.print-card', $employee->id) }}">
                                    <i class="bi bi-printer"></i> Print Card
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('employees.pdf', $employee->id) }}">
                                    <i class="bi bi-printer"></i> Generate PDF
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            @if($employee->trashed())
                                <li>
                                    <form action="{{ route('employees.restore', $employee->id) }}" method="POST">
                                        @csrf @method('PATCH')
                                        <button class="dropdown-item text-success">
                                            <i class="bi bi-arrow-counterclockwise"></i> Restore
                                        </button>
                                    </form>
                                </li>
                            @else
                                <li>
                                    <form action="{{ route('employees.destroy', $employee->id) }}" method="POST"
                                        onsubmit="return confirm('Are you sure you want to delete this employee?');">
                                        @csrf @method('DELETE')
                                        <button class="dropdown-item text-danger">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </form>
                                </li>
                            @endif
                        </ul>
                    </div>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection
<!-- Add horizontal scrolling for large tables -->
<style>
    .table-responsive {
        overflow-x: auto;
        margin-bottom: 20px;
    }
    .table {
        min-width: 2000px; /* Forces horizontal scroll */
    }
    .badge {
        padding: 3px 6px;
        font-size: 10px;
    }
    .bg-primary { background-color: #007bff !important; }
    .bg-success { background-color: #28a745 !important; }
    .bg-info { background-color: #17a2b8 !important; }
    .bg-warning { background-color: #ffc107 !important; }
    .bg-secondary { background-color: #6c757d !important; }
    .bg-danger { background-color: #dc3545 !important; }
    .bg-dark { background-color: #343a40 !important; }
    .text-white { color: white !important; }
</style>
