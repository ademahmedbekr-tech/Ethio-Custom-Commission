<?php $__env->startSection('content'); ?>

<div class="card">

     <div class="card-header d-flex justify-content-between">

        <h4 class="mb-0">Positions</h4>

        <a href="<?php echo e(route('departments.create')); ?>"
           class="btn btn-primary">

            Add Positions

        </a>

    </div>

    <div class="table-responsive">

        <table class="table">

            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Directorate</th>
                    <th>Branch</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>

                <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                <tr>

                    <td><?php echo e($loop->iteration); ?></td>

                    <td><?php echo e($dept->name); ?></td>
                    <td><?php echo e($dept->code); ?></td>

                    <td><?php echo e($dept->directorate->name ?? 'N/A'); ?></td>
                    <td><?php echo e($dept->directorate?->branch?->name ?? 'N/A'); ?></td>

                    <td>
                        <a href="<?php echo e(route('departments.edit', $dept->id)); ?>" class="btn btn-warning btn-sm">
                            Edit
                        </a>

                        <form action="<?php echo e(route('departments.destroy', $dept->id)); ?>" method="POST" class="d-inline">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('DELETE'); ?>

                            <button class="btn btn-danger btn-sm"
                                    onclick="return confirm('Delete department?')">
                                Delete
                            </button>
                        </form>
                    </td>

                </tr>

                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

            </tbody>

        </table>

    </div>

</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/index.blade.php ENDPATH**/ ?>