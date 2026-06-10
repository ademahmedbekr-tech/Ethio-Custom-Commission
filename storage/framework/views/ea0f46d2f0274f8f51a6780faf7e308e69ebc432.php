<?php $__env->startSection('content'); ?>
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row g-6 mb-6">
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Total Directorates</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($totalDirectorates); ?></h4>
                                        <p class="text-success mb-0">Total</p>
                                    </div>
                                    <small class="mb-0">All directorates</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="icon-base bx bx-building icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">With Director</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($directoratesWithHeads); ?></h4>
                                        <p class="text-success mb-0">Assigned</p>
                                    </div>
                                    <small class="mb-0">Heads assigned</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="icon-base bx bx-user-check icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Without Director</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($directoratesWithoutHeads); ?></h4>
                                        <p class="text-danger mb-0">Pending</p>
                                    </div>
                                    <small class="mb-0">Need assignment</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="icon-base bx bx-user-x icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start justify-content-between">
                                <div class="content-left">
                                    <span class="text-heading">Recent Added</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"><?php echo e($recentDirectorates); ?></h4>
                                        <p class="text-info mb-0">This month</p>
                                    </div>
                                    <small class="mb-0">New directorates</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="icon-base bx bx-calendar-plus icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Users List Table -->
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="card-title mb-0">Directorate Management</h5>
                    <p class="card-category mb-0">Here you can manage Directorates</p>

                    <!-- Search and Add Button -->
                    <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                        <div class="col-md-6">
                            <form method="GET" action="<?php echo e(route('directorates.index')); ?>" class="d-flex">
                                <input type="text" name="search" class="form-control"
                                    placeholder="Search by Directorate name, code or manager..."
                                    value="<?php echo e(request('search')); ?>">
                                <button type="submit" class="btn btn-primary ms-2">
                                    <i class="bx bx-search"></i> Search
                                </button>
                                <?php if(request('search')): ?>
                                    <a href="<?php echo e(route('directorates.index')); ?>" class="btn btn-secondary ms-2">
                                        <i class="bx bx-reset"></i> Reset
                                    </a>
                                <?php endif; ?>
                            </form>
                        </div>
                        <div class="col-md-6 align-content-end text-end">

                            <a href="<?php echo e(route('directorates.create')); ?>" class="btn btn-sm btn-primary">
                                <i class="bx bx-plus"></i> Add New Directorate
                            </a>

                        </div>
                    </div>
                </div>
                <div class="card-datatable table-responsive">
                    <table class="datatables-users table border-top table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Directorate Name</th>
                                <th>Directorate Code</th>
                                
                                <th> Director's Name</th>
                                <th>Branch Name</th>
                                <th>Positions</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $directorates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dir): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($dir->id); ?></td>
                                    <td><?php echo e($dir->name); ?></td>
                                    <td><?php echo e($dir->code); ?></td>
                                    
                                    <td><?php echo e($dir->manage?->name); ?></td>
                                    <td><?php echo e($dir->branch?->name); ?></td>
                                    <td><?php echo e($dir->departments?->sum('capacity') ?? 0); ?></td>



                                    <td>
                                        <div class="d-flex gap-2">
                                            <!-- View Button -->
                                            <a href="<?php echo e(route('directorates.show', $dir->id)); ?>"
                                                class="btn btn-sm btn-info" title="View Directorate">
                                                <i class="bx bx-show"></i>
                                            </a>

                                            <!-- Edit Button -->
                                            <a href="<?php echo e(route('directorates.edit', $dir->id)); ?>"
                                                class="btn btn-sm btn-warning" title="Edit Directorate">
                                                <i class="bx bx-edit"></i>
                                            </a>

                                            <!-- Delete Button with Modal Trigger -->
                                            <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteModal<?php echo e($dir->id); ?>"
                                                title="Delete Directorate">
                                                <i class="bx bx-trash"></i>
                                            </button>
                                        </div>

                                        <!-- Delete Confirmation Modal -->
                                        <div class="modal fade" id="deleteModal<?php echo e($dir->id); ?>" tabindex="-1"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Confirm Delete</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete department
                                                        <strong>"<?php echo e($dir->name); ?>"</strong>?
                                                        <br>
                                                        <small class="text-danger">This action cannot be undone.</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Cancel</button>
                                                        <form action="<?php echo e(route('directorates.destroy', $dir->id)); ?>"
                                                            method="POST" class="d-inline">
                                                            <?php echo csrf_field(); ?>
                                                            <?php echo method_field('DELETE'); ?>
                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
                <div class="mt-3">
                    <?php echo e($directorates->appends(request()->query())->links('pagination::bootstrap-5')); ?>

                </div>
            </div>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <div class="content-backdrop fade"></div>
    </div>
    <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/directorates/index.blade.php ENDPATH**/ ?>