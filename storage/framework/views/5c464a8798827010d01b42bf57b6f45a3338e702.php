

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <div class="card-body">

                    <div class="row">

                        <div class="col-lg-12 margin-tb">

                            <div class="pull-left">

                                <h2>Create New User</h2>

                            </div>



                        </div>

                    </div>


                    <?php if(count($errors) > 0): ?>

                    <div class="alert alert-danger">

                        <strong>Whoops!</strong> There were some problems with your input.<br><br>

                        <ul>

                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                            <li><?php echo e($error); ?></li>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </ul>

                    </div>

                    <?php endif; ?>



                    <?php echo Form::open(array('route' => 'users.store','method'=>'POST')); ?>


                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Name:</strong>

                                <?php echo Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')); ?>


                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Email:</strong>

                                <?php echo Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')); ?>


                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Zone:</strong>

                                <select name="zone" id="zone" class="form-select">
                                    
                                    <?php for($i = 1; $i <= 21; $i++): ?> <option value="zone <?php echo e($i); ?>">zone <?php echo e($i); ?></option>
                                        <?php endfor; ?>
                                </select>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Password:</strong>

                                <?php echo Form::password('password', array('placeholder' => 'Password','class' => 'form-control')); ?>


                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Confirm Password:</strong>

                                <?php echo Form::password('confirm-password', array('placeholder' => 'Confirm Password','class' => 'form-control')); ?>


                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Role:</strong>

                                <?php echo Form::select('roles[]', $roles,[], array('class' => 'form-select')); ?>


                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 text-center mt-3">

                            <button type="submit" class="btn btn-primary">Submit</button>

                        </div>

                    </div>

                    <?php echo Form::close(); ?>


                </div>
            </div>
        </div>
    </div>
</div>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ODA-Membership\ODA-Membership\resources\views/users/create.blade.php ENDPATH**/ ?>