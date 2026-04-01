<?php $__env->startSection('content'); ?>
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
                                        <img src="<?php echo e(asset('Photo/p.png')); ?>" alt="Logo" style="height: 40px;">
                                    </span>
                                    <span class="app-brand-text demo fw-bold ms-50">Employee Profile</span>
                                </div>
                                <h4 class="mb-2"><?php echo e($employee->employee_name); ?></h4>
                                <p class="mb-2">File Number: <?php echo e($employee->file_number); ?></p>
                                <p class="mb-2">Job Title: <?php echo e($employee->job_title ?? 'N/A'); ?></p>
                                <p class="mb-3">Department: <?php echo e($employee->department ?? 'N/A'); ?></p>
                            </div>
                            <div class="col-md-5 col-8 pe-0 ps-0 ps-md-2">
                                <dl class="row mb-0 gx-4">
                                    <dt class="col-sm-5 mb-2 d-md-flex align-items-center justify-content-end">
                                        <span class="h5 text-capitalize mb-0 text-nowrap">Employee ID</span>
                                    </dt>
                                    <dd class="col-sm-7">
                                        <input type="text" class="form-control" disabled value="#<?php echo e($employee->id); ?>" />
                                    </dd>
                                    <dt class="col-sm-5 mb-1 d-md-flex align-items-center justify-content-end">
                                        <span class="fw-normal">Hire Date:</span>
                                    </dt>
                                    <dd class="col-sm-7">
                                        <input type="text" class="form-control" disabled value="<?php echo e($employee->hire_date ? \Carbon\Carbon::parse($employee->hire_date)->format('d/m/Y') : 'N/A'); ?>" />
                                    </dd>
                                    <dt class="col-sm-5 d-md-flex align-items-center justify-content-end">
                                        <span class="fw-normal">Years of Service:</span>
                                    </dt>
                                    <dd class="col-sm-7 mb-0">
                                        <input type="text" class="form-control" disabled value="<?php echo e($employee->years_of_service ?? 'N/A'); ?>" />
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
                                            <td><?php echo e($employee->date_of_birth ? \Carbon\Carbon::parse($employee->date_of_birth)->format('d/m/Y') : 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Gender:</td>
                                            <td><?php echo e($employee->gender == 'ወ' ? 'ወንድ' : ($employee->gender == 'ሴ' ? 'ሴት' : 'N/A')); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Marital Status:</td>
                                            <td><?php echo e($employee->marital_status ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Ethnicity:</td>
                                            <td><?php echo e($employee->ethnicity ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Religion:</td>
                                            <td><?php echo e($employee->religion ?? 'N/A'); ?></td>
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
                                            <td><?php echo e($employee->phone_number ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Email:</td>
                                            <td><?php echo e($employee->email ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Region:</td>
                                            <td><?php echo e($employee->region ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Zone:</td>
                                            <td><?php echo e($employee->zone ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">District:</td>
                                            <td><?php echo e($employee->district ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">House Number:</td>
                                            <td><?php echo e($employee->house_number ?? 'N/A'); ?></td>
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
                                            <td><?php echo e($employee->education_level ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Education Type:</td>
                                            <td><?php echo e($employee->education_type ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Institution:</td>
                                            <td><?php echo e($employee->institution ?? 'N/A'); ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td class="pe-4 fw-medium">CGPA:</td>
                                            <td><?php echo e($employee->cgpa ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Graduation Date:</td>
                                            <td><?php echo e($employee->graduation_date ? \Carbon\Carbon::parse($employee->graduation_date)->format('d/m/Y') : 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">COC Certificate:</td>
                                            <td><?php echo e($employee->coc_certificate ? 'Yes' : 'No'); ?></td>
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
                                            <td><?php echo e($employee->job_level ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Step:</td>
                                            <td><?php echo e($employee->step ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Salary:</td>
                                            <td><?php echo e($employee->salary ? number_format($employee->salary, 2) : 'N/A'); ?> ETB</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Allowance:</td>
                                            <td><?php echo e($employee->allowance ? number_format($employee->allowance, 2) : 'N/A'); ?> ETB</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Housing Allowance:</td>
                                            <td><?php echo e($employee->housing_allowance ? number_format($employee->housing_allowance, 2) : 'N/A'); ?> ETB</td>
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
                                            <td><?php echo e($employee->pension_id ?? 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Assignment Date:</td>
                                            <td><?php echo e($employee->assignment_date ? \Carbon\Carbon::parse($employee->assignment_date)->format('d/m/Y') : 'N/A'); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="pe-4 fw-medium">Disability Type:</td>
                                            <td><?php echo e($employee->disability_type ?? 'N/A'); ?></td>
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
                                    <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-sm btn-primary">
                                        <i class="bx bx-plus"></i> Add Experience
                                    </a>
                                </div>

                                <?php if($employee->experiences && $employee->experiences->count() > 0): ?>
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
                                            <?php $__currentLoopData = $employee->experiences->sortBy('display_order'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $exp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td><?php echo e($index + 1); ?></td>
                                                <td><?php echo e($exp->job_title ?? 'N/A'); ?></td>
                                                <td><?php echo e($exp->institution ?? 'N/A'); ?></td>
                                                <td><?php echo e($exp->from_date ? \Carbon\Carbon::parse($exp->from_date)->format('d/m/Y') : 'N/A'); ?></td>
                                                <td>
                                                    <?php if($exp->to_date): ?>
                                                        <?php echo e(\Carbon\Carbon::parse($exp->to_date)->format('d/m/Y')); ?>

                                                    <?php elseif($exp->experience_type == 'current'): ?>
                                                        <span class="badge bg-success">Present</span>
                                                    <?php else: ?>
                                                        N/A
                                                    <?php endif; ?>
                                                </td>
                                                <td>
                                                    <?php
                                                        $start = $exp->from_date ? \Carbon\Carbon::parse($exp->from_date) : null;
                                                        $end = $exp->to_date ? \Carbon\Carbon::parse($exp->to_date) : ($exp->experience_type == 'current' ? \Carbon\Carbon::now() : null);
                                                        if($start && $end) {
                                                            $diff = $start->diff($end);
                                                            echo $diff->y . ' yrs ' . $diff->m . ' mos';
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
                                                        <button class="btn btn-sm btn-icon dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
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
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li>
                                                                <a class="dropdown-item text-danger" href="#" onclick="event.preventDefault(); if(confirm('Are you sure?')) document.getElementById('delete-exp-<?php echo e($exp->id); ?>').submit();">
                                                                    <i class="bx bx-trash"></i> Delete
                                                                </a>
                                                                <form id="delete-exp-<?php echo e($exp->id); ?>" action="<?php echo e(route('experiences.destroy', $exp->id)); ?>" method="POST" style="display: none;">
                                                                    <?php echo csrf_field(); ?>
                                                                    <?php echo method_field('DELETE'); ?>
                                                                </form>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                                <?php else: ?>
                                <div class="text-center py-4">
                                    <i class="bx bx-briefcase-alt bx-lg text-muted"></i>
                                    <p class="mt-2 mb-0">No work experience records found.</p>
                                    <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-sm btn-primary mt-2">
                                        <i class="bx bx-plus"></i> Add First Experience
                                    </a>
                                </div>
                                <?php endif; ?>
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
                                                    <td><?php echo e($employee->diagnosis ?? 'N/A'); ?></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-6">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td class="pe-4 fw-medium">Created At:</td>
                                                    <td><?php echo e($employee->created_at ? \Carbon\Carbon::parse($employee->created_at)->format('d/m/Y H:i') : 'N/A'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td class="pe-4 fw-medium">Last Updated:</td>
                                                    <td><?php echo e($employee->updated_at ? \Carbon\Carbon::parse($employee->updated_at)->format('d/m/Y H:i') : 'N/A'); ?></td>
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
                        <a href="<?php echo e(route('employees.edit', $employee->id)); ?>" class="btn btn-primary d-grid w-100 mb-4">
                            <span class="d-flex align-items-center justify-content-center text-nowrap">
                                <i class="bx bx-edit icon-xs me-2"></i>Edit Employee
                            </span>
                        </a>
                        <a href="<?php echo e(route('employees.pdf', $employee->id)); ?>" target="_blank" class="btn btn-label-secondary d-grid w-100 mb-4">
                            <i class="bx bx-download me-2"></i>Export to PDF
                        </a>
                        <a href="<?php echo e(route('experiences.create', ['employee_id' => $employee->id])); ?>" class="btn btn-label-secondary d-grid w-100 mb-4">
                            <i class="bx bx-briefcase me-2"></i>Add Experience
                        </a>
                        <button type="button" class="btn btn-label-danger d-grid w-100" onclick="event.preventDefault(); if(confirm('Are you sure you want to delete this employee? This action cannot be undone.')) document.getElementById('delete-employee-form').submit();">
                            <i class="bx bx-trash me-2"></i>Delete Employee
                        </button>
                        <form id="delete-employee-form" action="<?php echo e(route('employees.destroy', $employee->id)); ?>" method="POST" style="display: none;">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('DELETE'); ?>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h6>Quick Stats</h6>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Total Experiences:</span>
                            <span class="fw-medium"><?php echo e($employee->experiences->count()); ?></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Current Position:</span>
                            <span class="fw-medium"><?php echo e($employee->current_job_title ?? 'N/A'); ?></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Years of Service:</span>
                            <span class="fw-medium"><?php echo e($employee->years_of_service ?? 'N/A'); ?></span>
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
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/employees/show.blade.php ENDPATH**/ ?>