<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <h5 class="card-header text-black">
                        <i class="bx bx-home-heart"></i> Create New Manager
                    </h5>
                    <div class="card-body">
                        <form action="<?php echo e(route('managers.update', $managers->id)); ?>" method="POST"
                            enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>


                            <!-- Personal Information Section -->


                            <!-- Work Experience -->
                            <h6 class="text-primary mt-4 mb-3"></h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card mb-3">

                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Manager Name</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                    value="<?php echo e(old('name', $managers->name)); ?>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="department_id" class="form-label">Manager Department</label>
                                                <select class="form-select" id="department_id" name="department_id">
                                                    <option value="">Select Department</option> 
                                                    <?php if(!empty($department)): ?>
                                                        <?php $__currentLoopData = $department; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($dept->id); ?>"
                                                                <?php echo e(old('department_id', $managers->department_id) == $dept->id ? 'selected' : ''); ?>>
                                                                <?php echo e($dept->name); ?>

                                                            </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </select>
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
                                        <a href="<?php echo e(route('managers.index')); ?>" class="btn btn-secondary">
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/managers/edit.blade.php ENDPATH**/ ?>