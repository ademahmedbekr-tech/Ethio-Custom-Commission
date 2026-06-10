<?php $__env->startSection('title', 'Branch Details'); ?>

<?php $__env->startSection('content'); ?>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between mb-6 gap-2">
            <div>
                <h4 class="mb-1">Branch Profile Details</h4>
                <p class="mb-0">Overview of branch metadata and assigned operational units</p>
            </div>
            <div class="d-flex align-content-center flex-wrap gap-2">
                <a href="<?php echo e(route('branches.index')); ?>" class="btn btn-outline-secondary">
                    <i class="bx bx-left-arrow-alt me-1"></i> Back to List
                </a>
                <a href="<?php echo e(route('branches.edit', $branch->id)); ?>" class="btn btn-primary">
                    <i class="bx bx-edit me-1"></i> Edit Branch
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
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="bx bx-map-pin fs-1"></i>
                                    </span>
                                </div>
                                <div class="user-info text-center">
                                    <h5><?php echo e($branch->name); ?></h5>
                                    <span class="badge bg-label-secondary mb-2">Code: <?php echo e($branch->code); ?></span>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-around flex-wrap my-6 gap-20 py-4 border-top border-bottom">
                            <div class="d-flex align-items-center gap-4">
                                <div class="avatar">
                                    <div class="avatar-initial bg-label-primary rounded">
                                        <i class="bx bx-building text-primary"></i>
                                    </div>
                                </div>
                                <div>
                                    <h5 class="mb-0"><?php echo e($branch->directorates?->count() ?? 0); ?></h5>
                                    <span>Directorates Linked</span>
                                </div>
                            </div>
                        </div>

                        <h5 class="pb-2 border-bottom mb-4">Details</h5>
                        <div class="info-container">
                            <ul class="list-unstyled mb-0">
                                <li class="mb-4">
                                    <span class="h6 me-2">Branch Name:</span>
                                    <span><?php echo e($branch->name); ?></span>
                                </li>
                                <li class="mb-4">
                                    <span class="h6 me-2">Branch Code:</span>
                                    <span><?php echo e($branch->code); ?></span>
                                </li>
                                <li class="mb-4">
                                    <span class="h6 me-2">Branch Type:</span>
                                    <span class="badge bg-label-info text-capitalize"><?php echo e($branch->branch_type ?? 'N/A'); ?></span>
                                </li>
                                <li class="mb-4">
                                    <span class="h6 me-2">City Location:</span>
                                    <span><?php echo e($branch->city ?? 'N/A'); ?></span>
                                </li>
                                <li class="mb-4">
                                    <span class="h6 me-2">Physical Address:</span>
                                    <span class="text-muted d-block mt-1"><?php echo e($branch->address ?? 'No physical address configured for this hub branch.'); ?></span>
                                </li>
                                <li class="mb-4">
                                    <span class="h6 me-2">Status:</span>
                                    <?php if($branch->is_active): ?>
                                        <span class="badge bg-label-success">Active</span>
                                    <?php else: ?>
                                        <span class="badge bg-label-danger">Inactive</span>
                                    <?php endif; ?>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">

                <div class="row g-4 mb-6">
                    <div class="col-12">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="mb-1 text-white-50 fw-medium">Active Branch Sub-Units</p>
                                        <h3 class="card-title text-white mb-0"><?php echo e($branch->directorates?->count() ?? 0); ?> Tracked Directorates</h3>
                                    </div>
                                    <div class="avatar bg-white-10 rounded">
                                        <i class="bx bx-buildings fs-2 text-white"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-6">
                    <div class="card-header border-bottom">
                        <h5 class="card-title mb-0">Assigned Organizational Directorates</h5>
                        <small class="text-muted">A full systemic list of corporate operational directorates mapped underneath this specific structural local branch branch.</small>
                    </div>
                    <div class="table-responsive border-top">
                        <table class="table border-top table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th># ID</th>
                                    <th>Directorate Name</th>
                                    <th>Directorate Code</th>
                                    <th class="text-center">Action Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $directoratesList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $directorate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><strong>#<?php echo e($directorate->id); ?></strong></td>
                                        <td>
                                            <span class="text-heading fw-medium"><?php echo e($directorate->name); ?></span>
                                        </td>
                                        <td>
                                            <span class="badge bg-label-secondary"><?php echo e($directorate->code ?? 'N/A'); ?></span>
                                        </td>
                                        <td class="text-center">
                                            <a href="<?php echo e(route('directorates.show', $directorate->id)); ?>"
                                               class="btn btn-sm btn-icon btn-outline-primary"
                                               title="View Directorate Details">
                                                <i class="bx bx-show"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td colspan="4" class="text-center py-6 text-muted">
                                            <i class="bx bx-info-circle fs-3 d-block mb-2 text-warning"></i>
                                            No explicit directorates are currently mapped or grouped underneath this branch context yet.
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="mt-3">
                    <?php echo e($directoratesList->links('pagination::bootstrap-5')); ?>

                </div>

            </div>
            </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/branches/show.blade.php ENDPATH**/ ?>