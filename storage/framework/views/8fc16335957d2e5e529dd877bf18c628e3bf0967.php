<?php $__env->startSection('content'); ?>
    

    <div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="row">

                        <div class="col-lg-12 margin-tb">

                            <div class="pull-left">

                                <h2>Edit Role</h2>

                            </div>

                            <div class="pull-right">

                                <a class="btn btn-primary" href="<?php echo e(route('roles.index')); ?>"> Back</a>

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


                    <?php echo Form::model($role, ['method' => 'PATCH', 'route' => ['roles.update', $role->id]]); ?>


                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Name:</strong>

                                <?php echo Form::text('name', null, ['placeholder' => 'Name', 'class' => 'form-control']); ?>


                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <strong>Permission:</strong>
                                <br>

                                <div class="row">
                                    <?php $__currentLoopData = $permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="col-md-4 col-sm-6 col-12 mb-2">
                                            <label>
                                                <?php echo e(Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, [
                                                    'class' => 'name',
                                                ])); ?>

                                                <?php echo e($value->name); ?>

                                            </label>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>

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
    
<?php $__env->stopSection(); ?>
<script>
    document.addEventListener('DOMContentLoaded', function() {

        document.querySelectorAll('input[type="checkbox"].name').forEach(function(checkbox) {

            // Add Bootstrap switch class to parent label
            checkbox.parentElement.classList.add('form-check', 'form-switch');

            // Add Bootstrap switch class to checkbox
            checkbox.classList.add('form-check-input');

        });

    });
</script>

<?php echo $__env->make('layouts.app', ['activePage' => 'role', 'titlePage' => __('Role')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/acceess_control/roles/edit.blade.php ENDPATH**/ ?>