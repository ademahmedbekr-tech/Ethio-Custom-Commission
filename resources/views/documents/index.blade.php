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
                                    <span class="text-heading">Total Documents</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $totalDocuments ?? 0 }}</h4>
                                        <p class="text-success mb-0">(+{{ $documentGrowth ?? 0 }}%)</p>
                                    </div>
                                    <small class="mb-0">All documents uploaded</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="icon-base bx bx-file icon-lg"></i>
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
                                    <span class="text-heading">Active</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $activeDocuments ?? 0 }}</h4>
                                        <p class="text-success mb-0">Valid</p>
                                    </div>
                                    <small class="mb-0">Current valid documents</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="icon-base bx bx-check-circle icon-lg"></i>
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
                                    <span class="text-heading">Verified</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $verifiedDocuments ?? 0 }}</h4>
                                        <p class="text-success mb-0">Confirmed</p>
                                    </div>
                                    <small class="mb-0">Verified documents</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="icon-base bx bx-shield-alt icon-lg"></i>
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
                                    <span class="text-heading">Expired</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2">{{ $expiredDocuments ?? 0 }}</h4>
                                        <p class="text-danger mb-0">Need renewal</p>
                                    </div>
                                    <small class="mb-0">Expired documents</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-danger">
                                        <i class="icon-base bx bx-error-circle icon-lg"></i>
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
                            @if($employee->document_status)
                            <div class="mt-2">
                                <span class="badge bg-{{ $employee->document_status['completion_percentage'] == 100 ? 'success' : ($employee->document_status['completion_percentage'] >= 50 ? 'warning' : 'danger') }}">
                                    {{ $employee->document_status['completion_percentage'] }}% Complete
                                </span>
                                @if($employee->document_status['missing'] > 0)
                                    <span class="badge bg-danger ms-1">{{ $employee->document_status['missing'] }} Missing Documents</span>
                                @endif
                                @if($employee->document_status['expired'] > 0)
                                    <span class="badge bg-warning ms-1">{{ $employee->document_status['expired'] }} Expired</span>
                                @endif
                            </div>
                            @endif
                        </div>
                        <div>
                            <a href="{{ route('employees.show', $employee->id) }}" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employee
                            </a>
                            <a href="{{ route('document.create', ['employeeid' => $employee->id]) }}" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Upload Document
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            @endif

            <!-- Document Type Quick Stats -->
            @if(isset($documentsByType) && count($documentsByType) > 0)
            <div class="row g-4 mb-6">
                @foreach($documentsByType as $typeId => $docs)
                <div class="col-md-3 col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar">
                                        <span class="avatar-initial rounded bg-label-{{ $loop->index % 6 == 0 ? 'primary' : ($loop->index % 6 == 1 ? 'success' : ($loop->index % 6 == 2 ? 'info' : ($loop->index % 6 == 3 ? 'warning' : ($loop->index % 6 == 4 ? 'danger' : 'secondary')))) }}">
                                            <i class="bx bx-{{
                                                $docs->first()->documentType->slug == 'educational' ? 'book' :
                                                ($docs->first()->documentType->slug == 'hire-history' ? 'briefcase' :
                                                ($docs->first()->documentType->slug == 'national-id' ? 'id-card' :
                                                ($docs->first()->documentType->slug == 'contract' ? 'file' :
                                                ($docs->first()->documentType->slug == 'medical' ? 'plus-medical' :
                                                ($docs->first()->documentType->slug == 'training' ? 'certification' : 'folder')))))
                                            }} icon-lg"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">{{ $docs->first()->documentType->name ?? 'Unknown Type' }}</h6>
                                    <span>{{ $docs->count() }} document(s)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            @endif

            <!-- Missing Documents Alert -->
            @if(isset($documentStatus) && $documentStatus['missing'] > 0)
            <div class="alert alert-warning mb-6" role="alert">
                <div class="d-flex">
                    <div class="me-3">
                        <i class="bx bx-error-circle bx-lg"></i>
                    </div>
                    <div>
                        <h6 class="alert-heading mb-1">Missing Required Documents</h6>
                        <p class="mb-0">The following required documents are missing:
                            {{ implode(', ', $documentStatus['missing_types']->toArray()) }}
                        </p>
                    </div>
                </div>
            </div>
            @endif

            <!-- Documents List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">
                        @if(isset($employee))
                            Documents for {{ $employee->employee_name }}
                        @else
                            All Documents
                        @endif
                    </h5>
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-md-8">
                            <form method="GET" action="{{ route('document.index') }}" class="d-flex gap-2">
                                @if(isset($employee))
                                    <input type="hidden" name="employeeid" value="{{ $employee->id }}">
                                @endif
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bx bx-search"></i></span>
                                    <input type="text" name="search" class="form-control"
                                        placeholder="Search by name, type, employee..."
                                        value="{{ request('search') }}">
                                </div>
                                <select name="document_type" class="form-select" style="max-width: 200px;">
                                    <option value="">All Types</option>
                                    @foreach($documentTypes as $type)
                                        <option value="{{ $type->slug }}" {{ request('document_type') == $type->slug ? 'selected' : '' }}>
                                            {{ $type->name }}
                                        </option>
                                    @endforeach
                                </select>
                                <select name="status" class="form-select" style="max-width: 150px;">
                                    <option value="">All Status</option>
                                    <option value="expired" {{ request('status') == 'expired' ? 'selected' : '' }}>Expired</option>
                                    <option value="expiring_soon" {{ request('status') == 'expiring_soon' ? 'selected' : '' }}>Expiring Soon</option>
                                    <option value="verified" {{ request('status') == 'verified' ? 'selected' : '' }}>Verified</option>
                                </select>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-filter"></i> Filter
                                </button>
                                @if(request('search') || request('document_type') || request('status'))
                                    <a href="{{ route('document.index', isset($employee) ? ['employeeid' => $employee->id] : []) }}"
                                       class="btn btn-secondary">
                                        <i class="bx bx-reset"></i> Reset
                                    </a>
                                @endif
                            </form>
                        </div>
                        <div class="col-md-4 text-end">
                            @if(isset($employee))
                            <a href="{{ route('document.create', ['employeeid' => $employee->id]) }}"
                               class="btn btn-sm btn-primary">
                                <i class="bx bx-upload"></i> Upload Document
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

                <div class="card-datatable table-responsive">
                    <table class="datatables-users table border-top table-striped" id="documentsTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                @if(!isset($employee))
                                <th>Employee Name</th>
                                <th>File Number</th>
                                @endif
                                <th>Document Name</th>
                                <th>Type</th>
                                <th>Document Number</th>
                                <th>Issue Date</th>
                                <th>Expiry Date</th>
                                <th>Status</th>
                                <th>File Size</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($documents as $doc)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                @if(!isset($employee))
                                <td>
                                    <strong>{{ $doc->employee->employee_name ?? 'N/A' }}</strong>
                                </td>
                                <td>
                                    <span class="text-muted">{{ $doc->employee->file_number ?? 'N/A' }}</span>
                                </td>
                                @endif
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="me-2">
                                            @php
                                                $iconClass = match($doc->file_type) {
                                                    'pdf' => 'bxs-file-pdf text-danger',
                                                    'doc', 'docx' => 'bxs-file-doc text-primary',
                                                    'jpg', 'jpeg', 'png', 'gif' => 'bxs-file-image text-success',
                                                    default => 'bxs-file text-secondary'
                                                };
                                            @endphp
                                            <i class="bx {{ $iconClass }} bx-sm"></i>
                                        </div>
                                        <div>
                                            <strong>{{ $doc->document_name }}</strong>
                                            @if($doc->is_verified)
                                                <span class="badge bg-info ms-1" title="Verified">
                                                    <i class="bx bx-check-shield"></i>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge bg-label-primary">
                                        {{ $doc->documentType->name ?? 'N/A' }}
                                    </span>
                                </td>
                                <td>{{ $doc->document_number ?? 'N/A' }}</td>
                                <td>{{ $doc->issue_date ? $doc->issue_date->format('M d, Y') : 'N/A' }}</td>
                                <td>
                                    @if($doc->expiry_date)
                                        <span class="{{ $doc->is_expired ? 'text-danger' : ($doc->days_until_expiry <= 30 ? 'text-warning' : '') }}">
                                            {{ $doc->expiry_date->format('M d, Y') }}
                                        </span>
                                        @if($doc->is_expired)
                                            <span class="badge bg-danger ms-1">Expired</span>
                                        @elseif($doc->days_until_expiry <= 30)
                                            <span class="badge bg-warning ms-1">Expiring Soon</span>
                                        @endif
                                    @else
                                        <span class="text-muted">No Expiry</span>
                                    @endif
                                </td>
                                <td>
                                    @if($doc->is_expired)
                                        <span class="badge bg-danger">Expired</span>
                                    @elseif(!$doc->is_active)
                                        <span class="badge bg-secondary">Inactive</span>
                                    @elseif($doc->is_verified)
                                        <span class="badge bg-success">Verified</span>
                                    @else
                                        <span class="badge bg-primary">Active</span>
                                    @endif
                                </td>
                                <td>{{ $doc->formatted_file_size }}</td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button"
                                                data-bs-toggle="dropdown">
                                            Actions
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="{{ route('document.preview', $doc->id) }}"
                                                   target="_blank">
                                                    <i class="bx bx-show"></i> Preview
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ route('document.download', $doc->id) }}">
                                                    <i class="bx bx-download"></i> Download
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ route('document.edit', $doc->id) }}">
                                                    <i class="bx bx-edit"></i> Edit Details
                                                </a>
                                            </li>
                                            @if(!$doc->is_verified)
                                            <li>
                                                <a class="dropdown-item text-success" href="#"
                                                   onclick="event.preventDefault();
                                                   document.getElementById('verify-form-{{ $doc->id }}').submit();">
                                                    <i class="bx bx-check-shield"></i> Verify
                                                </a>
                                                <form id="verify-form-{{ $doc->id }}"
                                                      action="{{ route('document.verify', $doc->id) }}"
                                                      method="POST" style="display: none;">
                                                    @csrf
                                                </form>
                                            </li>
                                            @endif
                                            <li>
                                                <a class="dropdown-item"
                                                   href="{{ route('employees.show', $doc->employeeid) }}">
                                                    <i class="bx bx-user"></i> View Employee
                                                </a>
                                            </li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li>
                                                <a class="dropdown-item text-danger" href="#"
                                                   onclick="event.preventDefault();
                                                   if(confirm('Are you sure you want to delete this document? This cannot be undone.'))
                                                   document.getElementById('delete-form-{{ $doc->id }}').submit();">
                                                    <i class="bx bx-trash"></i> Delete
                                                </a>
                                                <form id="delete-form-{{ $doc->id }}"
                                                      action="{{ route('document.destroy', $doc->id) }}"
                                                      method="POST" style="display: none;">
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
                                <td colspan="{{ isset($employee) ? '11' : '13' }}" class="text-center py-5">
                                    <i class="bx bx-file-blank bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No documents found</p>
                                    @if(isset($employee))
                                    <a href="{{ route('document.create', ['employeeid' => $employee->id]) }}"
                                       class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-upload"></i> Upload First Document
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

                @if(isset($documents) && method_exists($documents, 'links'))
                <div class="mt-3 px-3">
                    {{ $documents->appends(request()->query())->links('pagination::bootstrap-5') }}
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
    // Export functionality
    document.getElementById('exportBtn')?.addEventListener('click', function() {
        let table = document.getElementById('documentsTable');
        let rows = table.getElementsByTagName('tr');
        let csv = [];

        // Get headers
        let headers = [];
        let headerRow = rows[0];
        for (let i = 0; i < headerRow.cells.length - 1; i++) {
            headers.push(headerRow.cells[i].textContent.trim());
        }
        csv.push(headers.join(','));

        // Get data
        for (let i = 1; i < rows.length; i++) {
            let row = rows[i];
            if (row.style.display !== 'none') {
                let rowData = [];
                for (let j = 0; j < row.cells.length - 1; j++) {
                    let cellText = row.cells[j].textContent.trim().replace(/,/g, ';');
                    rowData.push('"' + cellText + '"');
                }
                csv.push(rowData.join(','));
            }
        }

        // Download CSV
        let blob = new Blob([csv.join('\n')], { type: 'text/csv' });
        let link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = 'documents_export.csv';
        link.click();
    });

    // Auto-hide alerts after 5 seconds
    setTimeout(function() {
        let alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(function() {
                alert.remove();
            }, 500);
        });
    }, 5000);
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
        min-width: 180px;
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
    .card {
        transition: transform 0.2s;
    }
    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .badge i {
        font-size: 0.8rem;
        vertical-align: middle;
    }
    .alert {
        animation: slideDown 0.3s ease-in-out;
    }
    @keyframes slideDown {
        from {
            transform: translateY(-20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>
@endpush
