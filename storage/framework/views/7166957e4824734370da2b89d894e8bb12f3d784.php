<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row g-6 mb-6">
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Total Departments</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalDepartments); ?></h4>
                                        <p class="text-success mb-0">Total</p>
                                    </div>
                                    <small class="mb-0">All departments</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="icon-base bx bx-building icon-lg"></i>
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
                                    <span class="text-heading">With Department Heads</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($departmentsWithHeads); ?></h4>
                                        <p class="text-success mb-0">Assigned</p>
                                    </div>
                                    <small class="mb-0">Heads assigned</small>
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
                                    <span class="text-heading">Without Department Heads</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($departmentsWithoutHeads); ?></h4>
                                        <p class="text-danger mb-0">Pending</p>
                                    </div>
                                    <small class="mb-0">Need assignment</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="icon-base bx bx-user-x icon-lg"></i>
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
                                    <span class="text-heading">Recent Added</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($recentDepartments); ?></h4>
                                        <p class="text-info mb-0">This month</p>
                                    </div>
                                    <small class="mb-0">New departments</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="icon-base bx bx-calendar-plus icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Users List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">Search Filters</h5>
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-mb-4 align-content-end text-end">
                            <a href="<?php echo e(route('departments.create')); ?>" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add New Department
                            </a>
                        </div>

                    </div>
                </div>
                <div class="card-datatable">
                    <table class="datatables-users table border-top table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Department Name</th>
                                <th>Department Code</th>
                                <th>Description</th>
                                <th>Department Head</th>
                                
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($dept->id); ?></td>
                                    <td><?php echo e($dept->name); ?></td>
                                    <td><?php echo e($dept->code); ?></td>
                                    <td><?php echo e($dept->description); ?></td>
                                    <td><?php echo e($dept->head_id); ?></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <!-- View Button -->
                                            <a href="<?php echo e(route('departments.show', $dept->id)); ?>"
                                                class="btn btn-sm btn-info" title="View Department">
                                                <i class="bx bx-show"></i>
                                            </a>

                                            <!-- Edit Button -->
                                            <a href="<?php echo e(route('departments.edit', $dept->id)); ?>"
                                                class="btn btn-sm btn-primary" title="Edit Department">
                                                <i class="bx bx-edit"></i>
                                            </a>

                                            <!-- Delete Button with Modal Trigger -->
                                            <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteModal<?php echo e($dept->id); ?>" title="Delete Department">
                                                <i class="bx bx-trash"></i>
                                            </button>
                                        </div>

                                        <!-- Delete Confirmation Modal -->
                                        <div class="modal fade" id="deleteModal<?php echo e($dept->id); ?>" tabindex="-1"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Confirm Delete</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete department
                                                        <strong>"<?php echo e($dept->name); ?>"</strong>?
                                                        <br>
                                                        <small class="text-danger">This action cannot be undone.</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Cancel</button>
                                                        <form action="<?php echo e(route('departments.destroy', $dept->id)); ?>"
                                                            method="POST" class="d-inline">
                                                            <?php echo csrf_field(); ?>
                                                            <?php echo method_field('DELETE'); ?>
                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
                <div class="mt-3">
                    <?php echo e($departments->appends(request()->query())->links('pagination::bootstrap-5')); ?>

                </div>
            </div>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <div class="content-backdrop fade"></div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/index.blade.php ENDPATH**/ ?>