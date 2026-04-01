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
                                        <button class="btn btn-icon me-1" data-bs-target="#editPermissionModal"
                                            data-bs-toggle="modal" data-bs-dismiss="modal">
                                            <i class="icon-base bx bx-edit icon-md"></i>
                                        </button>
                                        <a href="javascript:;" class="btn btn-icon dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="icon-base bx bx-dots-vertical-rounded icon-md"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end m-0">
                                            <a href="javascript:;" class="dropdown-item">Edit</a>
                                            <li>
                                                <form action="<?php echo e(route('permission.destroy', $permissions->id)); ?>" method="POST"
                                                    onsubmit="return confirm('Are you sure?');">
                                                    <?php echo csrf_field(); ?>
                                                    <?php echo method_field('DELETE'); ?>
                                                    <button class="dropdown-item text-danger" type="submit">
                                                        Delete
                                                    </button>
                                                </form>
                                            </li>
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