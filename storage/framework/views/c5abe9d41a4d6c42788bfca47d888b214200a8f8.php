<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header text-black">
                    <i class="bx bx-briefcase"></i> Add Work Experience
                    <small class="text-muted">for <?php echo e($employee->employee_name); ?> (<?php echo e($employee->file_number); ?>)</small>
                </h5>
                <div class="card-body">
                    <form action="<?php echo e(route('experiences.store')); ?>" method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>

                        
                        <input type="hidden" name="employee_id" value="<?php echo e($employee->id); ?>">

                        <!-- Basic Information Section -->
                        <h6 class="text-primary mt-2 mb-3">
                            <i class="bx bx-info-circle"></i> Basic Information
                        </h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="job_title" class="form-label">Job Title <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control <?php $__errorArgs = ['job_title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="job_title"
                                                   name="job_title"
                                                   value="<?php echo e(old('job_title')); ?>"
                                                   placeholder="Enter job title"
                                                   required>
                                            <?php $__errorArgs = ['job_title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="institution" class="form-label">Institution/Company <span class="text-danger">*</span></label>
                                            <input type="text"
                                                   class="form-control <?php $__errorArgs = ['institution'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="institution"
                                                   name="institution"
                                                   value="<?php echo e(old('institution')); ?>"
                                                   placeholder="Enter institution name"
                                                   required>
                                            <?php $__errorArgs = ['institution'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="experience_type" class="form-label">Experience Type</label>
                                            <select class="form-control <?php $__errorArgs = ['experience_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                    id="experience_type"
                                                    name="experience_type">
                                                <option value="previous" <?php echo e(old('experience_type') == 'previous' ? 'selected' : ''); ?>>Previous Experience</option>
                                                <option value="current" <?php echo e(old('experience_type') == 'current' ? 'selected' : ''); ?>>Current Experience</option>
                                            </select>
                                            <?php $__errorArgs = ['experience_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="employment_type" class="form-label">Employment Type</label>
                                            <select class="form-control <?php $__errorArgs = ['employment_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                    id="employment_type"
                                                    name="employment_type">
                                                <option value="">Select Employment Type</option>
                                                <option value="full-time" <?php echo e(old('employment_type') == 'full-time' ? 'selected' : ''); ?>>Full Time</option>
                                                <option value="part-time" <?php echo e(old('employment_type') == 'part-time' ? 'selected' : ''); ?>>Part Time</option>
                                                <option value="contract" <?php echo e(old('employment_type') == 'contract' ? 'selected' : ''); ?>>Contract</option>
                                                <option value="temporary" <?php echo e(old('employment_type') == 'temporary' ? 'selected' : ''); ?>>Temporary</option>
                                                <option value="internship" <?php echo e(old('employment_type') == 'internship' ? 'selected' : ''); ?>>Internship</option>
                                                <option value="volunteer" <?php echo e(old('employment_type') == 'volunteer' ? 'selected' : ''); ?>>Volunteer</option>
                                            </select>
                                            <?php $__errorArgs = ['employment_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="location" class="form-label">Location</label>
                                            <input type="text"
                                                   class="form-control <?php $__errorArgs = ['location'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="location"
                                                   name="location"
                                                   value="<?php echo e(old('location')); ?>"
                                                   placeholder="City, Country">
                                            <?php $__errorArgs = ['location'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Date Information Section -->
                        <h6 class="text-primary mt-2 mb-3">
                            <i class="bx bx-calendar"></i> Date Information
                        </h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="from_date" class="form-label">From Date <span class="text-danger">*</span></label>
                                            <input type="date"
                                                   class="form-control <?php $__errorArgs = ['from_date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="from_date"
                                                   name="from_date"
                                                   value="<?php echo e(old('from_date')); ?>"
                                                   required>
                                            <?php $__errorArgs = ['from_date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="to_date" class="form-label">To Date</label>
                                            <input type="date"
                                                   class="form-control <?php $__errorArgs = ['to_date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="to_date"
                                                   name="to_date"
                                                   value="<?php echo e(old('to_date')); ?>">
                                            <small class="form-text text-muted">
                                                <i class="bx bx-info-circle"></i> Leave blank if currently working here
                                            </small>
                                            <?php $__errorArgs = ['to_date'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="form-check mt-2">
                                            <input type="checkbox"
                                                   class="form-check-input"
                                                   id="is_current"
                                                   name="is_current"
                                                   value="1"
                                                   <?php echo e(old('is_current') ? 'checked' : ''); ?>>
                                            <label class="form-check-label" for="is_current">
                                                I currently work here
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Description Section -->
                        <h6 class="text-primary mt-2 mb-3">
                            <i class="bx bx-detail"></i> Job Description
                        </h6>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="description" class="form-label">Job Description</label>
                                            <textarea class="form-control <?php $__errorArgs = ['description'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                      id="description"
                                                      name="description"
                                                      rows="3"
                                                      placeholder="Describe the main responsibilities and duties"><?php echo e(old('description')); ?></textarea>
                                            <?php $__errorArgs = ['description'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="responsibilities" class="form-label">Key Responsibilities</label>
                                            <textarea class="form-control <?php $__errorArgs = ['responsibilities'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                      id="responsibilities"
                                                      name="responsibilities"
                                                      rows="4"
                                                      placeholder="List key responsibilities (one per line)"><?php echo e(old('responsibilities')); ?></textarea>
                                            <small class="form-text text-muted">
                                                <i class="bx bx-bulb"></i> Enter each responsibility on a new line
                                            </small>
                                            <?php $__errorArgs = ['responsibilities'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="achievements" class="form-label">Key Achievements</label>
                                            <textarea class="form-control <?php $__errorArgs = ['achievements'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                      id="achievements"
                                                      name="achievements"
                                                      rows="3"
                                                      placeholder="List notable achievements (one per line)"><?php echo e(old('achievements')); ?></textarea>
                                            <?php $__errorArgs = ['achievements'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Compensation Section (Optional) -->
                        <h6 class="text-primary mt-2 mb-3">
                            <i class="bx bx-money"></i> Compensation (Optional)
                        </h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="salary" class="form-label">Monthly Salary</label>
                                            <div class="input-group">
                                                <span class="input-group-text">ETB</span>
                                                <input type="number"
                                                       class="form-control <?php $__errorArgs = ['salary'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                       id="salary"
                                                       name="salary"
                                                       value="<?php echo e(old('salary')); ?>"
                                                       placeholder="0.00"
                                                       step="0.01">
                                            </div>
                                            <?php $__errorArgs = ['salary'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="currency" class="form-label">Currency</label>
                                            <select class="form-control <?php $__errorArgs = ['currency'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                    id="currency"
                                                    name="currency">
                                                <option value="ETB" <?php echo e(old('currency') == 'ETB' ? 'selected' : ''); ?>>ETB - Ethiopian Birr</option>
                                                <option value="USD" <?php echo e(old('currency') == 'USD' ? 'selected' : ''); ?>>USD - US Dollar</option>
                                                <option value="EUR" <?php echo e(old('currency') == 'EUR' ? 'selected' : ''); ?>>EUR - Euro</option>
                                                <option value="GBP" <?php echo e(old('currency') == 'GBP' ? 'selected' : ''); ?>>GBP - British Pound</option>
                                            </select>
                                            <?php $__errorArgs = ['currency'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional Information -->
                        <h6 class="text-primary mt-2 mb-3">
                            <i class="bx bx-info-square"></i> Additional Information
                        </h6>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="supervisor_name" class="form-label">Supervisor Name</label>
                                            <input type="text"
                                                   class="form-control <?php $__errorArgs = ['supervisor_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="supervisor_name"
                                                   name="supervisor_name"
                                                   value="<?php echo e(old('supervisor_name')); ?>"
                                                   placeholder="Name of direct supervisor">
                                            <?php $__errorArgs = ['supervisor_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>

                                        <div class="mb-3">
                                            <label for="display_order" class="form-label">Display Order</label>
                                            <input type="number"
                                                   class="form-control <?php $__errorArgs = ['display_order'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                                   id="display_order"
                                                   name="display_order"
                                                   value="<?php echo e(old('display_order', $employee->experiences->count() + 1)); ?>"
                                                   placeholder="Order in which to display">
                                            <small class="form-text text-muted">
                                                <i class="bx bx-sort"></i> Lower numbers appear first
                                            </small>
                                            <?php $__errorArgs = ['display_order'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback"><?php echo e($message); ?></div>
                                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Buttons -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-save"></i> Save Experience
                                </button>
                                <a href="<?php echo e(route('employees.show', $employee->id)); ?>" class="btn btn-secondary">
                                    <i class="bx bx-x"></i> Cancel
                                </a>
                                <?php if($employee->experiences->count() > 0): ?>
                                    <a href="<?php echo e(route('experiences.index', $employee->id)); ?>" class="btn btn-info">
                                        <i class="bx bx-list-ul"></i> View All Experiences
                                    </a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->startPush('scripts'); ?>
<script>
    // Auto-handle current checkbox
    document.getElementById('is_current').addEventListener('change', function() {
        const toDateField = document.getElementById('to_date');
        if (this.checked) {
            toDateField.value = '';
            toDateField.disabled = true;
            toDateField.placeholder = 'Currently working here';
        } else {
            toDateField.disabled = false;
            toDateField.placeholder = '';
        }
    });

    // Trigger on page load
    if (document.getElementById('is_current').checked) {
        document.getElementById('to_date').disabled = true;
    }

    // Experience type change handler
    document.getElementById('experience_type').addEventListener('change', function() {
        const isCurrentCheckbox = document.getElementById('is_current');
        if (this.value === 'current') {
            isCurrentCheckbox.checked = true;
            isCurrentCheckbox.dispatchEvent(new Event('change'));
        } else {
            isCurrentCheckbox.checked = false;
            isCurrentCheckbox.dispatchEvent(new Event('change'));
        }
    });
</script>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('styles'); ?>
<style>
    .card {
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        border: none;
    }
    .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #e9ecef;
    }
    .form-label {
        font-weight: 500;
    }
    .text-primary {
        color: #0d6efd !important;
    }
    .bx {
        margin-right: 5px;
    }
</style>
<?php $__env->stopPush(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/experiences/create.blade.php ENDPATH**/ ?>