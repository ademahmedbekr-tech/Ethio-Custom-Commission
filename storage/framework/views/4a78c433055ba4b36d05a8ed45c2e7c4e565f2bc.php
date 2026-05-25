<?php $__env->startSection('content'); ?>

<div class="card">

    <div class="card-header">
        <h4>Edit Department</h4>
    </div>

    <div class="card-body">

        <form action="<?php echo e(route('departments.update', $department->id)); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>

            <div class="mb-3">
                <label>Directorate</label>
                <select name="directorate_id" class="form-select">

                    <?php $__currentLoopData = $directorates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dir): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                        <option value="<?php echo e($dir->id); ?>"
                            <?php echo e($department->directorate_id == $dir->id ? 'selected' : ''); ?>>

                            <?php echo e($dir->name); ?>


                        </option>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </select>
            </div>

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control"
                       value="<?php echo e($department->name); ?>">
            </div>

            <div class="mb-3">
                <label>Code</label>
                <input type="text" name="code" class="form-control"
                       value="<?php echo e($department->code); ?>">
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control">
                    <?php echo e($department->description); ?>

                </textarea>
            </div>

            <button class="btn btn-success">
                Update Department
            </button>

        </form>

    </div>

</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/edit.blade.php ENDPATH**/ ?>