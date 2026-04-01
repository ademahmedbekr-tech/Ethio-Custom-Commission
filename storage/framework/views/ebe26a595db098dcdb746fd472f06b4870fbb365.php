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
                                    <span class="text-heading">Total Experiences</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalExperiences ?? 0); ?></h4>
                                        <p class="text-success mb-0">(+<?php echo e($experienceGrowth ?? 0); ?>%)</p>
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
                                        <h4 class="mb-0 me-2"><?php echo e($currentExperiences ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($previousExperiences ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($totalYears ?? 0); ?></h4>
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
            <?php if(isset($employee)): ?>
            <div class="card mb-6">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1"><?php echo e($employee->employee_name); ?></h5>
                            <p class="mb-0 text-muted">File Number: <?php echo e($employee->file_number); ?></p>
                            <p class="mb-0 text-muted">Current Position: <?php echo e($employee->current_job_title ?? 'Not specified'); ?></p>
                        </div>
                        <div>
                            <a href="<?php echo e(route('employees.show', $employee->id)); ?>" class="btn btn-sm btn-secondary">
                                <i class="bx bx-arrow-back"></i> Back to Employee
                            </a>
                            <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add Experience
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>

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
                            <?php if(isset($employee)): ?>
                            <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add New Experience
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

                <div class="card-datatable">
                    <table class="datatables-users table border-top table-striped" id="experiencesTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <?php if(!isset($employee)): ?>
                                <th>Employee Name</th>
                                <th>File Number</th>
                                <?php endif; ?>
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
                            <?php $__empty_1 = true; $__currentLoopData = $experiences; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $exp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr>
                                <td><?php echo e($loop->iteration); ?></td>
                                <?php if(!isset($employee)): ?>
                                <td>
                                    <strong><?php echo e($exp->employee->employee_name ?? 'N/A'); ?></strong>
                                </td>
                                <td>
                                    <span class="text-muted"><?php echo e($exp->employee->file_number ?? 'N/A'); ?></span>
                                </td>
                                <?php endif; ?>
                                <td>
                                    <strong><?php echo e($exp->job_title); ?></strong>
                                    <?php if($exp->is_current || $exp->experience_type == 'current'): ?>
                                        <span class="badge bg-success ms-1">Current</span>
                                    <?php endif; ?>
                                </td>
                                <td><?php echo e($exp->institution ?? 'N/A'); ?></td>
                                <td><?php echo e($exp->from_date ? date('M Y', strtotime($exp->from_date)) : 'N/A'); ?></td>
                                <td>
                                    <?php if($exp->to_date): ?>
                                        <?php echo e(date('M Y', strtotime($exp->to_date))); ?>

                                    <?php elseif($exp->is_current || $exp->experience_type == 'current'): ?>
                                        <span class="badge bg-info">Present</span>
                                    <?php else: ?>
                                        N/A
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?php
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
                                    ?>
                                </td>
                                <td>
                                    <?php if($exp->experience_type == 'current'): ?>
                                        <span class="badge bg-success">Current</span>
                                    <?php else: ?>
                                        <span class="badge bg-secondary">Previous</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            Actions
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('experiences.show', $exp->id)); ?>">
                                                    <i class="bx bx-show"></i> View
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('experiences.edit', $exp->id)); ?>">
                                                    <i class="bx bx-edit"></i> Edit
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="<?php echo e(route('employees.show', $exp->employee_id)); ?>">
                                                    <i class="bx bx-user"></i> View Employee
                                                </a>
                                            </li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li>
                                                <a class="dropdown-item text-danger" href="#" onclick="event.preventDefault(); if(confirm('Are you sure you want to delete this experience?')) document.getElementById('delete-form-<?php echo e($exp->id); ?>').submit();">
                                                    <i class="bx bx-trash"></i> Delete
                                                </a>
                                                <form id="delete-form-<?php echo e($exp->id); ?>" action="<?php echo e(route('experiences.destroy', $exp->id)); ?>" method="POST" style="display: none;">
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
                                <td colspan="<?php echo e(isset($employee) ? '8' : '10'); ?>" class="text-center py-5">
                                    <i class="bx bx-briefcase-alt bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No experiences found</p>
                                    <?php if(isset($employee)): ?>
                                    <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-plus"></i> Add First Experience
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

                <?php if(isset($experiences) && method_exists($experiences, 'links')): ?>
                <div class="mt-3 px-3">
                    <?php echo e($experiences->appends(request()->query())->links('pagination::bootstrap-5')); ?>

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
    // Search functionality
    document.getElementById('searchInput')?.addEventListener('keyup', function() {
        let searchText = this.value.toLowerCase();
        let table = document.getElementById('experiencesTable');
        let rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            let row = rows[i];
            let employeeName = row.cells[1]?.textContent.toLowerCase() || '';
            let fileNumber = row.cells[2]?.textContent.toLowerCase() || '';
            let jobTitle = row.cells[<?php echo e(isset($employee) ? '1' : '3'); ?>]?.textContent.toLowerCase() || '';
            let institution = row.cells[<?php echo e(isset($employee) ? '2' : '4'); ?>]?.textContent.toLowerCase() || '';

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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/experiences/index.blade.php ENDPATH**/ ?>