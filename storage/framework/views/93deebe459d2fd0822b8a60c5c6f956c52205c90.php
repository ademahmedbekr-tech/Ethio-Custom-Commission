<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">

            <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between mb-6 gap-2">
                <div>
                    <h4 class="mb-1">Directorate Profile Details</h4>
                    <p class="mb-0">Overview of organizational capacities and positions</p>
                </div>
                <div class="d-flex align-content-center flex-wrap gap-2">
                    <a href="<?php echo e(route('directorates.index')); ?>" class="btn btn-outline-secondary">
                        <i class="bx bx-left-arrow-alt me-1"></i> Back to List
                    </a>
                    <a href="<?php echo e(route('directorates.edit', $directorate->id)); ?>" class="btn btn-primary">
                        <i class="bx bx-edit me-1"></i> Edit Directorate
                    </a>
                </div>
            </div>

            <div class="row g-6">
                <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
                    <div class="card mb-6">
                        <div class="card-body pt-12">
                            <div class="user-avatar-section">
                                <div class="d-flex align-items-center flex-column">
                                    <div class="avatar avatar-xl mb-4">
                                        <span class="avatar-initial rounded bg-label-primary">
                                            <i class="bx bx-building fs-1"></i>
                                        </span>
                                    </div>
                                    <div class="user-info text-center">
                                        <h5><?php echo e($directorate->name); ?></h5>
                                        <span class="badge bg-label-secondary mb-2">Code:
                                            <?php echo e($directorate->code ?? 'N/A'); ?></span>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-around flex-wrap my-6 gap-20 py-4 border-top border-bottom">
                                <div class="d-flex align-items-center me-4 gap-4">
                                    <div class="avatar">
                                        <div class="avatar-initial bg-label-primary rounded">
                                            <i class="bx bx-briefcase text-primary"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="mb-0"><?php echo e($directorate->departments?->count() ?? 0); ?></h5>
                                        <span>Distinct Roles</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-4">
                                    <div class="avatar">
                                        <div class="avatar-initial bg-label-success rounded">
                                            <i class="bx bx-group text-success"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="mb-0" id="total-capacity-badge">
                                            <?php echo e($directorate->departments?->sum('capacity') ?? 0); ?></h5>
                                        <span>Total Capacity</span>
                                    </div>
                                </div>
                            </div>

                            <h5 class="pb-2 border-bottom mb-4">Details</h5>
                            <div class="info-container">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-4">
                                        <span class="h6 me-2">Directorate Name:</span>
                                        <span><?php echo e($directorate->name); ?></span>
                                    </li>
                                    <li class="mb-4">
                                        <span class="h6 me-2">Directorate Code:</span>
                                        <span><?php echo e($directorate->code ?? 'N/A'); ?></span>
                                    </li>
                                    <li class="mb-4">
                                        <span class="h6 me-2">Assigned Branch:</span>
                                        <span
                                            class="text-capitalize"><?php echo e($directorate->branch?->name ?? 'Unassigned'); ?></span>
                                    </li>
                                    <li class="mb-4">
                                        <span class="h6 me-2">Director In-Charge:</span>
                                        <span
                                            class="badge bg-label-success"><?php echo e($directorate->manage?->name ?? 'Vacant / Pending'); ?></span>
                                    </li>
                                    <li class="mb-4">
                                        <span class="h6 me-2">Description:</span>
                                        <p class="text-muted mt-1 mb-0">
                                            <?php echo e($directorate->description ?? 'No historical summary or description provided for this directorate branch.'); ?>

                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">

                    <div class="row g-4 mb-6">
                        <div class="col-sm-6">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <p class="mb-1 text-white-50 fw-medium">Operational Structural Slots</p>
                                            <h3 class="card-title text-white mb-0"><span
                                                    id="total-capacity-strip"><?php echo e($directorate->departments?->sum('capacity') ?? 0); ?></span>
                                                Staff</h3>
                                        </div>
                                        <div class="avatar bg-white-10 rounded">
                                            <i class="bx bx-check-circle fs-2 text-white"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <p class="mb-1 text-muted fw-medium">Role Variations Linked</p>
                                            <h3 class="card-title mb-0"><?php echo e($directorate->departments?->count() ?? 0); ?>

                                                Unique Titles</h3>
                                        </div>
                                        <div class="avatar bg-label-info rounded">
                                            <i class="bx bx-layer fs-2"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                   <div class="card mb-6">
                    <div class="card-header border-bottom">
                        <h5 class="card-title mb-0">Structural Positions & Allocations</h5>
                        <small class="text-muted">Click the edit button next to any role to dynamically modify its assigned allocation headcount.</small>
                    </div>
                    <div class="table-responsive border-top">
                        <table class="table border-top table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th># ID</th>
                                    <th>Job Position / Unit Title</th>
                                    <th class="text-center">Allocated Staff Capacity</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr id="position-row-<?php echo e($dept->id); ?>">
                                        <td><strong>#<?php echo e($dept->id); ?></strong></td>
                                        <td>
                                            <span class="text-heading fw-medium position-name"><?php echo e($dept->name); ?></span>
                                        </td>
                                        <td class="text-center">
                                            <span class="badge bg-label-primary px-3 py-2 rounded-pill fw-bold fs-7 position-capacity-display">
                                                <?php echo e($dept->capacity); ?> Slots
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <button type="button"
                                                    class="btn btn-sm btn-icon btn-outline-primary edit-position-btn"
                                                    data-id="<?php echo e($dept->id); ?>"
                                                    data-name="<?php echo e($dept->name); ?>"
                                                    data-capacity="<?php echo e($dept->capacity); ?>"
                                                    title="Modify Capacity Allocation">
                                                <i class="bx bx-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td colspan="4" class="text-center py-6 text-muted">
                                            No explicit positions mapped directly to this unit yet.
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="mt-3">
                    <?php echo e($departments->links('pagination::bootstrap-5')); ?>

                </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editPositionModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header border-bottom">
                    <h5 class="modal-title">Edit Position Allocation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="editPositionForm">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" id="modal_position_id" name="id">

                    <div class="modal-body py-4">
                        <div class="mb-3">
                            <label class="form-label fw-medium text-heading">Position Title</label>
                            <input type="text" id="modal_position_name" class="form-control bg-light" readonly
                                disabled />
                        </div>
                        <div>
                            <label for="modal_position_capacity" class="form-label fw-medium text-heading">Target Allowed
                                Capacity</label>
                            <input type="number" id="modal_position_capacity" name="capacity" class="form-control"
                                min="0" required />
                        </div>
                    </div>
                    <div class="modal-footer border-top p-3">
                        <button type="button" class="btn btn-sm btn-label-secondary"
                            data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-sm btn-primary" id="savePositionBtn">Update
                            Capacity</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <script>
        $(document).ready(function() {
            // 1. Intercept edit clicks and map fields to form input fields
            $('.edit-position-btn').on('click', function() {
                let id = $(this).data('id');
                let name = $(this).data('name');
                let capacity = $(this).data('capacity');

                $('#modal_position_id').val(id);
                $('#modal_position_name').val(name);
                $('#modal_position_capacity').val(capacity);

                $('#editPositionModal').modal('show');
            });

            // 2. Process async form saves securely via application routing paths
            $('#editPositionForm').on('submit', function(e) {
                e.preventDefault();

                let id = $('#modal_position_id').val();
                let capacity = $('#modal_position_capacity').val();
                let submitBtn = $('#savePositionBtn');

                submitBtn.prop('disabled', true).text('Saving...');

                $.ajax({
                    url: `/departments/${id}/update`, // Matches standard structural API route parameters
                    type: 'POST',
                    data: {
                        _token: $('input[name="_token"]').val(),
                        capacity: capacity
                    },
                    success: function(response) {
                        if (response.success) {
                            // Update layout row values instantly without reloading the entire viewport context
                            let row = $(`#position-row-${id}`);
                            row.find('.position-capacity-display').text(`${capacity} Slots`);

                            // Update trigger properties so subsequent clicks remain accurate
                            row.find('.edit-position-btn').data('capacity', capacity);

                            // Re-calculate the overall totals shown in the side panel summaries dynamically
                            let dynamicSum = 0;
                            $('.edit-position-btn').each(function() {
                                dynamicSum += parseInt($(this).data('capacity')) || 0;
                            });

                            $('#total-capacity-badge').text(dynamicSum);
                            $('#total-capacity-strip').text(dynamicSum);

                            // Dismiss modal layout overlays cleanly
                            $('#editPositionModal').modal('hide');

                            // Show a quick non-blocking alert if your template uses SweetAlert2
                            if (typeof Swal !== 'undefined') {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Saved!',
                                    text: response.message,
                                    timer: 1500,
                                    showConfirmButton: false
                                });
                            }
                        }
                    },
                    error: function(xhr) {
                        alert(
                            'An error occurred while updating position allocations. Please review parameter fields.');
                    },
                    complete: function() {
                        submitBtn.prop('disabled', false).text('Update Capacity');
                    }
                });
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/directorates/show.blade.php ENDPATH**/ ?>