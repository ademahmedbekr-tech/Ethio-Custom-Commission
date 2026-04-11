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
                        <input type="text" id="name" name="name"
                            value="<?php echo e(old('name', $user->name)); ?>" class="form-control" placeholder="Enter Name"
                             />
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditUserEmail">Email</label>
                        <input type="email" id="modalEditUserEmail" name="email" class="form-control"
                            placeholder="Enter Email" value="<?php echo e(old('email', $user->email)); ?>" />
                    </div>
                   

                            <div class="col-12 col-md-6">

                                <strong>Role:</strong>

                                <?php echo Form::select('roles[]', $roles,$userRole, array('class' => 'form-select','select2')); ?>


                            </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditTaxID">Tax ID</label>
                        <input type="text" id="modalEditTaxID" name="modalEditTaxID"
                            class="form-control modal-edit-tax-id" placeholder="123 456 7890" value="123 456 7890" />
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditUserPhone">Phone Number</label>
                        <div class="input-group">
                            <span class="input-group-text">US (+1)</span>
                            <input type="text" id="modalEditUserPhone" name="modalEditUserPhone"
                                class="form-control phone-number-mask" placeholder="202 555 0111"
                                value="202 555 0111" />
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditUserLanguage">Language</label>
                        <select id="modalEditUserLanguage" name="modalEditUserLanguage" class="select2 form-select"
                            multiple>
                            <option value="">Select</option>
                            <option value="english" selected>English</option>
                            <option value="spanish">Spanish</option>
                            <option value="french">French</option>
                            <option value="german">German</option>
                            <option value="dutch">Dutch</option>
                            <option value="hebrew">Hebrew</option>
                            <option value="sanskrit">Sanskrit</option>
                            <option value="hindi">Hindi</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label" for="modalEditUserCountry">Country</label>
                        <select id="modalEditUserCountry" name="modalEditUserCountry" class="select2 form-select"
                            data-allow-clear="true">
                            <option value="">Select</option>
                            <option value="Australia">Australia</option>
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Belarus">Belarus</option>
                            <option value="Brazil">Brazil</option>
                            <option value="Canada">Canada</option>
                            <option value="China">China</option>
                            <option value="France">France</option>
                            <option value="Germany">Germany</option>
                            <option value="India" selected>India</option>
                            <option value="Indonesia">Indonesia</option>
                            <option value="Israel">Israel</option>
                            <option value="Italy">Italy</option>
                            <option value="Japan">Japan</option>
                            <option value="Korea">Korea, Republic of</option>
                            <option value="Mexico">Mexico</option>
                            <option value="Philippines">Philippines</option>
                            <option value="Russia">Russian Federation</option>
                            <option value="South Africa">South Africa</option>
                            <option value="Thailand">Thailand</option>
                            <option value="Turkey">Turkey</option>
                            <option value="Ukraine">Ukraine</option>
                            <option value="United Arab Emirates">United Arab Emirates</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="United States">United States</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <div class="form-check form-switch">
                            <input type="checkbox" class="form-check-input" id="editBillingAddress" />
                            <label for="editBillingAddress" class="switch-label">Use as a billing address?</label>
                        </div>
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
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/_partials/_modals/modal-edit-user.blade.php ENDPATH**/ ?>