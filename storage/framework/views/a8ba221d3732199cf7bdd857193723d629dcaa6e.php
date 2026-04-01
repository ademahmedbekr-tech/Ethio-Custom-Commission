<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header bg-warning text-white">
                    <i class="bx bx-edit"></i> የሠራተኛ መረጃ ማስተካከያ / Edit Employee Information
                </h5>
                <div class="card-body">
                    <form action="<?php echo e(route('employees.update', $employee->id)); ?>" method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('PUT'); ?>

                        <!-- Personal Information Section -->
                        <h6 class="text-warning mb-3">📋 የግል መረጃ / Personal Information</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="employee_name" class="form-label">ሙሉ ስም / Full Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control <?php $__errorArgs = ['employee_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                           id="employee_name" name="employee_name" value="<?php echo e(old('employee_name', $employee->employee_name)); ?>"
                                           placeholder="ሙሉ ስም ያስገቡ" required>
                                    <?php $__errorArgs = ['employee_name'];
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
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="file_number" class="form-label">የፋይል ቁጥር / File Number</label>
                                    <input type="text" class="form-control <?php $__errorArgs = ['file_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                           id="file_number" name="file_number" value="<?php echo e(old('file_number', $employee->file_number)); ?>"
                                           placeholder="ራስ-ሰር ይመነጫል / Auto-generated">
                                    <?php $__errorArgs = ['file_number'];
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

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="gender" class="form-label">ፆታ / Gender</label>
                                    <select class="form-select <?php $__errorArgs = ['gender'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="gender" name="gender">
                                        <option value="">ፆታ ይምረጡ / Select Gender</option>
                                        <option value="ወ" <?php echo e(old('gender', $employee->gender) == 'ወ' ? 'selected' : ''); ?>>ወንድ / Male</option>
                                        <option value="ሴ" <?php echo e(old('gender', $employee->gender) == 'ሴ' ? 'selected' : ''); ?>>ሴት / Female</option>
                                        <option value="ሌላ" <?php echo e(old('gender', $employee->gender) == 'ሌላ' ? 'selected' : ''); ?>>ሌላ / Other</option>
                                    </select>
                                    <?php $__errorArgs = ['gender'];
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
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="date_of_birth" class="form-label">የልደት ቀን / Date of Birth</label>
                                    <input type="date" class="form-control <?php $__errorArgs = ['date_of_birth'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                           id="date_of_birth" name="date_of_birth" value="<?php echo e(old('date_of_birth', $employee->date_of_birth ? $employee->date_of_birth->format('Y-m-d') : '')); ?>">
                                    <?php $__errorArgs = ['date_of_birth'];
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
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="marital_status" class="form-label">የትዳር ሁኔታ / Marital Status</label>
                                    <select class="form-select <?php $__errorArgs = ['marital_status'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="marital_status" name="marital_status">
                                        <option value="">ሁኔታ ይምረጡ</option>
                                        <option value="Single" <?php echo e(old('marital_status', $employee->marital_status) == 'Single' ? 'selected' : ''); ?>>ነጠላ / Single</option>
                                        <option value="Married" <?php echo e(old('marital_status', $employee->marital_status) == 'Married' ? 'selected' : ''); ?>>ያገቡ / Married</option>
                                        <option value="Divorced" <?php echo e(old('marital_status', $employee->marital_status) == 'Divorced' ? 'selected' : ''); ?>>የተፋቱ / Divorced</option>
                                        <option value="Widowed" <?php echo e(old('marital_status', $employee->marital_status) == 'Widowed' ? 'selected' : ''); ?>>ባል/ሚስት የሞቱ / Widowed</option>
                                    </select>
                                    <?php $__errorArgs = ['marital_status'];
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

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="ethnicity" class="form-label">ብሔር / Ethnicity</label>
                                    <select class="form-select <?php $__errorArgs = ['ethnicity'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="ethnicity" name="ethnicity">
                                        <option value="">ብሔር ይምረጡ</option>
                                        <option value="Oromo" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Oromo' ? 'selected' : ''); ?>>ኦሮሞ / Oromo</option>
                                        <option value="Amhara" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Amhara' ? 'selected' : ''); ?>>አማራ / Amhara</option>
                                        <option value="Tigray" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Tigray' ? 'selected' : ''); ?>>ትግራይ / Tigray</option>
                                        <option value="Somali" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Somali' ? 'selected' : ''); ?>>ሶማሌ / Somali</option>
                                        <option value="Gurage" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Gurage' ? 'selected' : ''); ?>>ጉራጌ / Gurage</option>
                                        <option value="Other" <?php echo e(old('ethnicity', $employee->ethnicity) == 'Other' ? 'selected' : ''); ?>>ሌላ / Other</option>
                                    </select>
                                    <?php $__errorArgs = ['ethnicity'];
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
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="religion" class="form-label">ሃይማኖት / Religion</label>
                                    <select class="form-select <?php $__errorArgs = ['religion'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="religion" name="religion">
                                        <option value="">ሃይማኖት ይምረጡ</option>
                                        <option value="Christian" <?php echo e(old('religion', $employee->religion) == 'Christian' ? 'selected' : ''); ?>>ክርስቲያን / Christian</option>
                                        <option value="Muslim" <?php echo e(old('religion', $employee->religion) == 'Muslim' ? 'selected' : ''); ?>>ሙስሊም / Muslim</option>
                                        <option value="Other" <?php echo e(old('religion', $employee->religion) == 'Other' ? 'selected' : ''); ?>>ሌላ / Other</option>
                                    </select>
                                    <?php $__errorArgs = ['religion'];
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

                        <!-- Contact Information Section -->
                        <h6 class="text-warning mt-4 mb-3">📞 መገኛ / Contact Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="region" class="form-label">ክልል / Region</label>
                                    <select class="form-select <?php $__errorArgs = ['region'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="region" name="region">
                                        <option value="">ክልል ይምረጡ</option>
                                        <option value="Addis Ababa" <?php echo e(old('region', $employee->region) == 'Addis Ababa' ? 'selected' : ''); ?>>አዲስ አበባ / Addis Ababa</option>
                                        <option value="Afar" <?php echo e(old('region', $employee->region) == 'Afar' ? 'selected' : ''); ?>>አፋር / Afar</option>
                                        <option value="Amhara" <?php echo e(old('region', $employee->region) == 'Amhara' ? 'selected' : ''); ?>>አማራ / Amhara</option>
                                        <option value="Benishangul-Gumuz" <?php echo e(old('region', $employee->region) == 'Benishangul-Gumuz' ? 'selected' : ''); ?>>ቤንሻንጉል ጉሙዝ / Benishangul-Gumuz</option>
                                        <option value="Dire Dawa" <?php echo e(old('region', $employee->region) == 'Dire Dawa' ? 'selected' : ''); ?>>ድሬዳዋ / Dire Dawa</option>
                                        <option value="Gambela" <?php echo e(old('region', $employee->region) == 'Gambela' ? 'selected' : ''); ?>>ጋምቤላ / Gambela</option>
                                        <option value="Harari" <?php echo e(old('region', $employee->region) == 'Harari' ? 'selected' : ''); ?>>ሐረሪ / Harari</option>
                                        <option value="Oromia" <?php echo e(old('region', $employee->region) == 'Oromia' ? 'selected' : ''); ?>>ኦሮሚያ / Oromia</option>
                                        <option value="Sidama" <?php echo e(old('region', $employee->region) == 'Sidama' ? 'selected' : ''); ?>>ሲዳማ / Sidama</option>
                                        <option value="Somali" <?php echo e(old('region', $employee->region) == 'Somali' ? 'selected' : ''); ?>>ሶማሌ / Somali</option>
                                        <option value="SNNPR" <?php echo e(old('region', $employee->region) == 'SNNPR' ? 'selected' : ''); ?>>ደቡብ / SNNPR</option>
                                        <option value="Tigray" <?php echo e(old('region', $employee->region) == 'Tigray' ? 'selected' : ''); ?>>ትግራይ / Tigray</option>
                                    </select>
                                    <?php $__errorArgs = ['region'];
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
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="zone" class="form-label">ዞን / Zone</label>
                                    <input type="text" class="form-control" id="zone" name="zone" value="<?php echo e(old('zone', $employee->zone)); ?>" placeholder="ዞን / Zone">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="district" class="form-label">ወረዳ / District</label>
                                    <input type="text" class="form-control" id="district" name="district" value="<?php echo e(old('district', $employee->district)); ?>" placeholder="ወረዳ / District">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="specific_location" class="form-label">ልዩ አድራሻ / Specific Location</label>
                                    <input type="text" class="form-control" id="specific_location" name="specific_location" value="<?php echo e(old('specific_location', $employee->specific_location)); ?>" placeholder="ከተማ / ቀበሌ">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="house_number" class="form-label">ቤት ቁጥር / House Number</label>
                                    <input type="text" class="form-control" id="house_number" name="house_number" value="<?php echo e(old('house_number', $employee->house_number)); ?>" placeholder="ቤት ቁጥር">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="phone_number" class="form-label">ስልክ ቁጥር / Phone Number</label>
                                    <input type="text" class="form-control <?php $__errorArgs = ['phone_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                           id="phone_number" name="phone_number" value="<?php echo e(old('phone_number', $employee->phone_number)); ?>"
                                           placeholder="+251911223344">
                                    <?php $__errorArgs = ['phone_number'];
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
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email" class="form-label">ኢሜይል / Email</label>
                                    <input type="email" class="form-control <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                                           id="email" name="email" value="<?php echo e(old('email', $employee->email)); ?>"
                                           placeholder="name@example.com">
                                    <?php $__errorArgs = ['email'];
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

                        <!-- Job Information Section -->
                        <h6 class="text-warning mt-4 mb-3">💼 የሥራ መረጃ / Job Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="job_title" class="form-label">የሥራ መደብ / Job Title</label>
                                    <input type="text" class="form-control" id="job_title" name="job_title" value="<?php echo e(old('job_title', $employee->job_title)); ?>" placeholder="ለምሳሌ: ኢንስፔክተር">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="job_level" class="form-label">የአገልግሎት ደረጃ / Job Level</label>
                                    <select class="form-select" id="job_level" name="job_level">
                                        <option value="">ደረጃ ይምረጡ</option>
                                        <option value="I" <?php echo e(old('job_level', $employee->job_level) == 'I' ? 'selected' : ''); ?>>I</option>
                                        <option value="II" <?php echo e(old('job_level', $employee->job_level) == 'II' ? 'selected' : ''); ?>>II</option>
                                        <option value="III" <?php echo e(old('job_level', $employee->job_level) == 'III' ? 'selected' : ''); ?>>III</option>
                                        <option value="IV" <?php echo e(old('job_level', $employee->job_level) == 'IV' ? 'selected' : ''); ?>>IV</option>
                                        <option value="V" <?php echo e(old('job_level', $employee->job_level) == 'V' ? 'selected' : ''); ?>>V</option>
                                        <option value="VI" <?php echo e(old('job_level', $employee->job_level) == 'VI' ? 'selected' : ''); ?>>VI</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="step" class="form-label">ደረጃ / Step</label>
                                    <input type="number" class="form-control" id="step" name="step" value="<?php echo e(old('step', $employee->step)); ?>" min="1" max="20" placeholder="1-20">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="hire_date" class="form-label">የቅጥር ቀን / Hire Date</label>
                                    <input type="date" class="form-control" id="hire_date" name="hire_date" value="<?php echo e(old('hire_date', $employee->hire_date ? $employee->hire_date->format('Y-m-d') : '')); ?>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="assignment_date" class="form-label">የምደባ ቀን / Assignment Date</label>
                                    <input type="date" class="form-control" id="assignment_date" name="assignment_date" value="<?php echo e(old('assignment_date', $employee->assignment_date ? $employee->assignment_date->format('Y-m-d') : '')); ?>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pension_id" class="form-label">የጡረታ መለያ ቁጥር / Pension ID</label>
                                    <input type="text" class="form-control" id="pension_id" name="pension_id" value="<?php echo e(old('pension_id', $employee->pension_id)); ?>" placeholder="ፔንሽን ቁጥር">
                                </div>
                            </div>
                        </div>

                        <!-- Salary Information -->
                        <h6 class="text-warning mt-4 mb-3">💰 የደመወዝ መረጃ / Salary Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="salary" class="form-label">መሠረታዊ ደመወዝ / Basic Salary</label>
                                    <input type="number" step="0.01" class="form-control" id="salary" name="salary" value="<?php echo e(old('salary', $employee->salary)); ?>" placeholder="0.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="allowance" class="form-label">አበል / Allowance</label>
                                    <input type="number" step="0.01" class="form-control" id="allowance" name="allowance" value="<?php echo e(old('allowance', $employee->allowance)); ?>" placeholder="0.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="housing_allowance" class="form-label">የቤት ኪራይ / Housing Allowance</label>
                                    <input type="number" step="0.01" class="form-control" id="housing_allowance" name="housing_allowance" value="<?php echo e(old('housing_allowance', $employee->housing_allowance)); ?>" placeholder="0.00">
                                </div>
                            </div>
                        </div>

                        <!-- Education Section -->
                        <h6 class="text-warning mt-4 mb-3">🎓 የትምህርት መረጃ / Education Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="education_level" class="form-label">የትምህርት ደረጃ / Education Level</label>
                                    <select class="form-select" id="education_level" name="education_level">
                                        <option value="">ደረጃ ይምረጡ</option>
                                        <option value="High School" <?php echo e(old('education_level', $employee->education_level) == 'High School' ? 'selected' : ''); ?>>ሁለተኛ ደረጃ / High School</option>
                                        <option value="Certificate" <?php echo e(old('education_level', $employee->education_level) == 'Certificate' ? 'selected' : ''); ?>>ሰርተፍኬት / Certificate</option>
                                        <option value="Diploma" <?php echo e(old('education_level', $employee->education_level) == 'Diploma' ? 'selected' : ''); ?>>ዲፕሎማ / Diploma</option>
                                        <option value="Bachelor" <?php echo e(old('education_level', $employee->education_level) == 'Bachelor' ? 'selected' : ''); ?>>ባችለር / Bachelor</option>
                                        <option value="Master" <?php echo e(old('education_level', $employee->education_level) == 'Master' ? 'selected' : ''); ?>>ማስተርስ / Master</option>
                                        <option value="PhD" <?php echo e(old('education_level', $employee->education_level) == 'PhD' ? 'selected' : ''); ?>>ዶክትሬት / PhD</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="education_type" class="form-label">የትምህርት አይነት / Education Type</label>
                                    <input type="text" class="form-control" id="education_type" name="education_type" value="<?php echo e(old('education_type', $employee->education_type)); ?>" placeholder="ለምሳሌ: የሙያ ትምህርት">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="institution" class="form-label">ተቋም / Institution</label>
                                    <input type="text" class="form-control" id="institution" name="institution" value="<?php echo e(old('institution', $employee->institution)); ?>" placeholder="የትምህርት ተቋም">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="graduation_date" class="form-label">የተመረቁበት ቀን / Graduation Date</label>
                                    <input type="date" class="form-control" id="graduation_date" name="graduation_date" value="<?php echo e(old('graduation_date', $employee->graduation_date ? $employee->graduation_date->format('Y-m-d') : '')); ?>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="cgpa" class="form-label">አማካይ ውጤት / CGPA</label>
                                    <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="<?php echo e(old('cgpa', $employee->cgpa)); ?>" placeholder="0.00" max="4.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label d-block">ማረጋገጫ / Certifications</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="coc_certificate" name="coc_certificate" value="1" <?php echo e(old('coc_certificate', $employee->coc_certificate) ? 'checked' : ''); ?>>
                                        <label class="form-check-label" for="coc_certificate">COC የምስክር ወረቀት / COC Certificate</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="higher_ed_verified" name="higher_ed_verified" value="1" <?php echo e(old('higher_ed_verified', $employee->higher_ed_verified) ? 'checked' : ''); ?>>
                                        <label class="form-check-label" for="higher_ed_verified">ከፍተኛ ትምህርት የተረጋገጠ / Higher Ed Verified</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Work Experience -->
                        <h6 class="text-warning mt-4 mb-3">⏳ የሥራ ልምድ / Work Experience</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <strong>የአሁኑ የሥራ / Current Job</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="current_job_title" class="form-label">የሥራ ኃላፊነት / Job Title</label>
                                            <input type="text" class="form-control" id="current_job_title" name="current_job_title" value="<?php echo e(old('current_job_title', $employee->current_job_title)); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="current_institution" class="form-label">ተቋም / Institution</label>
                                            <input type="text" class="form-control" id="current_institution" name="current_institution" value="<?php echo e(old('current_institution', $employee->current_institution)); ?>">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="experience_from" class="form-label">ከ / From</label>
                                                <input type="date" class="form-control" id="experience_from" name="experience_from" value="<?php echo e(old('experience_from', $employee->experience_from ? $employee->experience_from->format('Y-m-d') : '')); ?>">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="experience_to" class="form-label">እስከ / To</label>
                                                <input type="date" class="form-control" id="experience_to" name="experience_to" value="<?php echo e(old('experience_to', $employee->experience_to ? $employee->experience_to->format('Y-m-d') : '')); ?>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <strong>የቀድሞ የሥራ / Previous Job</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="previous_job_title" class="form-label">የሥራ ኃላፊነት / Job Title</label>
                                            <input type="text" class="form-control" id="previous_job_title" name="previous_job_title" value="<?php echo e(old('previous_job_title', $employee->previous_job_title)); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="previous_institution" class="form-label">ተቋም / Institution</label>
                                            <input type="text" class="form-control" id="previous_institution" name="previous_institution" value="<?php echo e(old('previous_institution', $employee->previous_institution)); ?>">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="previous_from" class="form-label">ከ / From</label>
                                                <input type="date" class="form-control" id="previous_from" name="previous_from" value="<?php echo e(old('previous_from', $employee->previous_from ? $employee->previous_from->format('Y-m-d') : '')); ?>">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="previous_to" class="form-label">እስከ / To</label>
                                                <input type="date" class="form-control" id="previous_to" name="previous_to" value="<?php echo e(old('previous_to', $employee->previous_to ? $employee->previous_to->format('Y-m-d') : '')); ?>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional Information -->
                        <h6 class="text-warning mt-4 mb-3">📎 ተጨማሪ / Additional</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="disability_type" class="form-label">የአካል ጉዳት / Disability Type</label>
                                    <select class="form-select" id="disability_type" name="disability_type">
                                        <option value="">አይነት ይምረጡ</option>
                                        <option value="None" <?php echo e(old('disability_type', $employee->disability_type) == 'None' ? 'selected' : ''); ?>>የለም / None</option>
                                        <option value="Physical" <?php echo e(old('disability_type', $employee->disability_type) == 'Physical' ? 'selected' : ''); ?>>አካላዊ / Physical</option>
                                        <option value="Visual" <?php echo e(old('disability_type', $employee->disability_type) == 'Visual' ? 'selected' : ''); ?>>የማየት / Visual</option>
                                        <option value="Hearing" <?php echo e(old('disability_type', $employee->disability_type) == 'Hearing' ? 'selected' : ''); ?>>የመስማት / Hearing</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label for="diagnosis" class="form-label">ምርመራ / Diagnosis</label>
                                    <textarea class="form-control" id="diagnosis" name="diagnosis" rows="2"><?php echo e(old('diagnosis', $employee->diagnosis)); ?></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Current Files -->
                        <?php if($employee->photo || $employee->document): ?>
                        <div class="row mt-3">
                            <div class="col-12">
                                <h6 class="text-info">አሁን ያሉ ፋይሎች / Current Files</h6>
                            </div>
                            <?php if($employee->photo): ?>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <img src="<?php echo e(asset($employee->photo)); ?>" alt="Photo" class="img-fluid rounded" style="max-height: 100px;">
                                        <p class="mt-2">የአሁን ፎቶ / Current Photo</p>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                            <?php if($employee->document): ?>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <i class="bx bx-file bx-lg"></i>
                                        <p class="mt-2">የአሁን ሰነድ / Current Document</p>
                                        <a href="<?php echo e(asset($employee->document)); ?>" target="_blank" class="btn btn-sm btn-info">View</a>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                        <?php endif; ?>

                        <!-- File Uploads -->
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="photo" class="form-label">አዲስ ፎቶ / New Photo (ካስፈለገ / Optional)</label>
                                    <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
                                    <small class="text-muted">ፎቶ ከሆነ (JPG, PNG, max 2MB)</small>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="document" class="form-label">አዲስ ሰነድ / New Document (ካስፈለገ / Optional)</label>
                                    <input type="file" class="form-control" id="document" name="document" accept=".pdf,.doc,.docx">
                                    <small class="text-muted">ሰነድ ከሆነ (PDF, DOC, max 5MB)</small>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Buttons -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button type="submit" class="btn btn-warning">
                                    <i class="bx bx-save"></i> አስተካክል / Update Employee
                                </button>
                                <a href="<?php echo e(route('employees.index')); ?>" class="btn btn-secondary">
                                    <i class="bx bx-x"></i> ሰርዝ / Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/employees/edit.blade.php ENDPATH**/ ?>