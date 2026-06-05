<?php $__env->startSection('content'); ?>
    <div class="card shadow-sm border-0">
        <div class="card-header bg-transparent d-flex justify-content-between align-items-center pt-4 px-4">
            <h4 class="mb-0 font-weight-bold text-dark">Edit Department</h4>
            <a href="<?php echo e(route('departments.index')); ?>" class="btn btn-secondary btn-sm shadow-sm">
                <i class="fas fa-arrow-left mr-1"></i> Back
            </a>
        </div>

        <div class="card-body px-4 pb-4">
            <form action="<?php echo e(route('departments.update', $department->id)); ?>" method="POST">
                <?php echo csrf_field(); ?>
                <?php echo method_field('PUT'); ?>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Office <span class="text-danger">*</span></label>
                    <select name="branch_id" id="branch_selector" class="form-select" required>
                        <option value="" disabled>Select Branch</option>
                        <?php $__currentLoopData = $branch; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branches): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($branches->id); ?>"
                                <?php echo e(old('branch_id', $department->branch_id) == $branches->id ? 'selected' : ''); ?>>
                                <?php echo e($branches->name); ?>

                            </option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Directorate <span class="text-danger">*</span></label>
                    <select name="directorate_id" id="directorate_selector" class="form-select" required>
                        <option value="" disabled>Select Directorate</option>
                        <?php $__currentLoopData = $directorates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dir): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($dir->id); ?>"
                                <?php echo e(old('directorate_id', $department->directorate_id) == $dir->id ? 'selected' : ''); ?>>
                                <?php echo e($dir->name); ?>

                            </option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Department Name <span class="text-danger">*</span></label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           value="<?php echo e(old('name', $department->name)); ?>"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Department Code <span class="text-danger">*</span></label>
                    <input type="text"
                           name="code"
                           class="form-control"
                           value="<?php echo e(old('code', $department->code)); ?>"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Description</label>
                    <textarea name="description" class="form-control" rows="3"><?php echo e(old('description', $department->description)); ?></textarea>
                </div>

                <button type="submit" class="btn btn-primary px-4 shadow-sm">
                    <i class="fas fa-save mr-1"></i> Update Department
                </button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#branch_selector').on('change', function() {
                var branchId = $(this).val();

                // Clear the target selector and inject a loading state flag
                $('#directorate_selector')
                    .empty()
                    .append('<option value="" selected disabled>Loading Directorates...</option>')
                    .prop('disabled', false);

                if (branchId) {
                    $.ajax({
                        url: '/ajax/branches/' + branchId + '/directorates',
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            $('#directorate_selector').empty().append('<option value="" selected disabled>Select Directorate</option>');

                            if(data.length > 0) {
                                $.each(data, function(key, directorate) {
                                    $('#directorate_selector').append('<option value="' + directorate.id + '">' + directorate.name + '</option>');
                                });
                            } else {
                                $('#directorate_selector').empty().append('<option value="" selected disabled>No Directorates assigned to this branch</option>');
                            }
                        },
                        error: function() {
                            $('#directorate_selector').empty().append('<option value="" selected disabled>Error loading records</option>');
                        }
                    });
                }
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/edit.blade.php ENDPATH**/ ?>