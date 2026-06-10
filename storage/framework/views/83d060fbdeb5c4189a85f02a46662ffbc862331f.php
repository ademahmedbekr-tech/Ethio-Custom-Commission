<?php $__env->startSection('content'); ?>
    <div class="card shadow-sm border-0">
        <div class="card-header bg-transparent pt-4 px-4">
            <h4 class="mb-0 font-weight-bold text-dark">Create Position</h4>
        </div>

        <div class="card-body px-4 pb-4">
            <form action="<?php echo e(route('departments.store')); ?>" method="POST">
                <?php echo csrf_field(); ?>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Branch Office <span class="text-danger">*</span></label>
                    <select name="branch_id" id="branch_selector" class="form-select" required>
                        <option value="" selected disabled>Select Branch</option>
                        <?php $__currentLoopData = $branch; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $branches): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($branches->id); ?>"><?php echo e($branches->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Directorate <span class="text-danger">*</span></label>
                    <select name="directorate_id" id="directorate_selector" class="form-select" required disabled>
                        <option value="" selected disabled>Please select a branch first</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Position Name <span class="text-danger">*</span></label>
                    <input type="text" name="name" class="form-control" placeholder="e.g., Application Development Team" required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Position Capacity <span class="text-danger">*</span></label>
                    <input type="number" name="capacity" class="form-control" placeholder="e.g., 1,2,3" required>
                </div>

                <div class="mb-3">
                    <label class="form-label font-weight-bold text-dark">Description</label>
                    <textarea name="description" class="form-control" rows="3" placeholder="Optional notes regarding Position function..."></textarea>
                </div>

                <button type="submit" class="btn btn-primary px-4 shadow-sm">
                    <i class="fas fa-save mr-1"></i> Save Position
                </button>
            </form>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>

    
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
                                $.each(data, function(key, directorates) {
                                    $('#directorate_selector').append('<option value="' + directorates.id + '">' + directorates.name + '</option>');
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/departments/create.blade.php ENDPATH**/ ?>