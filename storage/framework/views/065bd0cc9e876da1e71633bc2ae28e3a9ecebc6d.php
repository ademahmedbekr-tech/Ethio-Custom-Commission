<?php $__env->startSection('content'); ?>
    <div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    
                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Total Employees</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalCount ?? ($employees->total() ?? 0)); ?></h4>
                                        <p class="text-success mb-0">(+<?php echo e($activePercentage ?? 0); ?>%)</p>
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
                                        <h4 class="mb-0 me-2"><?php echo e($maleCount ?? 0); ?> / <?php echo e($femaleCount ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($withDisability ?? 0); ?></h4>
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
                                        <h4 class="mb-0 me-2"><?php echo e($inactiveCount ?? 0); ?></h4>
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

                    
                    <?php if(session('success')): ?>
                        <div class="alert alert-success alert-dismissible">
                            <?php echo e(session('success')); ?>

                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <?php if(session('error')): ?>
                        <div class="alert alert-danger alert-dismissible">
                            <?php echo e(session('error')); ?>

                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <?php if(session('warning')): ?>
                        <div class="alert alert-warning alert-dismissible">
                            <?php echo e(session('warning')); ?>

                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    
                    <?php if(session('import_errors')): ?>
                        <div class="alert alert-danger">
                            <h5>Import Errors:</h5>
                            <ul>
                                <?php $__currentLoopData = session('import_errors'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <li><?php echo e($error); ?></li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                    <?php endif; ?>

                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary d-flex justify-content-between align-items-center">
                                <h4 class="card-title mb-0"><?php echo $__env->yieldContent('title', 'Employees Management'); ?></h4>

                                
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link <?php echo e(!request('status') || request('status') == 'active' ? 'active' : ''); ?>"
                                            href="<?php echo e(request()->fullUrlWithQuery(['status' => 'active', 'page' => 1])); ?>">
                                            Active
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link <?php echo e(request('status') == 'inactive' ? 'active' : ''); ?>"
                                            href="<?php echo e(request()->fullUrlWithQuery(['status' => 'inactive', 'page' => 1])); ?>">
                                            Inactive
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link <?php echo e(request('status') == 'all' ? 'active' : ''); ?>"
                                            href="<?php echo e(request()->fullUrlWithQuery(['status' => 'all', 'page' => 1])); ?>">
                                            All
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="card-body">
                                
                                <div class="row mb-3">
                                    
                                    <div class="col-md-6">
                                        <form method="GET" action="<?php echo e(url()->current()); ?>" class="row g-2">
                                            <div class="col-md-3">
                                                <select name="job_title" class="form-select form-select-sm">
                                                    <option value="">All Jobs</option>
                                                    <?php $__currentLoopData = $jobTitles ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $title): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($title); ?>"
                                                            <?php echo e(request('job_title') == $title ? 'selected' : ''); ?>>
                                                            <?php echo e($title); ?>

                                                        </option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <select name="region" class="form-select form-select-sm">
                                                    <option value="">All Regions</option>
                                                    <?php $__currentLoopData = $regions ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $region): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($region); ?>"
                                                            <?php echo e(request('region') == $region ? 'selected' : ''); ?>>
                                                            <?php echo e($region); ?>

                                                        </option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select name="gender" class="form-select form-select-sm">
                                                    <option value="">Gender</option>
                                                    <option value="Male"
                                                        <?php echo e(request('gender') == 'Male' ? 'selected' : ''); ?>>Male</option>
                                                    <option value="Female"
                                                        <?php echo e(request('gender') == 'Female' ? 'selected' : ''); ?>>Female
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <select name="education_level" class="form-select form-select-sm">
                                                    <option value="">Education</option>
                                                    <?php $__currentLoopData = $educationLevels ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $level): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($level); ?>"
                                                            <?php echo e(request('education_level') == $level ? 'selected' : ''); ?>>
                                                            <?php echo e($level); ?>

                                                        </option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="btn btn-sm btn-primary w-100">Filter</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="<?php echo $__env->yieldContent('import'); ?>" method="POST" enctype="multipart/form-data">
                                            <?php echo csrf_field(); ?>
                                            <div class="d-flex gap-2">
                                                <input type="file" name="file" class="form-control">
                                                <button class="btn btn-sm btn-primary">
                                                    Import
                                                </button>
                                            </div>


                                        </form>

                                    </div>


                                    
                                    <div class="col-md-4 text-end">
                                        
                                        <a href="emp/<?php echo e($zone); ?>"
                                            class="btn btn-sm btn-info">
                                            <i class="bx bx-download"></i> Export
                                        </a>

                                        
                                        <a href="<?php echo e(route('employees.create')); ?>" class="btn btn-sm btn-primary">
                                            <i class="bx bx-plus"></i> Add
                                        </a>
                                    </div>
                                </div>

                                
                                

                                
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <form id="bulk-action-form" method="POST"
                                            action="<?php echo e(route('employees.bulk-delete')); ?>" class="d-inline">
                                            <?php echo csrf_field(); ?>
                                            <input type="hidden" name="ids" id="bulk-ids">
                                            <button type="button" class="btn btn-sm btn-danger" onclick="bulkDelete()"
                                                disabled id="bulk-delete-btn">
                                                <i class="bx bx-trash"></i> Delete Selected
                                            </button>
                                        </form>

                                        <?php if(request('status') == 'inactive'): ?>
                                            <form id="bulk-restore-form" method="POST"
                                                action="<?php echo e(route('employees.bulk-activate')); ?>" class="d-inline ms-2">
                                                <?php echo csrf_field(); ?>
                                                <input type="hidden" name="ids" id="bulk-restore-ids">
                                                <button type="button" class="btn btn-sm btn-success"
                                                    onclick="bulkRestore()" disabled id="bulk-restore-btn">
                                                    <i class="bx bx-refresh"></i> Restore Selected
                                                </button>
                                            </form>
                                        <?php endif; ?>
                                    </div>
                                </div>

                                
                                <div class="table-responsive">
                                    <?php echo $__env->yieldContent('table'); ?>
                                </div>

                                
                                <div class="mt-3">
                                    <?php echo e($employees->appends(request()->query())->links('pagination::bootstrap-5')); ?>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
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
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/layouts/components/index.blade.php ENDPATH**/ ?>