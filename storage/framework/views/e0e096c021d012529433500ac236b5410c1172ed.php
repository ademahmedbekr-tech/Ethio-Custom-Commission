<!-- Edit User Modal -->
<div class="modal fade" id="editUser<?php echo e($user->id); ?>" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="text-center mb-6">
                    <h4 class="mb-2">Edit User Information</h4>
                    <p>Updating user details will receive a privacy audit.</p>
                </div>
                <form id="editUserForm" action="<?php echo e(route('users.update', $user->id)); ?>" method="POST" class="row g-6"
                    onsubmit="return true">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('PUT'); ?>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="name">Full Name</label>
                        <input type="text" id="name" name="name" value="<?php echo e(old('name', $user->name)); ?>"
                            class="form-control" placeholder="Enter Name" />
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditUserEmail">Email</label>
                        <input type="email" id="modalEditUserEmail" name="email" class="form-control"
                            placeholder="Enter Email" value="<?php echo e(old('email', $user->email)); ?>" />
                    </div>
                    

                  <div class="col-12 col-md-6">
    <label class="form-label font-weight-bold text-dark">User's Branch <span
            class="text-danger">*</span></label>
    <select name="user_branch_id" id="branch_selector" class="form-select" required>
        <option value="<?php echo e($user->userBranch->id ?? ''); ?>">
            <?php echo e($user->userBranch->name ?? 'No Branch Assigned'); ?>

        </option>
    </select>
</div>

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control modal-edit-tax-id"
                            placeholder="password" />
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="password">Confirm Password</label>
                        <div class="input-group">
                            <input type="password" id="confirm-password" name="confirm-password" class="form-control"
                                placeholder="password" />
                        </div>
                    </div>

                    <div class="col-12 col-md-6">

                        <strong>Role:</strong>

                        <?php echo Form::select('roles[]', $roles, $userRole, ['class' => 'form-select', 'select2']); ?>


                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary me-3">Submit</button>
                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                            aria-label="Close">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--/ Edit User Modal -->
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/users/edit.blade.php ENDPATH**/ ?>