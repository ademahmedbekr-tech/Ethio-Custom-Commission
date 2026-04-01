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
                                                        <img src="<?php echo e($user->profile_photo_path); ?>" class="w-px-40 h-auto rounded-circle"> <?php echo e($user->name); ?>

                                                </td>
                                                <td><?php echo e($user->email); ?></td>
                                                <td>
                                                    <?php $__currentLoopData = $user->getRoleNames(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <span class="badge bg-info"><?php echo e($role); ?></span>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </td>
                                                <td class="text-end">
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-edit')): ?>
                                                        <a href="<?php echo e(route('users.edit', $user->id)); ?>"
                                                            class="btn btn-primary btn-sm">
                                                            Edit
                                                        </a>
                                                    <?php endif; ?>

                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-delete')): ?>
                                                        <?php echo Form::open([
                                                            'method' => 'DELETE',
                                                            'route' => ['users.destroy', $user->id],
                                                            'style' => 'display:inline',
                                                        ]); ?>

                                                        <?php echo Form::submit('Delete', ['class' => 'btn btn-danger btn-sm']); ?>

                                                        <?php echo Form::close(); ?>

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
], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ODA-Membership\ODA-Membership\resources\views/users/index.blade.php ENDPATH**/ ?>