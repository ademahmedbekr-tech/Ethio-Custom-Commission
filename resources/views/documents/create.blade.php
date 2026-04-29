@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">

            <!-- Header -->
            <div class="row mb-6">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 class="mb-1">
                                        <i class="bx bx-upload"></i> Upload Document
                                    </h4>
                                    <p class="mb-0 text-muted">
                                        For: {{ $employee->employee_name }} ({{ $employee->file_number }})
                                    </p>
                                </div>
                                <div>
                                    <a href="{{ route('document.index', ['employeeid' => $employee->id]) }}"
                                       class="btn btn-sm btn-secondary">
                                        <i class="bx bx-arrow-back"></i> Back to Documents
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Upload Form -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Document Information</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('document.store') }}"
                                  method="POST"
                                  enctype="multipart/form-data"
                                  id="documentForm">
                                @csrf
                                <input type="hidden" name="employeeid" value="{{ $employee->id }}">

                                <div class="row g-4">
                                    <!-- Document Type -->
                                    <div class="col-md-6">
                                        <label for="document_type_id" class="form-label required">
                                            Document Type <span class="text-danger">*</span>
                                        </label>
                                        <select name="document_type_id"
                                                id="document_type_id"
                                                class="form-select @error('document_type_id') is-invalid @enderror"
                                                required>
                                            <option value="">Select Document Type</option>
                                            @foreach($documentTypes as $type)
                                                <option value="{{ $type->id }}"
                                                    {{ old('document_type_id', isset($selectedType) ? $selectedType->id : '') == $type->id ? 'selected' : '' }}
                                                    data-has-expiry="{{ $type->has_expiry }}">
                                                    {{ $type->name }}
                                                    @if($type->is_required)
                                                        <span class="text-danger">*</span>
                                                    @endif
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('document_type_id')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Document Name -->
                                    <div class="col-md-6">
                                        <label for="document_name" class="form-label">
                                            Document Name <span class="text-danger">*</span>
                                        </label>
                                        <input type="text"
                                               class="form-control @error('document_name') is-invalid @enderror"
                                               id="document_name"
                                               name="document_name"
                                               value="{{ old('document_name') }}"
                                               placeholder="e.g., Bachelor Degree Certificate"
                                               required>
                                        @error('document_name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Document Number -->
                                    <div class="col-md-4">
                                        <label for="document_number" class="form-label">
                                            Document Number
                                        </label>
                                        <input type="text"
                                               class="form-control @error('document_number') is-invalid @enderror"
                                               id="document_number"
                                               name="document_number"
                                               value="{{ old('document_number') }}"
                                               placeholder="e.g., CERT-2024-001">
                                        @error('document_number')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Issuing Authority -->
                                    <div class="col-md-4">
                                        <label for="issuing_authority" class="form-label">
                                            Issuing Authority
                                        </label>
                                        <input type="text"
                                               class="form-control @error('issuing_authority') is-invalid @enderror"
                                               id="issuing_authority"
                                               name="issuing_authority"
                                               value="{{ old('issuing_authority') }}"
                                               placeholder="e.g., University Name">
                                        @error('issuing_authority')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Issue Date -->
                                    <div class="col-md-4">
                                        <label for="issue_date" class="form-label">
                                            Issue Date
                                        </label>
                                        <input type="date"
                                               class="form-control @error('issue_date') is-invalid @enderror"
                                               id="issue_date"
                                               name="issue_date"
                                               value="{{ old('issue_date') }}">
                                        @error('issue_date')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Expiry Date -->
                                    <div class="col-md-4" id="expiryDateField" style="display: none;">
                                        <label for="expiry_date" class="form-label">
                                            Expiry Date
                                        </label>
                                        <input type="date"
                                               class="form-control @error('expiry_date') is-invalid @enderror"
                                               id="expiry_date"
                                               name="expiry_date"
                                               value="{{ old('expiry_date') }}">
                                        @error('expiry_date')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Renewal Date -->
                                    <div class="col-md-4" id="renewalDateField" style="display: none;">
                                        <label for="renewal_date" class="form-label">
                                            Renewal Date
                                        </label>
                                        <input type="date"
                                               class="form-control @error('renewal_date') is-invalid @enderror"
                                               id="renewal_date"
                                               name="renewal_date"
                                               value="{{ old('renewal_date') }}">
                                        @error('renewal_date')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- File Upload -->
                                    <div class="col-md-6">
                                        <label for="document_file" class="form-label">
                                            Document File <span class="text-danger">*</span>
                                        </label>
                                        <input type="file"
                                               class="form-control @error('document_file') is-invalid @enderror"
                                               id="document_file"
                                               name="document_file"
                                               accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.gif"
                                               required>
                                        <small class="text-muted">
                                            Supported formats: PDF, DOC, DOCX, JPG, PNG (Max: 10MB)
                                        </small>
                                        @error('document_file')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- File Preview -->
                                    <div class="col-md-6">
                                        <div id="filePreview" class="border rounded p-3 text-center" style="display: none;">
                                            <i class="bx bx-file bx-lg text-muted"></i>
                                            <p class="mb-0 mt-2" id="fileName"></p>
                                            <small class="text-muted" id="fileSize"></small>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="col-12">
                                        <label for="description" class="form-label">
                                            Description
                                        </label>
                                        <textarea class="form-control @error('description') is-invalid @enderror"
                                                  id="description"
                                                  name="description"
                                                  rows="3"
                                                  placeholder="Additional details about the document">{{ old('description') }}</textarea>
                                        @error('description')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <!-- Remarks -->
                                    <div class="col-12">
                                        <label for="remarks" class="form-label">
                                            Remarks
                                        </label>
                                        <textarea class="form-control @error('remarks') is-invalid @enderror"
                                                  id="remarks"
                                                  name="remarks"
                                                  rows="2"
                                                  placeholder="Any notes or remarks">{{ old('remarks') }}</textarea>
                                        @error('remarks')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>

                                <!-- Submit Buttons -->
                                <div class="mt-4">
                                    <button type="submit" class="btn btn-primary me-2">
                                        <i class="bx bx-upload"></i> Upload Document
                                    </button>
                                    <button type="reset" class="btn btn-secondary me-2">
                                        <i class="bx bx-reset"></i> Reset
                                    </button>
                                    <a href="{{ route('document.index', ['employeeid' => $employee->id]) }}"
                                       class="btn btn-outline-secondary">
                                        <i class="bx bx-x"></i> Cancel
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Existing Documents for Reference -->
            @if($employee->documents->count() > 0)
            <div class="row mt-6">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">
                                Existing Documents ({{ $employee->documents->count() }})
                            </h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Document Name</th>
                                        <th>Issue Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($employee->documents->take(5) as $doc)
                                    <tr>
                                        <td>
                                            <span class="badge bg-label-primary">
                                                {{ $doc->documentType->name ?? 'N/A' }}
                                            </span>
                                        </td>
                                        <td>{{ $doc->document_name }}</td>
                                        <td>{{ $doc->issue_date ? $doc->issue_date->format('M d, Y') : 'N/A' }}</td>
                                        <td>
                                            @if($doc->is_verified)
                                                <span class="badge bg-success">Verified</span>
                                            @else
                                                <span class="badge bg-warning">Pending</span>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            @endif

        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
    </div>
@endsection

@push('scripts')
<script>
    // Toggle expiry date based on document type
    document.getElementById('document_type_id').addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        const hasExpiry = selectedOption.getAttribute('data-has-expiry') === '1';

        document.getElementById('expiryDateField').style.display = hasExpiry ? 'block' : 'none';
        document.getElementById('renewalDateField').style.display = hasExpiry ? 'block' : 'none';

        if (!hasExpiry) {
            document.getElementById('expiry_date').value = '';
            document.getElementById('renewal_date').value = '';
        }
    });

    // Trigger on page load if document type is pre-selected
    document.addEventListener('DOMContentLoaded', function() {
        const typeSelect = document.getElementById('document_type_id');
        if (typeSelect.value) {
            typeSelect.dispatchEvent(new Event('change'));
        }
    });

    // File preview
    document.getElementById('document_file').addEventListener('change', function(e) {
        const file = e.target.files[0];
        const preview = document.getElementById('filePreview');
        const fileName = document.getElementById('fileName');
        const fileSize = document.getElementById('fileSize');

        if (file) {
            preview.style.display = 'block';
            fileName.textContent = file.name;

            // Format file size
            const size = file.size;
            let formattedSize;
            if (size > 1048576) {
                formattedSize = (size / 1048576).toFixed(2) + ' MB';
            } else if (size > 1024) {
                formattedSize = (size / 1024).toFixed(2) + ' KB';
            } else {
                formattedSize = size + ' bytes';
            }
            fileSize.textContent = 'Size: ' + formattedSize;

            // Show image preview if applicable
            if (file.type.match('image.*')) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.innerHTML = `
                        <img src="${e.target.result}" class="img-thumbnail" style="max-height: 200px;">
                        <p class="mb-0 mt-2">${file.name}</p>
                        <small class="text-muted">${formattedSize}</small>
                    `;
                };
                reader.readAsDataURL(file);
            }
        } else {
            preview.style.display = 'none';
        }
    });

    // Form validation
    document.getElementById('documentForm').addEventListener('submit', function(e) {
        const fileInput = document.getElementById('document_file');
        const file = fileInput.files[0];

        if (file && file.size > 10485760) { // 10MB
            e.preventDefault();
            alert('File size must be less than 10MB');
            return false;
        }
    });
</script>
@endpush

@push('styles')
<style>
    .required:after {
        content: " *";
        color: red;
    }
    .card {
        border-radius: 0.5rem;
    }
    .form-label {
        font-weight: 500;
        margin-bottom: 0.5rem;
    }
    #filePreview {
        background-color: #f8f9fa;
        min-height: 100px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .invalid-feedback {
        display: block;
    }
</style>
@endpush
