<?php $__env->startSection('content'); ?>
<div>

    <div class="content">

        <div class="row">
            <div class="col-md-12">


                <?php if(session()->has('message')): ?>
                <div class="alert alert-warning">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <i class="material-icons">close</i>
                    </button>
                    <span>
                        <?php echo e(session('message')); ?></span>

                </div>
                <?php endif; ?>


                <form class="form-horizontal">



                    
                    
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form method="POST" action="<?php echo e(route('password.update')); ?>">
                    <?php echo csrf_field(); ?>
                    
                    <div class="card ">
                        <div class="card-header card-header-primary">
                            <h4 class="card-title">Change password</h4>
                            <p class="card-category">Password</p>
                        </div>
                        <div class="card-body ">
                            <div class="row">
                                <label class="col-sm-2 col-form-label" for="input-current-password">Current Password</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" input type="password" name="old_password" id="input-current-password" placeholder="Current Password" value="" required />
                                        <?php $__errorArgs = ['old_password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger"><?php echo e($message); ?></div>
                                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 col-form-label" for="input-password">New Password</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="password" id="input-password" type="password" placeholder="New Password" value="" required />
                                        <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger"><?php echo e($message); ?></div>
                                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 col-form-label" for="input-password-confirmation">Confirm New Password</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="password_confirmation" id="input-password-confirmation" type="password" placeholder="Confirm New Password" value="" required />
                                        <?php $__errorArgs = ['password_confirmation'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger"><?php echo e($message); ?></div>
                                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ml-auto mr-auto">
                            <button type="submit" class="btn btn-primary">Change password</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/livewire/profile.blade.php ENDPATH**/ ?>