<?php $__env->startSection('model', 'ECC'); ?>
<?php $__env->startSection('count', $count); ?>
<?php $__env->startSection('title', 'Head-Quarter'); ?>
<?php $__env->startSection('insert', 'ECC-HQ'); ?>
<?php $__env->startSection('icons', 'layout'); ?>
<?php $__env->startSection('route', route('zone1.create')); ?>
<?php $__env->startSection('import', route('jigjiga.import')); ?>
<?php $__env->startSection('filterAction', route('zone1.index')); ?>
<?php $__env->startSection('filterName', 'woreda'); ?>
<?php $__env->startSection('filterLabel', 'Woreda'); ?>
<?php $__env->startSection('filterButton', 'Show Data'); ?>
<?php $__env->startSection('exportEnabled', true); ?>

<?php $__env->startSection('exportText', 'export'); ?>

<?php $__env->startSection('table'); ?>

<table class="table table-bordered table-striped" style="font-size: 12px;">
    <thead>
        
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
        <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <!-- EMPLOYEE INFORMATION -->
                <td><?php echo e($employee->id); ?></td>
                <td><?php echo e($employee->file_number ?? 'N/A'); ?></td>

                <td><?php echo e($employee->employee_name ?? 'N/A'); ?></td>
                <td><?php echo e($employee->job_title ?? 'N/A'); ?></td>
                <td><?php echo e($employee->gender ?? 'N/A'); ?></td>
                <td><?php echo e($employee->job_level ?? 'N/A'); ?></td>
                <td><?php echo e($employee->branch_name ?? 'N/A'); ?></td>
                <td><?php echo e($employee->ethnicity ?? 'N/A'); ?></td>
                <td><?php echo e($employee->religion ?? 'N/A'); ?></td>
                <td><?php echo e($employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : 'N/A'); ?></td>
                <td><?php echo e($employee->age ?? 'N/A'); ?></td>
                <td><?php echo e($employee->hire_date ? $employee->hire_date->format('d/m/Y') : 'N/A'); ?></td>
                <td><?php echo e($employee->years_of_service ?? 'N/A'); ?></td>
                <td><?php echo e($employee->pension_id ?? 'N/A'); ?></td>

                <!-- JOB & COMPENSATION -->
                <td><?php echo e($employee->step ?? 'N/A'); ?></td>
                <td><?php echo e($employee->formatSalary()); ?></td>
                <td><?php echo e($employee->allowance ? number_format($employee->allowance, 2) : 'N/A'); ?></td>
                <td><?php echo e($employee->housing_allowance ? number_format($employee->housing_allowance, 2) : 'N/A'); ?></td>
                <td><?php echo e(number_format($employee->total_salary, 2)); ?> ETB</td>

                <!-- PERSONAL & CONTACT -->
                <td><?php echo e($employee->marital_status ?? 'N/A'); ?></td>
                <td><?php echo e($employee->region ?? 'N/A'); ?></td>
                <td><?php echo e($employee->zone ?? 'N/A'); ?></td>
                <td><?php echo e($employee->district ?? 'N/A'); ?></td>
                <td><?php echo e($employee->specific_location ?? 'N/A'); ?></td>
                <td><?php echo e($employee->house_number ?? 'N/A'); ?></td>
                <td><?php echo e($employee->phone_number ?? 'N/A'); ?></td>
                <td><?php echo e($employee->email ?? 'N/A'); ?></td>

                <!-- EDUCATION -->
                <td><?php echo e($employee->education_type ?? 'N/A'); ?></td>
                <td><?php echo e($employee->education_level ?? 'N/A'); ?></td>
                <td><?php echo e($employee->cgpa ?? 'N/A'); ?></td>
                <td><?php echo e($employee->institution ?? 'N/A'); ?></td>
                <td><?php echo e($employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : 'N/A'); ?></td>
                <td>
                    <?php if($employee->coc_certificate): ?>
                        <span class="badge bg-success">Yes</span>
                    <?php else: ?>
                        <span class="badge bg-secondary">No</span>
                    <?php endif; ?>
                </td>
                <td>
                    <?php if($employee->higher_ed_verified): ?>
                        <span class="badge bg-success">Yes</span>
                    <?php else: ?>
                        <span class="badge bg-secondary">No</span>
                    <?php endif; ?>
                </td>

                <!-- WORK EXPERIENCE -->
                <td><?php echo e($employee->current_job_title ?? 'N/A'); ?></td>
                <td><?php echo e($employee->current_institution ?? 'N/A'); ?></td>
                <td><?php echo e($employee->experience_from ? $employee->experience_from->format('d/m/Y') : 'N/A'); ?></td>
                <td><?php echo e($employee->experience_to ? $employee->experience_to->format('d/m/Y') : 'Present'); ?></td>
                <td><?php echo e($employee->experience_duration ?? 'N/A'); ?></td>
                <td><?php echo e($employee->previous_job_title ?? 'N/A'); ?></td>
                <td><?php echo e($employee->previous_institution ?? 'N/A'); ?></td>
                <td><?php echo e($employee->previous_from ? $employee->previous_from->format('d/m/Y') : 'N/A'); ?></td>
                <td><?php echo e($employee->previous_to ? $employee->previous_to->format('d/m/Y') : 'N/A'); ?></td>

                <!-- ADDITIONAL -->
                <td><?php echo e($employee->column_40 ?? 'N/A'); ?></td>
                <td><?php echo e(Str::limit($employee->diagnosis, 15) ?? 'N/A'); ?></td>
                <td><?php echo e($employee->disability_type ?? 'None'); ?></td>
                <td>
                    <?php if($employee->trashed()): ?>
                        <span class="badge bg-danger">Inactive</span>
                    <?php else: ?>
                        <span class="badge bg-success">Active</span>
                    <?php endif; ?>
                </td>

                <!-- ACTIONS -->
                <td>
                    <?php if($employee->photo): ?>
                        <a href="<?php echo e(asset($employee->photo)); ?>" target="_blank" class="btn btn-sm btn-info">
                            <i class="bi bi-image"></i>
                        </a>
                    <?php else: ?>
                        <span class="badge bg-secondary">No</span>
                    <?php endif; ?>
                </td>
                <td>
                    <?php if($employee->document): ?>
                        <a href="<?php echo e(asset($employee->document)); ?>" target="_blank" class="btn btn-sm btn-info">
                            <i class="bi bi-file-text"></i>
                        </a>
                    <?php else: ?>
                        <span class="badge bg-secondary">No</span>
                    <?php endif; ?>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button"
                            id="actionDropdown<?php echo e($employee->id); ?>" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="actionDropdown<?php echo e($employee->id); ?>">
                            <li>
                                <a class="dropdown-item" href="<?php echo e(route('employees.show', $employee->id)); ?>">
                                    <i class="bi bi-eye"></i> View Full Details
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<?php echo e(route('employees.edit', $employee->id)); ?>">
                                    <i class="bi bi-pencil"></i> Edit
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<?php echo e(route('employees.print-card', $employee->id)); ?>">
                                    <i class="bi bi-printer"></i> Print Card
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<?php echo e(route('employees.pdf', $employee->id)); ?>">
                                    <i class="bi bi-printer"></i> Generate PDF
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <?php if($employee->trashed()): ?>
                                <li>
                                    <form action="<?php echo e(route('employees.restore', $employee->id)); ?>" method="POST">
                                        <?php echo csrf_field(); ?> <?php echo method_field('PATCH'); ?>
                                        <button class="dropdown-item text-success">
                                            <i class="bi bi-arrow-counterclockwise"></i> Restore
                                        </button>
                                    </form>
                                </li>
                            <?php else: ?>
                                <li>
                                    <form action="<?php echo e(route('employees.destroy', $employee->id)); ?>" method="POST"
                                        onsubmit="return confirm('Are you sure you want to delete this employee?');">
                                        <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                        <button class="dropdown-item text-danger">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </form>
                                </li>
                            <?php endif; ?>
                        </ul>
                    </div>
                </td>
            </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </tbody>
</table>
<?php $__env->stopSection(); ?>
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

<?php echo $__env->make('layouts.components.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/branches/jigjiga/index.blade.php ENDPATH**/ ?>