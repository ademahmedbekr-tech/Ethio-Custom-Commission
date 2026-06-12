<?php $__env->startSection('content'); ?>
<div class="container-xxl flex-grow-1 container-p-y">
    <!-- Form Wizard Heading -->
    <h4 class="py-3 mb-4">
        <span class="text-muted fw-light">ሠራተኛ /</span> የሠራተኛ መረጃ ማስተካከያ
    </h4>

    <!-- Modern Numbered Form Wizard -->
    <div id="wizard-numbered" class="bs-stepper wizard-numbered linear mt-2">
        <div class="bs-stepper-header">
            <!-- Step 1 Link -->
            <div class="step" data-target="#personal-info">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">1</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">የግል መረጃ</span>
                        <span class="bs-stepper-subtitle">Personal Info</span>
                    </span>
                </button>
            </div>
            <div class="line"><i class="bx bx-chevron-right"></i></div>

            <!-- Step 2 Link -->
            <div class="step" data-target="#contact-info">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">2</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">መገኛ አድራሻ</span>
                        <span class="bs-stepper-subtitle">Contact Info</span>
                    </span>
                </button>
            </div>
            <div class="line"><i class="bx bx-chevron-right"></i></div>

            <!-- Step 3 Link -->
            <div class="step" data-target="#job-info">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">3</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">የሥራና ደመወዝ</span>
                        <span class="bs-stepper-subtitle">Job & Salary</span>
                    </span>
                </button>
            </div>
            <div class="line"><i class="bx bx-chevron-right"></i></div>

            <!-- Step 4 Link -->
            <div class="step" data-target="#education-info">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">4</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">የትምህርት መረጃ</span>
                        <span class="bs-stepper-subtitle">Education</span>
                    </span>
                </button>
            </div>
            <div class="line"><i class="bx bx-chevron-right"></i></div>

            <!-- Step 5 Link -->
            <div class="step" data-target="#files-docs">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">5</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">ፋይሎችና ሰነዶች</span>
                        <span class="bs-stepper-subtitle">Files & Docs</span>
                    </span>
                </button>
            </div>
        </div>

        <div class="bs-stepper-content card shadow-none border-top">
            <form id="wizard-numbered-form" action="<?php echo e(route('employees.update', $employee->id)); ?>" method="POST" enctype="multipart/form-data">
                <?php echo csrf_field(); ?>
                <?php echo method_field('PUT'); ?>

                <!-- STEP 1: Personal Information -->
                <div id="personal-info" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-warning">📋 የግል መረጃ / Personal Information</h6>
                        <small>የሠራተኛውን መሠረታዊ መረጃዎች እዚህ ያሻሽሉ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="employee_name" class="form-label">ሙሉ ስም / Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control <?php $__errorArgs = ['employee_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="employee_name" name="employee_name" value="<?php echo e(old('employee_name', $employee->employee_name)); ?>" placeholder="ሙሉ ስም ያስገቡ" required>
                            <?php $__errorArgs = ['employee_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-6">
                            <label for="file_number" class="form-label">የፋይል ቁጥር / File Number</label>
                            <input type="text" class="form-control <?php $__errorArgs = ['file_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="file_number" name="file_number" value="<?php echo e(old('file_number', $employee->file_number)); ?>" placeholder="ራስ-ሰር ይመነጫል / Auto-generated">
                            <?php $__errorArgs = ['file_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
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
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
                            <label for="date_of_birth" class="form-label">የልደት ቀን / Date of Birth</label>
                            <input type="date" class="form-control <?php $__errorArgs = ['date_of_birth'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="date_of_birth" name="date_of_birth" value="<?php echo e(old('date_of_birth', $employee->date_of_birth ? $employee->date_of_birth->format('Y-m-d') : '')); ?>">
                            <?php $__errorArgs = ['date_of_birth'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
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
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-6">
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
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-6">
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
                                <option value="ኦርቶዶክስ" <?php echo e(old('religion', $employee->religion) == 'ኦርቶዶክስ' ? 'selected' : ''); ?>>Orthodox</option>
                                <option value="ፕሮቴስታንት" <?php echo e(old('religion', $employee->religion) == 'ፕሮቴስታንት' ? 'selected' : ''); ?>>Protestant</option>
                                <option value="ሙስሊም" <?php echo e(old('religion', $employee->religion) == 'ሙስሊም' ? 'selected' : ''); ?>>Muslim</option>
                                <option value="Waaqeeffannaa" <?php echo e(old('religion', $employee->religion) == 'Waaqeeffannaa' ? 'selected' : ''); ?>>Waaqeeffannaa</option>
                                <option value="Other" <?php echo e(old('religion', $employee->religion) == 'Other' ? 'selected' : ''); ?>>Other</option>
                            </select>
                            <?php $__errorArgs = ['religion'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-label-secondary" disabled>
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <button type="button" class="btn btn-primary btn-next">
                            ቀጣይ ገጽ <i class="bx bx-chevron-right ms-1"></i>
                        </button>
                    </div>
                </div>

                <!-- STEP 2: Contact Information -->
                <div id="contact-info" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-warning">📞 መገኛ / Contact Information</h6>
                        <small>አድራሻና የመገናኛ መረጃዎችን ያሻሽሉ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
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
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
                            <label for="zone" class="form-label">ዞን / Zone</label>
                            <input type="text" class="form-control" id="zone" name="zone" value="<?php echo e(old('zone', $employee->zone)); ?>" placeholder="ዞን / Zone">
                        </div>
                        <div class="col-md-4">
                            <label for="district" class="form-label">ወረዳ / District</label>
                            <input type="text" class="form-control" id="district" name="district" value="<?php echo e(old('district', $employee->district)); ?>" placeholder="ወረዳ / District">
                        </div>
                        <div class="col-md-6">
                            <label for="specific_location" class="form-label">ልዩ አድራሻ / Specific Location</label>
                            <input type="text" class="form-control" id="specific_location" name="specific_location" value="<?php echo e(old('specific_location', $employee->specific_location)); ?>" placeholder="ከተማ / ቀበሌ">
                        </div>
                        <div class="col-md-6">
                            <label for="house_number" class="form-label">ቤት ቁጥር / House Number</label>
                            <input type="text" class="form-control" id="house_number" name="house_number" value="<?php echo e(old('house_number', $employee->house_number)); ?>" placeholder="ቤት ቁጥር">
                        </div>
                        <div class="col-md-4">
                            <label for="phone_number" class="form-label">ስልክ ቁጥር / Phone Number</label>
                            <input type="text" class="form-control <?php $__errorArgs = ['phone_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="phone_number" name="phone_number" value="<?php echo e(old('phone_number', $employee->phone_number)); ?>" placeholder="+251911223344">
                            <?php $__errorArgs = ['phone_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
                            <label for="email" class="form-label">ኢሜይል / Email</label>
                            <input type="email" class="form-control <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="email" name="email" value="<?php echo e(old('email', $employee->email)); ?>" placeholder="name@example.com">
                            <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <div class="col-md-4">
                            <label for="fan_number" class="form-label">Fayda Alias Number</label>
                            <input type="text" class="form-control <?php $__errorArgs = ['fan_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="fan_number" name="fan_number" value="<?php echo e(old('fan_number', $employee->fan_number)); ?>" placeholder="Enter NID FAN Number">
                            <?php $__errorArgs = ['fan_number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <div class="invalid-feedback"><?php echo e($message); ?></div> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-secondary btn-prev">
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <button type="button" class="btn btn-primary btn-next">
                            ቀጣይ ገጽ <i class="bx bx-chevron-right ms-1"></i>
                        </button>
                    </div>
                </div>

                <!-- STEP 3: Job and Salary Information -->
                <div id="job-info" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-warning">💼 የሥራና ደመወዝ መረጃ / Job & Salary Information</h6>
                        <small>የቅጥር ደረጃ እና የደመወዝ መግለጫዎችን ያስተካክሉ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="job_title" class="form-label">የሥራ መደብ / Job Title</label>
                            <input type="text" class="form-control" id="job_title" name="job_title" value="<?php echo e(old('job_title', $employee->job_title)); ?>" placeholder="ለምሳሌ: ኢንስፔክተር">
                        </div>
                        <div class="col-md-4">
                            <label for="job_level" class="form-label">የአገልግሎት ደረጃ / Job Level</label>
                            <input type="number" class="form-control" id="job_level" name="job_level" value="<?php echo e(old('job_level', $employee->job_level)); ?>" min="1" max="100" placeholder="1-20">
                        </div>
                        <div class="col-md-4">
                            <label for="step" class="form-label">ደረጃ / Step</label>
                            <input type="number" class="form-control" id="step" name="step" value="<?php echo e(old('step', $employee->step)); ?>" min="1" max="20" placeholder="1-20">
                        </div>
                        <div class="col-md-4">
                            <label for="hire_date" class="form-label">የቅጥር ቀን / Hire Date</label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date" value="<?php echo e(old('hire_date', $employee->hire_date ? $employee->hire_date->format('Y-m-d') : '')); ?>">
                        </div>
                        <div class="col-md-4">
                            <label for="assignment_date" class="form-label">የምደባ ቀን / Assignment Date</label>
                            <input type="date" class="form-control" id="assignment_date" name="assignment_date" value="<?php echo e(old('assignment_date', $employee->assignment_date ? $employee->assignment_date->format('Y-m-d') : '')); ?>">
                        </div>
                        <div class="col-md-4">
                            <label for="pension_id" class="form-label">የጡረታ መለያ ቁጥር / Pension ID</label>
                            <input type="text" class="form-control" id="pension_id" name="pension_id" value="<?php echo e(old('pension_id', $employee->pension_id)); ?>" placeholder="ፔንሽን ቁጥር">
                        </div>

                        <!-- Salary Header -->
                        <div class="col-12 mt-4">
                            <h6 class="mb-0 fw-bold text-warning">💰 የደመወዝ መረጃ / Salary Information</h6>
                            <hr class="mt-1 mb-2">
                        </div>

                        <div class="col-md-4">
                            <label for="salary" class="form-label">መሠረታዊ ደመወዝ / Basic Salary</label>
                            <input type="number" step="0.01" class="form-control" id="salary" name="salary" value="<?php echo e(old('salary', $employee->salary)); ?>" placeholder="0.00">
                        </div>
                        <div class="col-md-4">
                            <label for="allowance" class="form-label">አበል / Allowance</label>
                            <input type="number" step="0.01" class="form-control" id="allowance" name="allowance" value="<?php echo e(old('allowance', $employee->allowance)); ?>" placeholder="0.00">
                        </div>
                        <div class="col-md-4">
                            <label for="housing_allowance" class="form-label">የቤት ኪራይ / Housing Allowance</label>
                            <input type="number" step="0.01" class="form-control" id="housing_allowance" name="housing_allowance" value="<?php echo e(old('housing_allowance', $employee->housing_allowance)); ?>" placeholder="0.00">
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-secondary btn-prev">
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <button type="button" class="btn btn-primary btn-next">
                            ቀጣይ ገጽ <i class="bx bx-chevron-right ms-1"></i>
                        </button>
                    </div>
                </div>

                <!-- STEP 4: Education & Experience Information -->
                <div id="education-info" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-warning">🎓 የትምህርትና የሥራ ልምድ / Education & Experience</h6>
                        <small>የትምህርት ደረጃዎችንና የሥራ ልምድ ዝርዝር መረጃዎችን እዚህ ያሻሽሉ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
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
                        <div class="col-md-4">
                            <label for="education_type" class="form-label">የትምህርት አይነት / Education Type</label>
                            <input type="text" class="form-control" id="education_type" name="education_type" value="<?php echo e(old('education_type', $employee->education_type)); ?>" placeholder="ለምሳሌ: የሙያ ትምህርት">
                        </div>
                        <div class="col-md-4">
                            <label for="institution" class="form-label">ተቋም / Institution</label>
                            <input type="text" class="form-control" id="institution" name="institution" value="<?php echo e(old('institution', $employee->institution)); ?>" placeholder="የትምህርት ተቋም">
                        </div>
                        <div class="col-md-4">
                            <label for="graduation_date" class="form-label">የተመረቁበት ቀን / Graduation Date</label>
                            <input type="date" class="form-control" id="graduation_date" name="graduation_date" value="<?php echo e(old('graduation_date', $employee->graduation_date ? $employee->graduation_date->format('Y-m-d') : '')); ?>">
                        </div>
                        <div class="col-md-4">
                            <label for="cgpa" class="form-label">አማካይ ውጤት / CGPA</label>
                            <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="<?php echo e(old('cgpa', $employee->cgpa)); ?>" placeholder="0.00" max="4.00">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label d-block">ማረጋገጫ / Certifications</label>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="checkbox" id="coc_certificate" name="coc_certificate" value="1" <?php echo e(old('coc_certificate', $employee->coc_certificate) ? 'checked' : ''); ?>>
                                <label class="form-check-label" for="coc_certificate">COC ማረጋገጫ</label>
                            </div>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="checkbox" id="higher_ed_verified" name="higher_ed_verified" value="1" <?php echo e(old('higher_ed_verified', $employee->higher_ed_verified) ? 'checked' : ''); ?>>
                                <label class="form-check-label" for="higher_ed_verified">ትምህርት የተረጋገጠ</label>
                            </div>
                        </div>

                        <!-- Compact Job Experience Cards -->
                        <div class="col-md-6 mt-3">
                            <div class="card bg-light border shadow-none mb-0">
                                <div class="card-body p-3">
                                    <h6 class="fw-bold mb-2 text-primary">የአሁኑ የሥራ / Current Job</h6>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="current_job_title" name="current_job_title" value="<?php echo e(old('current_job_title', $employee->current_job_title)); ?>" placeholder="የሥራ ኃላፊነት / Job Title">
                                    </div>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="current_institution" name="current_institution" value="<?php echo e(old('current_institution', $employee->current_institution)); ?>" placeholder="ተቋም / Institution">
                                    </div>
                                    <div class="row g-2">
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="experience_from" name="experience_from" value="<?php echo e(old('experience_from', $employee->experience_from ? $employee->experience_from->format('Y-m-d') : '')); ?>"></div>
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="experience_to" name="experience_to" value="<?php echo e(old('experience_to', $employee->experience_to ? $employee->experience_to->format('Y-m-d') : '')); ?>"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mt-3">
                            <div class="card bg-light border shadow-none mb-0">
                                <div class="card-body p-3">
                                    <h6 class="fw-bold mb-2 text-secondary">የቀድሞ የሥራ / Previous Job</h6>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="previous_job_title" name="previous_job_title" value="<?php echo e(old('previous_job_title', $employee->previous_job_title)); ?>" placeholder="የሥራ ኃላፊነት / Job Title">
                                    </div>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="previous_institution" name="previous_institution" value="<?php echo e(old('previous_institution', $employee->previous_institution)); ?>" placeholder="ተቋም / Institution">
                                    </div>
                                    <div class="row g-2">
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="previous_from" name="previous_from" value="<?php echo e(old('previous_from', $employee->previous_from ? $employee->previous_from->format('Y-m-d') : '')); ?>"></div>
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="previous_to" name="previous_to" value="<?php echo e(old('previous_to', $employee->previous_to ? $employee->previous_to->format('Y-m-d') : '')); ?>"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-secondary btn-prev">
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <button type="button" class="btn btn-primary btn-next">
                            ቀጣይ ገጽ <i class="bx bx-chevron-right ms-1"></i>
                        </button>
                    </div>
                </div>

                <!-- STEP 5: Additional Info & File Updates -->
                <div id="files-docs" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-warning">📎 ተጨማሪ መረጃና ሰነዶች / Additional Info & Files</h6>
                        <small>የአካል ጉዳት ሁኔታዎችን ይመዝግቡ እና ፋይሎችን ያዘምኑ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="disability_type" class="form-label">የአካል ጉዳት / Disability Type</label>
                            <select class="form-select" id="disability_type" name="disability_type">
                                <option value="">አይነት ይምረጡ</option>
                                <option value="None" <?php echo e(old('disability_type', $employee->disability_type) == 'None' ? 'selected' : ''); ?>>የለም / None</option>
                                <option value="Physical" <?php echo e(old('disability_type', $employee->disability_type) == 'Physical' ? 'selected' : ''); ?>>አካላዊ / Physical</option>
                                <option value="Visual" <?php echo e(old('disability_type', $employee->disability_type) == 'Visual' ? 'selected' : ''); ?>>የማየት / Visual</option>
                                <option value="Hearing" <?php echo e(old('disability_type', $employee->disability_type) == 'Hearing' ? 'selected' : ''); ?>>የመስማት / Hearing</option>
                            </select>
                        </div>
                        <div class="col-md-8">
                            <label for="diagnosis" class="form-label">ምርመራ / Diagnosis</label>
                            <input type="text" class="form-control" id="diagnosis" name="diagnosis" value="<?php echo e(old('diagnosis', $employee->diagnosis)); ?>" placeholder="የምርመራ ዝርዝር መግለጫ">
                        </div>

                        <!-- DISPLAY EXISTING FILES -->
                        <?php if($employee->photo || $employee->document || $employee->fayda): ?>
                            <div class="col-12 mt-3">
                                <div class="card card-action bg-label-dark shadow-none border">
                                    <div class="card-header p-3"><h6 class="mb-0 fw-bold">አሁን ያሉ ፋይሎች / Current Files</h6></div>
                                    <div class="card-body p-3">
                                        <div class="row g-2">
                                            <?php if($employee->photo): ?>
                                                <div class="col-md-4 text-center">
                                                    <div class="bg-white p-2 border rounded">
                                                        <img src="<?php echo e(asset($employee->photo)); ?>" alt="Photo" class="img-fluid rounded" style="max-height: 80px;">
                                                        <small class="d-block text-muted mt-1">የአሁን ፎቶ</small>
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <?php if($employee->document): ?>
                                                <div class="col-md-4 text-center">
                                                    <div class="bg-white p-2 border rounded" style="height: 100px; overflow: hidden;">
                                                        <object class="magnific" data="<?php echo e(asset($employee->document)); ?>" type="application/pdf" width="100%" height="100%"></object>
                                                        <small class="d-block text-muted mt-1">የአሁን ሰነድ</small>
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <?php if($employee->fayda): ?>
                                                <div class="col-md-4 text-center">
                                                    <div class="bg-white p-2 border rounded" style="height: 100px; overflow: hidden;">
                                                        <object class="magnific" data="<?php echo e(asset($employee->fayda)); ?>" type="application/pdf" width="100%" height="100%"></object>
                                                        <small class="d-block text-muted mt-1">Other Document</small>
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>

                        <!-- FILE UPLOADS FOR REPLACEMENT -->
                        <div class="col-md-4 mt-3">
                            <label for="photo" class="form-label">አዲስ ፎቶ / New Photo (Optional)</label>
                            <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
                        </div>
                        <div class="col-md-4 mt-3">
                            <label for="document" class="form-label">አዲስ ሰነድ / New Document (Optional)</label>
                            <input type="file" class="form-control" id="document" name="document" accept=".pdf,.doc,.docx">
                        </div>
                        <div class="col-md-4 mt-3">
                            <label for="fayda" class="form-label">አዲስ ሰነድ / Fayda NationalID</label>
                            <input type="file" class="form-control" id="fayda" name="fayda" accept=".pdf,.doc,.docx">
                        </div>
                    </div>

                    <!-- Actions Footer -->
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-secondary btn-prev">
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <div>
                            <a href="<?php echo e(route('employees.index')); ?>" class="btn btn-label-secondary me-2">ሰርዝ / Cancel</a>
                            <button type="submit" class="btn btn-warning">
                                <i class="bx bx-save me-1"></i> አስተካክል / Update Employee
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const wizardNumbered = document.querySelector('#wizard-numbered');

        if (typeof FormValidation !== 'undefined' && wizardNumbered !== null) {
            const wizardNumberedBtnNextList = [].slice.call(wizardNumbered.querySelectorAll('.btn-next'));
            const wizardNumberedBtnPrevList = [].slice.call(wizardNumbered.querySelectorAll('.btn-prev'));

            const numberedStepper = new Stepper(wizardNumbered, {
                linear: false
            });

            wizardNumberedBtnNextList.forEach(btn => {
                btn.addEventListener('click', event => {
                    numberedStepper.next();
                });
            });

            wizardNumberedBtnPrevList.forEach(btn => {
                btn.addEventListener('click', event => {
                    numberedStepper.previous();
                });
            });
        }
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/employees/edit.blade.php ENDPATH**/ ?>