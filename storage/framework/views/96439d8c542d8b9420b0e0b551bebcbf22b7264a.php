<?php $__env->startSection('content'); ?>
<div class="row g-6">
    <div class="col-md-6">
        <div class="card">
            <h5 class="card-header"><?php echo e(__('Maintainance Mode')); ?></h5>
            <div class="card-body">
                <form action="<?php echo e(route('maintainance-mode-update')); ?>" method="POST" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('PUT'); ?>

                    <div class="mb-4">
    <div class="col-sm-6 p-6">
        <div class="small fw-medium mb-4"><?php echo e(__('Maintainance Mode')); ?></div>
        <label for=""><?php echo e(__('Maintainance Mode')); ?></label>
        <div class="form-check form-switch">
            <?php if($maintainance->status == 1): ?>
                <input class="form-check-input" type="checkbox" id="status_toggle"
                       checked role="switch" name="maintainance_mode">
            <?php else: ?>
                <input class="form-check-input" type="checkbox" id="status_toggle"
                       role="switch" name="maintainance_mode">
            <?php endif; ?>
            <label class="form-check-label" for="status_toggle">
                <?php echo e($maintainance->status == 1 ? __('Enabled') : __('Disabled')); ?>

            </label>
        </div>
    </div>
</div>

<script>
    // Update label text when toggled
    document.getElementById('status_toggle')?.addEventListener('change', function(e) {
        const label = document.querySelector('label[for="status_toggle"]');
        if (label) {
            label.textContent = e.target.checked ? '<?php echo e(__("Enabled")); ?>' : '<?php echo e(__("Disabled")); ?>';
        }
    });
</script>

                    <div class="mb-4">
                        <label for="existingImage" class="form-label"><?php echo e(__('Existing Image')); ?></label>
                        <div class="mb-3">
                            <img src="<?php echo e(asset($maintainance->image)); ?>" width="200px" alt="Current image">
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="formFile" class="form-label"><?php echo e(__('New Image')); ?></label>
                        <input class="form-control" type="file" id="formFile" name="image" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label"><?php echo e(__('Description')); ?></label>
                        <div id="snow-toolbar">
                            <span class="ql-formats">
                                <select class="ql-font"></select>
                                <select class="ql-size"></select>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-bold"></button>
                                <button class="ql-italic"></button>
                                <button class="ql-underline"></button>
                                <button class="ql-strike"></button>
                            </span>
                            <span class="ql-formats">
                                <select class="ql-color"></select>
                                <select class="ql-background"></select>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-script" value="sub"></button>
                                <button class="ql-script" value="super"></button>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-header" value="1"></button>
                                <button class="ql-header" value="2"></button>
                                <button class="ql-blockquote"></button>
                                <button class="ql-code-block"></button>
                            </span>
                        </div>
                        <div id="snow-editor">
                            <?php echo $maintainance->description; ?>

                        </div>
                        <textarea name="description" id="description-hidden" style="display:none;"><?php echo e($maintainance->description); ?></textarea>
                    </div>

                    <button class="btn btn-primary" type="submit"><?php echo e(__('Update')); ?></button>
                </form>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<script>
    // Update label text when toggled
    document.getElementById('status_toggle')?.addEventListener('change', function(e) {
        const label = document.querySelector('label[for="status_toggle"]');
        if (label) {
            label.textContent = e.target.checked ? '<?php echo e(__("Enabled")); ?>' : '<?php echo e(__("Disabled")); ?>';
        }
    });
</script>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/maintenance/maintainance_mode.blade.php ENDPATH**/ ?>