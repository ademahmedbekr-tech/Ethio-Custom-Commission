<?php $__env->startSection('title', 'Branches'); ?>

<?php $__env->startSection('content'); ?>

<div class="card">

    <div class="card-header d-flex justify-content-between">

        <h4 class="mb-0">Branches</h4>

        <a href="<?php echo e(route('branches.create')); ?>"
           class="btn btn-primary">

            Add Branch

        </a>

    </div>

    <div class="table-responsive">

        <table class="table">

            <thead>

                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Type</th>
                    <th>City</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

            </thead>

            <tbody>

                <?php $__empty_1 = true; $__currentLoopData = $branches; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branch): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>

                    <tr>

                        <td><?php echo e($loop->iteration); ?></td>

                        <td><?php echo e($branch->name); ?></td>

                        <td><?php echo e($branch->code); ?></td>

                        <td><?php echo e($branch->branch_type); ?></td>

                        <td><?php echo e($branch->city); ?></td>

                        <td>

                            <?php if($branch->is_active): ?>

                                <span class="badge bg-success">
                                    Active
                                </span>

                            <?php else: ?>

                                <span class="badge bg-danger">
                                    Inactive
                                </span>

                            <?php endif; ?>

                        </td>

                        <td>

                            <a href="<?php echo e(route('branches.edit', $branch->id)); ?>"
                               class="btn btn-sm btn-warning">

                                Edit

                            </a>

                            <form action="<?php echo e(route('branches.destroy', $branch->id)); ?>"
                                  method="POST"
                                  class="d-inline">

                                <?php echo csrf_field(); ?>
                                <?php echo method_field('DELETE'); ?>

                                <button class="btn btn-sm btn-danger"
                                        onclick="return confirm('Delete branch?')">

                                    Delete

                                </button>

                            </form>

                        </td>

                    </tr>

                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                    <tr>
                        <td colspan="7" class="text-center">
                            No branches found.
                        </td>
                    </tr>

                <?php endif; ?>

            </tbody>

        </table>

    </div>

</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/branches/index.blade.php ENDPATH**/ ?>