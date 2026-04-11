<?php $__env->startSection('title', 'Users'); ?>

<?php $__env->startSection('content'); ?>
    <div class="content">
        <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">


                
                <div class="row g-6 mb-6">
                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-body ">
                                <div class="d-flex align-items-start justify-content-between">
                                    <div class="content-left">
                                        <span class="text-heading">Users</span>
                                        <div class="d-flex align-items-center my-1">
                                            <h4 class="mb-0 me-2"><?php echo e($users); ?></h4>
                                            <p class="text-success mb-0">(+29%)</p>
                                        </div>
                                        <small>Total Users</small>
                                    </div>
                                    <div class="avatar">
                                        <span class="avatar-initial rounded bg-label-primary">
                                            <i class="icon-base bx bx-group icon-lg"></i>
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> <?php echo e($userRole); ?> </h4>
                                        <p class="text-success mb-0">(+18%)</p>
                                    </div>
                                    <small>Total Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-danger">
                                        <i class="bx bx-user-plus icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Central Admin Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> <?php echo e($admin); ?> </h4>
                                        <p class="text-danger mb-0">(-14%)</p>
                                    </div>
                                    <small>Total Admin Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="bx bx-user-check icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Zones Admin Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> <?php echo e($zonal); ?></h4>
                                        <p class="text-success mb-0">(+42%)</p>
                                    </div>
                                    <small>Zones & Cities Admin Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="bx bx-user-voice icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="card mt-3">
                    <div class="card">
                        <div class="card-body">

                            <div class="text-end mb-3">
                                <a href="#" class="btn btn-sm btn-success" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                    Add User
                                </a>
                            </div>

                            <?php echo $__env->make('users.create', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="text-primary">
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Roles</th>
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td><?php echo e(++$i); ?></td>
                                                <td>
                                                    <img src="<?php echo e($user->profile_photo_path); ?>"
                                                        class="w-px-40 h-auto rounded-circle"> <?php echo e($user->name); ?>

                                                </td>
                                                <td><?php echo e($user->email); ?></td>
                                                <td>
                                                    <?php $__currentLoopData = $user->getRoleNames(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <span class="badge bg-info"><?php echo e($role); ?></span>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </td>
                                                <td class="text-end">
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-edit')): ?>
                                                        <button class="btn btn-icon me-1" data-bs-target="#editUser<?php echo e($user->id); ?>"
                                                            data-bs-toggle="modal" data-bs-dismiss="modal">
                                                            <i class="icon-base bx bx-edit icon-md"></i>
                                                        </button>
                                                    <?php endif; ?>
                                                    <?php echo $__env->make('_partials._modals.modal-edit-user', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-delete')): ?>
                                                        <button type="button" class="btn btn-sm btn-danger"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#deleteAdmin<?php echo e($user->id); ?>"
                                                            title="Delete User">
                                                            <i class="bx bx-trash"></i>
                                                        </button>


                                                        <!-- Delete Confirmation Modal -->
                                                        <div class="modal fade" id="deleteAdmin<?php echo e($user->id); ?>"
                                                            tabindex="-1" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Confirm Delete</h5>
                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Are you sure you want to delete Admin
                                                                        <strong>"<?php echo e($user->name); ?>"</strong>?
                                                                        <br>
                                                                        <small class="text-danger">This action cannot be
                                                                            undone.</small>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Cancel</button>
                                                                        <form action="<?php echo e(route('users.destroy', $user->id)); ?>"
                                                                            method="POST" class="d-inline">
                                                                            <?php echo csrf_field(); ?>
                                                                            <?php echo method_field('DELETE'); ?>
                                                                            <button type="submit"
                                                                                class="btn btn-danger">Delete</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </tbody>
                                </table>

                                <?php echo $data->links(); ?>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', [
    'activePage' => 'user',
    'titlePage' => __('User'),
], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/users/index.blade.php ENDPATH**/ ?>