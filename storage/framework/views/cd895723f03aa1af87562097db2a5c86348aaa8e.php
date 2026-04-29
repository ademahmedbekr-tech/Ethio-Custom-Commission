<?php $__env->startSection('content'); ?>
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
                                        <h4 class="mb-0 me-2"><?php echo e($totalDocuments ?? 0); ?></h4>
                                        <p class="text-success mb-0">(+<?php echo e($documentGrowth ?? 0); ?>%)</p>
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
                                        <h4 class="mb-0 me-2"><?php echo e($activeDocuments ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($verifiedDocuments ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($expiredDocuments ?? 0); ?></h4>
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
            <?php if(isset($employee)): ?>
            <div class="card mb-6">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1"><?php echo e($employee->employee_name); ?></h5>
                            <p class="mb-0 text-muted">File Number: <?php echo e($employee->file_number); ?></p>
                            <?php if($employee->document_status): ?>
                            <div class="mt-2">
                                <span class="badge bg-<?php echo e($employee->document_status['completion_percentage'] == 100 ? 'success' : ($employee->document_status['completion_percentage'] >= 50 ? 'warning' : 'danger')); ?>">
                                    <?php echo e($employee->document_status['completion_percentage']); ?>% Complete
                                </span>
                                <?php if($employee->document_status['missing'] > 0): ?>
                                    <span class="badge bg-danger ms-1"><?php echo e($employee->document_status['missing']); ?> Missing Documents</span>
                                <?php endif; ?>
                                <?php if($employee->document_status['expired'] > 0): ?>
                                    <span class="badge bg-warning ms-1"><?php echo e($employee->document_status['expired']); ?> Expired</span>
                                <?php endif; ?>
                            </div>
                            <?php endif; ?>
                        </div>
                        <div>
                            <a href="<?php echo e(route('employees.show', $employee->id)); ?>" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employee
                            </a>
                            <a href="<?php echo e(route('document.create', ['employeeid' => $employee->id])); ?>" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Upload Document
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <!-- Document Type Quick Stats -->
            <?php if(isset($documentsByType) && count($documentsByType) > 0): ?>
            <div class="row g-4 mb-6">
                <?php $__currentLoopData = $documentsByType; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $typeId => $docs): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-md-3 col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar">
                                        <span class="avatar-initial rounded bg-label-<?php echo e($loop->index % 6 == 0 ? 'primary' : ($loop->index % 6 == 1 ? 'success' : ($loop->index % 6 == 2 ? 'info' : ($loop->index % 6 == 3 ? 'warning' : ($loop->index % 6 == 4 ? 'danger' : 'secondary'))))); ?>">
                                            <i class="bx bx-<?php echo e($docs->first()->documentType->slug == 'educational' ? 'book' :
                                                ($docs->first()->documentType->slug == 'hire-history' ? 'briefcase' :
                                                ($docs->first()->documentType->slug == 'national-id' ? 'id-card' :
                                                ($docs->first()->documentType->slug == 'contract' ? 'file' :
                                                ($docs->first()->documentType->slug == 'medical' ? 'plus-medical' :
                                                ($docs->first()->documentType->slug == 'training' ? 'certification' : 'folder')))))); ?> icon-lg"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1"><?php echo e($docs->first()->documentType->name ?? 'Unknown Type'); ?></h6>
                                    <span><?php echo e($docs->count()); ?> document(s)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <?php endif; ?>

            <!-- Missing Documents Alert -->
            <?php if(isset($documentStatus) && $documentStatus['missing'] > 0): ?>
            <div class="alert alert-warning mb-6" role="alert">
                <div class="d-flex">
                    <div class="me-3">
                        <i class="bx bx-error-circle bx-lg"></i>
                    </div>
                    <div>
                        <h6 class="alert-heading mb-1">Missing Required Documents</h6>
                        <p class="mb-0">The following required documents are missing:
                            <?php echo e(implode(', ', $documentStatus['missing_types']->toArray())); ?>

                        </p>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <!-- Documents List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">
                        <?php if(isset($employee)): ?>
                            Documents for <?php echo e($employee->employee_name); ?>

                        <?php else: ?>
                            All Documents
                        <?php endif; ?>
                    </h5>
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-md-8">
                            <form method="GET" action="<?php echo e(route('document.index')); ?>" class="d-flex gap-2">
                                <?php if(isset($employee)): ?>
                                    <input type="hidden" name="employeeid" value="<?php echo e($employee->id); ?>">
                                <?php endif; ?>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bx bx-search"></i></span>
                                    <input type="text" name="search" class="form-control"
                                        placeholder="Search by name, type, employee..."
                                        value="<?php echo e(request('search')); ?>">
                                </div>
                                <select name="document_type" class="form-select" style="max-width: 200px;">
                                    <option value="">All Types</option>
                                    <?php $__currentLoopData = $documentTypes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($type->slug); ?>" <?php echo e(request('document_type') == $type->slug ? 'selected' : ''); ?>>
                                            <?php echo e($type->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <select name="status" class="form-select" style="max-width: 150px;">
                                    <option value="">All Status</option>
                                    <option value="expired" <?php echo e(request('status') == 'expired' ? 'selected' : ''); ?>>Expired</option>
                                    <option value="expiring_soon" <?php echo e(request('status') == 'expiring_soon' ? 'selected' : ''); ?>>Expiring Soon</option>
                                    <option value="verified" <?php echo e(request('status') == 'verified' ? 'selected' : ''); ?>>Verified</option>
                                </select>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-filter"></i> Filter
                                </button>
                                <?php if(request('search') || request('document_type') || request('status')): ?>
                                    <a href="<?php echo e(route('document.index', isset($employee) ? ['employeeid' => $employee->id] : [])); ?>"
                                       class="btn btn-secondary">
                                        <i class="bx bx-reset"></i> Reset
                                    </a>
                                <?php endif; ?>
                            </form>
                        </div>
                        <div class="col-md-4 text-end">
                            <?php if(isset($employee)): ?>
                            <a href="<?php echo e(route('document.create', ['employeeid' => $employee->id])); ?>"
                               class="btn btn-sm btn-primary">
                                <i class="bx bx-upload"></i> Upload Document
                            </a>
                            <?php else: ?>
                            <a href="<?php echo e(route('employees.index')); ?>" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employees
                            </a>
                            <?php endif; ?>
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
                                <?php if(!isset($employee)): ?>
                                <th>Employee Name</th>
                                <th>File Number</th>
                                <?php endif; ?>
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
                            <?php $__empty_1 = true; $__currentLoopData = $documents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $doc): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td><?php echo e($loop->iteration); ?></td>
                                <?php if(!isset($employee)): ?>
                                <td>
                                    <strong><?php echo e($doc->employee->employee_name ?? 'N/A'); ?></strong>
                                </td>
                                <td>
                                    <span class="text-muted"><?php echo e($doc->employee->file_number ?? 'N/A'); ?></span>
                                </td>
                                <?php endif; ?>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="me-2">
                                            <?php
                                                $iconClass = match($doc->file_type) {
                                                    'pdf' => 'bxs-file-pdf text-danger',
                                                    'doc', 'docx' => 'bxs-file-doc text-primary',
                                                    'jpg', 'jpeg', 'png', 'gif' => 'bxs-file-image text-success',
                                                    default => 'bxs-file text-secondary'
                                                };
                                            ?>
                                            <i class="bx <?php echo e($iconClass); ?> bx-sm"></i>
                                        </div>
                                        <div>
                                            <strong><?php echo e($doc->document_name); ?></strong>
                                            <?php if($doc->is_verified): ?>
                                                <span class="badge bg-info ms-1" title="Verified">
                                                    <i class="bx bx-check-shield"></i>
                                                </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge bg-label-primary">
                                        <?php echo e($doc->documentType->name ?? 'N/A'); ?>

                                    </span>
                                </td>
                                <td><?php echo e($doc->document_number ?? 'N/A'); ?></td>
                                <td><?php echo e($doc->issue_date ? $doc->issue_date->format('M d, Y') : 'N/A'); ?></td>
                                <td>
                                    <?php if($doc->expiry_date): ?>
                                        <span class="<?php echo e($doc->is_expired ? 'text-danger' : ($doc->days_until_expiry <= 30 ? 'text-warning' : '')); ?>">
                                            <?php echo e($doc->expiry_date->format('M d, Y')); ?>

                                        </span>
                                        <?php if($doc->is_expired): ?>
                                            <span class="badge bg-danger ms-1">Expired</span>
                                        <?php elseif($doc->days_until_expiry <= 30): ?>
                                            <span class="badge bg-warning ms-1">Expiring Soon</span>
                                        <?php endif; ?>
                                    <?php else: ?>
                                        <span class="text-muted">No Expiry</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?php if($doc->is_expired): ?>
                                        <span class="badge bg-danger">Expired</span>
                                    <?php elseif(!$doc->is_active): ?>
                                        <span class="badge bg-secondary">Inactive</span>
                                    <?php elseif($doc->is_verified): ?>
                                        <span class="badge bg-success">Verified</span>
                                    <?php else: ?>
                                        <span class="badge bg-primary">Active</span>
                                    <?php endif; ?>
                                </td>
                                <td><?php echo e($doc->formatted_file_size); ?></td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button"
                                                data-bs-toggle="dropdown">
                                            Actions
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('document.preview', $doc->id)); ?>"
                                                   target="_blank">
                                                    <i class="bx bx-show"></i> Preview
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('document.download', $doc->id)); ?>">
                                                    <i class="bx bx-download"></i> Download
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('document.edit', $doc->id)); ?>">
                                                    <i class="bx bx-edit"></i> Edit Details
                                                </a>
                                            </li>
                                            <?php if(!$doc->is_verified): ?>
                                            <li>
                                                <a class="dropdown-item text-success" href="#"
                                                   onclick="event.preventDefault();
                                                   document.getElementById('verify-form-<?php echo e($doc->id); ?>').submit();">
                                                    <i class="bx bx-check-shield"></i> Verify
                                                </a>
                                                <form id="verify-form-<?php echo e($doc->id); ?>"
                                                      action="<?php echo e(route('document.verify', $doc->id)); ?>"
                                                      method="POST" style="display: none;">
                                                    <?php echo csrf_field(); ?>
                                                </form>
                                            </li>
                                            <?php endif; ?>
                                            <li>
                                                <a class="dropdown-item"
                                                   href="<?php echo e(route('employees.show', $doc->employeeid)); ?>">
                                                    <i class="bx bx-user"></i> View Employee
                                                </a>
                                            </li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li>
                                                <a class="dropdown-item text-danger" href="#"
                                                   onclick="event.preventDefault();
                                                   if(confirm('Are you sure you want to delete this document? This cannot be undone.'))
                                                   document.getElementById('delete-form-<?php echo e($doc->id); ?>').submit();">
                                                    <i class="bx bx-trash"></i> Delete
                                                </a>
                                                <form id="delete-form-<?php echo e($doc->id); ?>"
                                                      action="<?php echo e(route('document.destroy', $doc->id)); ?>"
                                                      method="POST" style="display: none;">
                                                    <?php echo csrf_field(); ?>
                                                    <?php echo method_field('DELETE'); ?>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <tr>
                                <td colspan="<?php echo e(isset($employee) ? '11' : '13'); ?>" class="text-center py-5">
                                    <i class="bx bx-file-blank bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No documents found</p>
                                    <?php if(isset($employee)): ?>
                                    <a href="<?php echo e(route('document.create', ['employeeid' => $employee->id])); ?>"
                                       class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-upload"></i> Upload First Document
                                    </a>
                                    <?php else: ?>
                                    <a href="<?php echo e(route('employees.index')); ?>" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-user-plus"></i> Go to Employees
                                    </a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>

                <?php if(isset($documents) && method_exists($documents, 'links')): ?>
                <div class="mt-3 px-3">
                    <?php echo e($documents->appends(request()->query())->links('pagination::bootstrap-5')); ?>

                </div>
                <?php endif; ?>
            </div>
        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
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
<?php $__env->stopPush(); ?>

<?php $__env->startPush('styles'); ?>
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/documents/index.blade.php ENDPATH**/ ?>