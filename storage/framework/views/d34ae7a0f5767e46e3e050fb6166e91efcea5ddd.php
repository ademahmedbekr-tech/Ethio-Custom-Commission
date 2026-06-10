<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <h5 class="card-header text-black">
                        <i class="bx bx-home-heart"></i> Edit Deaprtment
                    </h5>
                    <div class="card-body">
                        <form action="<?php echo e(route('directorates.update', $department->id)); ?>" method="POST"
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
                                                <label for="name" class="form-label">Department Name</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                    value="<?php echo e(old('name', $department->name)); ?>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="code" class="form-label">Department Code</label>
                                                <input type="text" class="form-control" id="code" name="code"
                                                    value="<?php echo e(old('code', $department->code)); ?>">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card mb-3">

                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="manager_id" class="form-label">Manager Department</label>
                                                <select class="form-select" id="manager_id" name="manager_id">
                                                    <option value="">Select Department</option> 
                                                    <?php if(!empty($manager)): ?>
                                                        <?php $__currentLoopData = $manager; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $managers): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($managers->id); ?>"
                                                                <?php echo e(old('manager_id', $department->manager_id) == $managers->id ? 'selected' : ''); ?>>
                                                                <?php echo e($managers->name); ?>

                                                            </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </select>
                                            </div>
                                             <div class="mb-3">
                                                <label for="branch_id" class="form-label"> Branch Name </label>
                                                <select class="form-select" id="branch_id" name="branch_id">
                                                    <option value="">Select Branch</option> 
                                                    <?php if(!empty($branch)): ?>
                                                        <?php $__currentLoopData = $branch; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branches): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($branches->id); ?>"
                                                                <?php echo e(old('branch_id', $department->branch_id) == $branches->id ? 'selected' : ''); ?>>
                                                                <?php echo e($branches->name); ?>

                                                            </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Department Description</label>
                                                <textarea class="form-control" id="description" name="description" rows="2"><?php echo e(old('description', $department->description)); ?></textarea>

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
                                        <a href="<?php echo e(route('directorates.index')); ?>" class="btn btn-secondary">
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/directorates/edit.blade.php ENDPATH**/ ?>