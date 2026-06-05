<?php $__env->startSection('title', 'Edit Branch'); ?>

<?php $__env->startSection('content'); ?>

<div class="card shadow-sm border-0">
    <div class="card-header d-flex justify-content-between align-items-center bg-transparent border-0 pt-4 px-4">
        <h4 class="mb-0 font-weight-bold text-dark">Edit Branch Office</h4>
        <a href="<?php echo e(route('branches.index')); ?>" class="btn btn-secondary px-3 shadow-sm">
            <i class="fas fa-arrow-left mr-1"></i> Back
        </a>
    </div>

    <div class="card-body px-4 pb-4">
        <?php if($errors->any()): ?>
            <div class="alert alert-danger alert-dismissible fade show border-0 shadow-sm mb-4" role="alert">
                <ul class="mb-0 font-weight-bold">
                    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li><?php echo e($error); ?></li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <form action="<?php echo e(route('branches.update', $branch->id)); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Name <span class="text-danger">*</span></label>
                    <input type="text"
                           name="name"
                           class="form-control <?php $__errorArgs = ['name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                           value="<?php echo e(old('name', $branch->name)); ?>"
                           placeholder="e.g., የሞጆ ጉምሩክ ቅ/ጽ/ቤት / Mojo Customs Branch"
                           required>
                    <?php $__errorArgs = ['name'];
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

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark text-muted">
                        Branch Code <i class="fas fa-lock small ms-1" title="Locked structural lookup key"></i>
                    </label>
                    <input type="text"
                           name="code"
                           class="form-control bg-light text-muted font-monospace"
                           value="<?php echo e($branch->code); ?>"
                           readonly
                           required>
                    <div class="form-text text-muted small">System structural keys are locked to preserve historical log records.</div>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Operational Type <span class="text-danger">*</span></label>
                    <select name="branch_type" class="form-select <?php $__errorArgs = ['branch_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" required>
                        <option value="" disabled>Select Type</option>
                        <option value="Head Office" <?php echo e(old('branch_type', $branch->branch_type) == 'Head Office' ? 'selected' : ''); ?>>
                            Head Office (Exclusive Directorate Structure)
                        </option>
                        <option value="Dry Port" <?php echo e(old('branch_type', $branch->branch_type) == 'Dry Port' ? 'selected' : ''); ?>>
                            Dry Port (Regional Work Process Structure)
                        </option>
                        <option value="Airport Customs" <?php echo e(old('branch_type', $branch->branch_type) == 'Airport Customs' ? 'selected' : ''); ?>>
                            Airport Customs
                        </option>
                        <option value="Border Office" <?php echo e(old('branch_type', $branch->branch_type) == 'Border Office' ? 'selected' : ''); ?>>
                            Border Office
                        </option>
                        <option value="Regional Office" <?php echo e(old('branch_type', $branch->branch_type) == 'Regional Office' ? 'selected' : ''); ?>>
                            Regional Office
                        </option>
                    </select>
                    <?php $__errorArgs = ['branch_type'];
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

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Region</label>
                    <input type="text"
                           name="region"
                           class="form-control"
                           placeholder="e.g., Oromia, Addis Ababa"
                           value="<?php echo e(old('region', $branch->region)); ?>">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">City</label>
                    <input type="text"
                           name="city"
                           class="form-control"
                           placeholder="e.g., Mojo"
                           value="<?php echo e(old('city', $branch->city)); ?>">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Phone Contact</label>
                    <input type="text"
                           name="phone"
                           class="form-control"
                           placeholder="e.g., +251..."
                           value="<?php echo e(old('phone', $branch->phone)); ?>">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Email Address</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           placeholder="e.g., branch@customs.gov.et"
                           value="<?php echo e(old('email', $branch->email)); ?>">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label font-weight-bold text-dark">Operational Status</label>
                    <select name="is_active" class="form-select">
                        <option value="1" <?php echo e(old('is_active', $branch->is_active) == '1' ? 'selected' : ''); ?>>
                            Active (Online and accepting data routing)
                        </option>
                        <option value="0" <?php echo e(old('is_active', $branch->is_active) == '0' ? 'selected' : ''); ?>>
                            Inactive (Offline)
                        </option>
                    </select>
                </div>

                <div class="col-md-12 mb-4">
                    <label class="form-label font-weight-bold text-dark">Physical Address Description</label>
                    <textarea name="address"
                              rows="3"
                              class="form-control"
                              placeholder="Describe physical building parameters or landmarks..."><?php echo e(old('address', $branch->address)); ?></textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary px-4 shadow-sm">
                <i class="fas fa-save mr-1"></i> Save Changes
            </button>
        </form>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/branches/edit.blade.php ENDPATH**/ ?>