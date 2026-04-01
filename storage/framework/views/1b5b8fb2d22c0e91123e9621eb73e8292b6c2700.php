<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <!-- Statistics Cards -->
            <div class="row g-6 mb-6">
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Total Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalRoles); ?></h4>
                                        <p class="text-success mb-0">Total</p>
                                    </div>
                                    <small class="mb-0">All roles in system</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="icon-base bx bxs-group icon-lg"></i>
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
                                    <span class="text-heading">Active Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($activeRoles); ?></h4>
                                        <p class="text-success mb-0">Active</p>
                                    </div>
                                    <small class="mb-0">Currently active</small>
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
                                    <span class="text-heading">Permissions</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalPermissions); ?></h4>
                                        <p class="text-success mb-0">Total</p>
                                    </div>
                                    <small class="mb-0">Available permissions</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="icon-base bx bx-lock-alt icon-lg"></i>
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
                                    <span class="text-heading">Users with Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($usersWithRoles); ?></h4>
                                        <p class="text-success mb-0">Assigned</p>
                                    </div>
                                    <small class="mb-0">Users assigned roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="icon-base bx bx-user-check icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Roles List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">Role Management</h5>
                    <p class="card-category mb-0">Here you can manage Roles</p>

                    <!-- Search and Add Button -->
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-md-6">
                            <form method="GET" action="<?php echo e(route('roles.index')); ?>" class="d-flex">
                                <input type="text" name="search" class="form-control" placeholder="Search by role name..." value="<?php echo e(request('search')); ?>">
                                <button type="submit" class="btn btn-primary ms-2">
                                    <i class="bx bx-search"></i> Search
                                </button>
                                <?php if(request('search')): ?>
                                    <a href="<?php echo e(route('roles.index')); ?>" class="btn btn-secondary ms-2">
                                        <i class="bx bx-reset"></i> Reset
                                    </a>
                                <?php endif; ?>
                            </form>
                        </div>
                        <div class="col-md-6 align-content-end text-end">
                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-create')): ?>
                                <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="bx bx-plus"></i> Add New Role
                                </button>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <div class="card-datatable">
                    <table class="datatables-users table border-top table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Role Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e(++$i); ?></td>
                                    <td><?php echo e($role->name); ?></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-edit')): ?>
                                                <a href="<?php echo e(route('roles.edit', $role->id)); ?>"
                                                   class="btn btn-sm btn-primary"
                                                   title="Edit Role">
                                                    <i class="bx bx-edit"></i>
                                                </a>
                                            <?php endif; ?>

                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-delete')): ?>
                                                <button type="button"
                                                        class="btn btn-sm btn-danger"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteModal<?php echo e($role->id); ?>"
                                                        title="Delete Role">
                                                    <i class="bx bx-trash"></i>
                                                </button>
                                            <?php endif; ?>
                                        </div>

                                        <!-- Delete Confirmation Modal -->
                                        <div class="modal fade" id="deleteModal<?php echo e($role->id); ?>" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Confirm Delete</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete role <strong>"<?php echo e($role->name); ?>"</strong>?
                                                        <br>
                                                        <small class="text-danger">This action cannot be undone.</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <form action="<?php echo e(route('roles.destroy', $role->id)); ?>" method="POST" class="d-inline">
                                                            <?php echo csrf_field(); ?>
                                                            <?php echo method_field('DELETE'); ?>
                                                            <button type="submit" class="btn btn-danger">
                                                                <i class="bx bx-trash"></i> Delete
                                                            </button>
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

                <div class="mt-3 d-flex justify-content-center">
                    <?php echo e($roles->appends(request()->query())->links('pagination::bootstrap-5')); ?>

                </div>
            </div>
        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
    </div>

    <!-- Add Role Modal -->
    <?php echo $__env->make('acceess_control.roles.create', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('input[type="checkbox"].name').forEach(function (checkbox) {
            // Add Bootstrap switch class to parent label
            checkbox.parentElement.classList.add('form-check', 'form-switch');
            // Add Bootstrap switch class to checkbox
            checkbox.classList.add('form-check-input');
        });
    });
</script>

<?php echo $__env->make('layouts.app', ['activePage' => 'roles', 'titlePage' => __('Role')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/acceess_control/roles/index.blade.php ENDPATH**/ ?>