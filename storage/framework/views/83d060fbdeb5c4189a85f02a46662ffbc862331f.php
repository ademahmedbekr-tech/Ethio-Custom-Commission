<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header text-black">
                    <i class="bx bx-home-heart"></i> Create New Deaprtment
                </h5>
                <div class="card-body">
                    <form action="<?php echo e(route('departments.store')); ?>" method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>

                        <!-- Personal Information Section -->


                        <!-- Work Experience -->
                        <h6 class="text-primary mt-4 mb-3"></h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">

                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Department Name</label>
                                            <input type="text" class="form-control" id="name" name="name" value="<?php echo e(old('name')); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="code" class="form-label">Department Code</label>
                                            <input type="text" class="form-control" id="code" name="code" value="<?php echo e(old('code')); ?>">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card mb-3">

                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="head_id" class="form-label">Department Head</label>
                                            <input type="number" class="form-control" id="head_id" name="head_id" value="<?php echo e(old('head_id')); ?>">

                                    <?php $__errorArgs = ['head_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="invalid-feedback"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                        <div class="mb-3">
                                            <label for="description" class="form-label">Department Description</label>
                                            <textarea class="form-control" id="description" name="description" rows="2"><?php echo e(old('description')); ?></textarea>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional Information -->

                        <!-- Submit Buttons -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-save"></i> Save
                                </button>
                                <a href="<?php echo e(route('departments.index')); ?>" class="btn btn-secondary">
                                    <i class="bx bx-x"></i> ሰርዝ / Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/create.blade.php ENDPATH**/ ?>