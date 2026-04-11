<?php $__env->startSection('content'); ?>
    <!-- Permission Table -->
    <div class="card">
        <div class="card-header border-bottom">
            <h5 class="card-title mb-0">Search Filters</h5>
            <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                <div class="col-mb-4 align-content-end text-end">
                    <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal"
                        data-bs-target="#addPermissionModal">
                        <i class="bx bx-plus"></i> Add New Permission
                    </a>
                </div>


            </div>
        </div>
        <div class="card-datatable table-responsive">
            <table class="table border-top">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Assigned To</th>
                        <th>Created Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__currentLoopData = $permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permissions): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td> <?php echo e($permissions->id); ?> </td>
                            <td> <?php echo e($permissions->name); ?> </td>
                            <td> <?php echo e($permissions->guard_name); ?> </td>
                            <td> <?php echo e($permissions->created_at); ?> </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <span class="text-nowrap">
                                        <button class="btn btn-icon me-1" data-bs-target="#editPermissionModal<?php echo e($permissions->id); ?>"
                                            data-bs-toggle="modal" data-bs-dismiss="modal">
                                            <i class="icon-base bx bx-edit icon-md"></i>
                                        </button>
    <?php echo $__env->make('_partials._modals.modal-edit-permission', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


                                               <!-- Delete Button with Modal Trigger -->
                                            <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deletePermission<?php echo e($permissions->id); ?>" title="Delete Department">
                                                <i class="bx bx-trash"></i>
                                            </button>


                                        <!-- Delete Confirmation Modal -->
                                        <div class="modal fade" id="deletePermission<?php echo e($permissions->id); ?>" tabindex="-1"
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
                                                        <strong>"<?php echo e($permissions->name); ?>"</strong>?
                                                        <br>
                                                        <small class="text-danger">This action cannot be undone.</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Cancel</button>
                                                        <form action="<?php echo e(route('permission.destroy', $permissions->id)); ?>"
                                                            method="POST" class="d-inline">
                                                            <?php echo csrf_field(); ?>
                                                            <?php echo method_field('DELETE'); ?>
                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </span>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </tbody>
            </table>
        </div>
        <?php echo e($permission->appends(request()->query())->links('pagination::bootstrap-5')); ?>


    </div>
    <!--/ Permission Table -->

    <!-- Modal -->
    <?php echo $__env->make('_partials._modals.modal-add-permission', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('_partials._modals.modal-edit-permission', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <!-- /Modal -->
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/acceess_control/permission/index.blade.php ENDPATH**/ ?>