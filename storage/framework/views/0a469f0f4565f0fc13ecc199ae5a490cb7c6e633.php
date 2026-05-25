<?php $__env->startSection('content'); ?>
    <!-- Permission Table -->
    <div class="card">
        <div class="card-datatable table-responsive">
            <table class="table border-top table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>LogName</th>
                        <th>Description</th>
                        <th>Changes</th>
                        <th>Created Date</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__currentLoopData = $activity; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notify): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td> <?php echo e($notify->id); ?> </td>
                            <td> <?php echo e($notify->log_name); ?> </td>
                            <td> <?php echo e($notify->description); ?> </td>
                            <td>
                                <?php
                                    $props = json_decode($notify->properties, true);
                                    $changes = [];

                                    if(isset($props['attributes']) && isset($props['old'])) {
                                        foreach($props['attributes'] as $key => $newValue) {
                                            $oldValue = $props['old'][$key] ?? null;
                                            if($oldValue != $newValue) {
                                                $changes[] = "<strong>{$key}:</strong> {$oldValue} → {$newValue}";
                                            }
                                        }
                                    }
                                ?>

                                <?php if(!empty($changes)): ?>
                                    <small><?php echo implode('<br>', $changes); ?></small>
                                <?php else: ?>
                                    <small class="text-muted">No changes</small>
                                <?php endif; ?>
                            </td>
                            <td> <?php echo e($notify->created_at->format('Y-m-d H:i:s')); ?> </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
        </div>
        <?php echo e($activity->appends(request()->query())->links('pagination::bootstrap-5')); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/notification/index.blade.php ENDPATH**/ ?>