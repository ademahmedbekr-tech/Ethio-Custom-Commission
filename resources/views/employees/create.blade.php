@extends('layouts.app')

@section('content')
<div class="container-xxl flex-grow-1 container-p-y">
    <!-- Form Wizard Heading -->
    <h4 class="py-3 mb-4">
        <span class="text-muted fw-light">ሠራተኛ /</span> አዲስ ሠራተኛ መዝግብ
    </h4>

    <!-- Modern Numbered Form Wizard -->
    <div id="wizard-numbered" class="bs-stepper wizard-numbered linear mt-2">
        <div class="bs-stepper-header">
            <!-- Step 1 Link -->
            <div class="step" data-target="#personal-info">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">1</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">የግil መረጃ</span>
                        <span class="bs-stepper-subtitle">Personal Info</span>
                    </span>
                </button>
            </div>
            <div class="line">
                <i class="bx bx-chevron-right"></i>
            </div>
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
            <div class="line">
                <i class="bx bx-chevron-right"></i>
            </div>
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
            <div class="line">
                <i class="bx bx-chevron-right"></i>
            </div>
            <!-- Step 4 Link -->
            <div class="step" data-target="#education-docs">
                <button type="button" class="step-trigger">
                    <span class="bs-stepper-circle">4</span>
                    <span class="bs-stepper-label">
                        <span class="bs-stepper-title">ትምህርትና ሰነድ</span>
                        <span class="bs-stepper-subtitle">Education & Docs</span>
                    </span>
                </button>
            </div>
        </div>

        <div class="bs-stepper-content card shadow-none border-top">
            <form id="wizard-numbered-form" action="{{ route('employees.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <!-- STEP 1: Personal Information -->
                <div id="personal-info" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-primary">📋 የግል መረጃ / Personal Information</h6>
                        <small>የሠራተኛውን መሠረታዊ መረጃዎች በትክክል ያስገቡ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="employee_name" class="form-label">ሙሉ ስም / Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('employee_name') is-invalid @enderror" id="employee_name" name="employee_name" value="{{ old('employee_name') }}" placeholder="ሙሉ ስም ያስገቡ" required>
                            @error('employee_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-6">
                            <label for="file_number" class="form-label">የፋይል ቁጥር / File Number</label>
                            <input type="text" class="form-control @error('file_number') is-invalid @enderror" id="file_number" name="file_number" value="{{ old('file_number') }}" placeholder="ራስ-ሰር ይመነጫል / Auto-generated">
                            @error('file_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="gender" class="form-label">ፆታ / Gender</label>
                            <select class="form-select @error('gender') is-invalid @enderror" id="gender" name="gender">
                                <option value="">ፆታ ይምረጡ / Select Gender</option>
                                <option value="ወ" {{ old('gender') == 'ወ' ? 'selected' : '' }}>ወንድ / Male</option>
                                <option value="ሴ" {{ old('gender') == 'ሴ' ? 'selected' : '' }}>ሴት / Female</option>
                                <option value="ሌላ" {{ old('gender') == 'ሌላ' ? 'selected' : '' }}>ሌላ / Other</option>
                            </select>
                            @error('gender') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="date_of_birth" class="form-label">የልደት ቀን / Date of Birth</label>
                            <input type="date" class="form-control @error('date_of_birth') is-invalid @enderror" id="date_of_birth" name="date_of_birth" value="{{ old('date_of_birth') }}">
                            @error('date_of_birth') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="marital_status" class="form-label">የትዳር ሁኔታ / Marital Status</label>
                            <select class="form-select @error('marital_status') is-invalid @enderror" id="marital_status" name="marital_status">
                                <option value="">ሁኔታ ይምረጡ</option>
                                <option value="Single" {{ old('marital_status') == 'Single' ? 'selected' : '' }}>ነጠላ / Single</option>
                                <option value="Married" {{ old('marital_status') == 'Married' ? 'selected' : '' }}>ያገቡ / Married</option>
                                <option value="Divorced" {{ old('marital_status') == 'Divorced' ? 'selected' : '' }}>የተፋቱ / Divorced</option>
                                <option value="Widowed" {{ old('marital_status') == 'Widowed' ? 'selected' : '' }}>ባል/ሚስት የሞቱ / Widowed</option>
                            </select>
                            @error('marital_status') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-6">
                            <label for="ethnicity" class="form-label">ብሔር / Ethnicity</label>
                            <select class="form-select @error('ethnicity') is-invalid @enderror" id="ethnicity" name="ethnicity">
                                <option value="">ብሔር ይምረጡ</option>
                                <option value="Oromo" {{ old('ethnicity') == 'Oromo' ? 'selected' : '' }}>ኦሮሞ / Oromo</option>
                                <option value="Amhara" {{ old('ethnicity') == 'Amhara' ? 'selected' : '' }}>አማራ / Amhara</option>
                                <option value="Tigray" {{ old('ethnicity') == 'Tigray' ? 'selected' : '' }}>ትግራይ / Tigray</option>
                                <option value="Somali" {{ old('ethnicity') == 'Somali' ? 'selected' : '' }}>ሶማሌ / Somali</option>
                                <option value="Gurage" {{ old('ethnicity') == 'Gurage' ? 'selected' : '' }}>ጉራጌ / Gurage</option>
                                <option value="Other" {{ old('ethnicity') == 'Other' ? 'selected' : '' }}>ሌላ / Other</option>
                            </select>
                            @error('ethnicity') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-6">
                            <label for="religion" class="form-label">ሃይማኖት / Religion</label>
                            <select class="form-select @error('religion') is-invalid @enderror" id="religion" name="religion">
                                <option value="">ሃይማኖት ይምረጡ</option>
                                <option value="ኦርቶዶክስ" {{ old('religion') == 'ኦርቶዶክስ' ? 'selected' : '' }}>Orthodox</option>
                                <option value="ፕሮቴስታንት" {{ old('religion') == 'ፕሮቴስታንት' ? 'selected' : '' }}>Protestant</option>
                                <option value="ሙስሊም" {{ old('religion') == 'ሙስሊም' ? 'selected' : '' }}>Muslim</option>
                                <option value="Waaqeeffannaa" {{ old('religion') == 'Waaqeeffannaa' ? 'selected' : '' }}>Waaqeeffannaa</option>
                                <option value="Other" {{ old('religion') == 'Other' ? 'selected' : '' }}>Other</option>
                            </select>
                            @error('religion') <div class="invalid-feedback">{{ $message }}</div> @enderror
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
                        <h6 class="mb-0 fw-bold text-primary">📞 መገኛ / Contact Information</h6>
                        <small>አድራሻና የኮሙኒኬሽን መረጃዎችን ያስገቡ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="region" class="form-label">ክልል / Region</label>
                            <select class="form-select @error('region') is-invalid @enderror" id="region" name="region">
                                <option value="">ክልል ይምረጡ</option>
                                <option value="Addis Ababa" {{ old('region') == 'Addis Ababa' ? 'selected' : '' }}>አዲስ አበባ / Addis Ababa</option>
                                <option value="Afar" {{ old('region') == 'Afar' ? 'selected' : '' }}>አፋር / Afar</option>
                                <option value="Amhara" {{ old('region') == 'Amhara' ? 'selected' : '' }}>አማራ / Amhara</option>
                                <option value="Benishangul-Gumuz" {{ old('region') == 'Benishangul-Gumuz' ? 'selected' : '' }}>ቤንሻንጉል ጉሙዝ / Benishangul-Gumuz</option>
                                <option value="Dire Dawa" {{ old('region') == 'Dire Dawa' ? 'selected' : '' }}>ድሬዳዋ / Dire Dawa</option>
                                <option value="Gambela" {{ old('region') == 'Gambela' ? 'selected' : '' }}>ጋምቤላ / Gambela</option>
                                <option value="Harari" {{ old('region') == 'Harari' ? 'selected' : '' }}>ሐረሪ / Harari</option>
                                <option value="Oromia" {{ old('region') == 'Oromia' ? 'selected' : '' }}>ኦሮሚያ / Oromia</option>
                                <option value="Sidama" {{ old('region') == 'Sidama' ? 'selected' : '' }}>ሲዳማ / Sidama</option>
                                <option value="Somali" {{ old('region') == 'Somali' ? 'selected' : '' }}>ሶማሌ / Somali</option>
                                <option value="SNNPR" {{ old('region') == 'SNNPR' ? 'selected' : '' }}>ደቡብ / SNNPR</option>
                                <option value="Tigray" {{ old('region') == 'Tigray' ? 'selected' : '' }}>ትግራይ / Tigray</option>
                            </select>
                            @error('region') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="zone" class="form-label">ዞን / Zone</label>
                            <input type="text" class="form-control" id="zone" name="zone" value="{{ old('zone') }}" placeholder="ዞን / Zone">
                        </div>
                        <div class="col-md-4">
                            <label for="district" class="form-label">ወረዳ / District</label>
                            <input type="text" class="form-control" id="district" name="district" value="{{ old('district') }}" placeholder="ወረዳ / District">
                        </div>
                        <div class="col-md-6">
                            <label for="specific_location" class="form-label">ልዩ አድራሻ / Specific Location</label>
                            <input type="text" class="form-control" id="specific_location" name="specific_location" value="{{ old('specific_location') }}" placeholder="ከተማ / ቀበሌ">
                        </div>
                        <div class="col-md-6">
                            <label for="house_number" class="form-label">ቤት ቁጥር / House Number</label>
                            <input type="text" class="form-control" id="house_number" name="house_number" value="{{ old('house_number') }}" placeholder="ቤት ቁጥር">
                        </div>
                        <div class="col-md-4">
                            <label for="phone_number" class="form-label">ስልክ ቁጥር / Phone Number</label>
                            <input type="text" class="form-control @error('phone_number') is-invalid @enderror" id="phone_number" name="phone_number" value="{{ old('phone_number') }}" placeholder="+251911223344">
                            @error('phone_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="email" class="form-label">ኢሜይል / Email</label>
                            <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" placeholder="name@example.com">
                            @error('email') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                        <div class="col-md-4">
                            <label for="fan_number" class="form-label">Fayda Alias Number</label>
                            <input type="text" class="form-control @error('fan_number') is-invalid @enderror" id="fan_number" name="fan_number" value="{{ old('fan_number') }}" placeholder="Enter NID FAN Number">
                            @error('fan_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
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
                        <h6 class="mb-0 fw-bold text-primary">💼 የሥራና ደመወዝ መረጃ / Job & Salary Information</h6>
                        <small>የቅጥር ሁኔታዎችን እና የበጀት መረጃዎችን ያስገቡ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="job_title" class="form-label">የሥራ መደብ / Job Title</label>
                            <input type="text" class="form-control" id="job_title" name="job_title" value="{{ old('job_title') }}" placeholder="ለምሳሌ: ኢንስፔክተር">
                        </div>
                        <div class="col-md-4">
                            <label for="job_level" class="form-label">የአገልግሎት ደረጃ / Job Level</label>
                            <input type="number" class="form-control" id="job_level" name="job_level" value="{{ old('job_level') }}" min="1" max="100" placeholder="1-20">
                        </div>
                        <div class="col-md-4">
                            <label for="step" class="form-label">ደረጃ / Step</label>
                            <input type="number" class="form-control" id="step" name="step" value="{{ old('step') }}" min="1" max="20" placeholder="Job Level">
                        </div>
                        <div class="col-md-4">
                            <label for="hire_date" class="form-label">የቅጥር ቀን / Hire Date</label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date" value="{{ old('hire_date') }}">
                        </div>
                        <div class="col-md-4">
                            <label for="assignment_date" class="form-label">የምደባ ቀን / Assignment Date</label>
                            <input type="date" class="form-control" id="assignment_date" name="assignment_date" value="{{ old('assignment_date') }}">
                        </div>
                        <div class="col-md-4">
                            <label for="pension_id" class="form-label">የጡረታ መለያ ቁጥር / Pension ID</label>
                            <input type="text" class="form-control" id="pension_id" name="pension_id" value="{{ old('pension_id') }}" placeholder="ፔንሽን ቁጥር">
                        </div>
                        <div class="col-md-4">
                            <label for="department" class="form-label">Department</label>
                            <select class="form-select" id="department" name="department">
                                <option value="">Select Department</option>
                                @if (!empty($department))
                                    @foreach ($department as $dept)
                                        <option value="{{ $dept->id }}">{{ $dept->name }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>

                        <!-- Divider line for context -->
                        <div class="col-12 mt-4">
                            <h6 class="mb-0 fw-bold text-primary">💰 የደመወዝ መረጃ / Salary Information</h6>
                            <hr class="mt-1 mb-2">
                        </div>

                        <div class="col-md-4">
                            <label for="salary" class="form-label">መሠረታዊ ደመወዝ / Basic Salary</label>
                            <input type="number" step="0.01" class="form-control" id="salary" name="salary" value="{{ old('salary') }}" placeholder="0.00">
                        </div>
                        <div class="col-md-4">
                            <label for="allowance" class="form-label">አበል / Allowance</label>
                            <input type="number" step="0.01" class="form-control" id="allowance" name="allowance" value="{{ old('allowance') }}" placeholder="0.00">
                        </div>
                        <div class="col-md-4">
                            <label for="housing_allowance" class="form-label">የቤት ኪራይ / Housing Allowance</label>
                            <input type="number" step="0.01" class="form-control" id="housing_allowance" name="housing_allowance" value="{{ old('housing_allowance') }}" placeholder="0.00">
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

                <!-- STEP 4: Education, Experience & File Uploads -->
                <div id="education-docs" class="content">
                    <div class="content-header mb-3">
                        <h6 class="mb-0 fw-bold text-primary">🎓 የትምህርትና ተጨማሪ መረጃዎች / Education & Uploads</h6>
                        <small>የትምህርት ደረጃ፣ የሥራ ልምድ እና ፋይሎችን አያይዘው ይጨርሱ።</small>
                    </div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="education_level" class="form-label">የትምህርት ደረጃ / Education Level</label>
                            <select class="form-select" id="education_level" name="education_level">
                                <option value="">ደረጃ ይምረጡ</option>
                                <option value="High School" {{ old('education_level') == 'High School' ? 'selected' : '' }}>ሁለተኛ ደረጃ / High School</option>
                                <option value="Certificate" {{ old('education_level') == 'Certificate' ? 'selected' : '' }}>ሰርተፍኬት / Certificate</option>
                                <option value="Diploma" {{ old('education_level') == 'Diploma' ? 'selected' : '' }}>ዲፕሎማ / Diploma</option>
                                <option value="Bachelor" {{ old('education_level') == 'Bachelor' ? 'selected' : '' }}>ባችለር / Bachelor</option>
                                <option value="Master" {{ old('education_level') == 'Master' ? 'selected' : '' }}>ማስተርስ / Master</option>
                                <option value="PhD" {{ old('education_level') == 'PhD' ? 'selected' : '' }}>ዶክትሬት / PhD</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="education_type" class="form-label">የትምህርት አይነት / Education Type</label>
                            <input type="text" class="form-control" id="education_type" name="education_type" value="{{ old('education_type') }}" placeholder="ለምሳሌ: የሙያ ትምህርት">
                        </div>
                        <div class="col-md-4">
                            <label for="institution" class="form-label">ተቋም / Institution</label>
                            <input type="text" class="form-control" id="institution" name="institution" value="{{ old('institution') }}" placeholder="የትምህርት ተቋም">
                        </div>
                        <div class="col-md-4">
                            <label for="graduation_date" class="form-label">የተመረቁበት ቀን / Graduation Date</label>
                            <input type="date" class="form-control" id="graduation_date" name="graduation_date" value="{{ old('graduation_date') }}">
                        </div>
                        <div class="col-md-4">
                            <label for="cgpa" class="form-label">አማካይ ውጤት / CGPA</label>
                            <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="{{ old('cgpa') }}" placeholder="0.00" max="4.00">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label d-block">ማረጋገጫ / Certifications</label>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="checkbox" id="coc_certificate" name="coc_certificate" value="1" {{ old('coc_certificate') ? 'checked' : '' }}>
                                <label class="form-check-label" for="coc_certificate">COC ማረጋገጫ</label>
                            </div>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="checkbox" id="higher_ed_verified" name="higher_ed_verified" value="1" {{ old('higher_ed_verified') ? 'checked' : '' }}>
                                <label class="form-check-label" for="higher_ed_verified">ትምህርት የተረጋገጠ</label>
                            </div>
                        </div>

                        <!-- Experience Accordion Row or compact visual cards -->
                        <div class="col-md-6">
                            <div class="card bg-light border shadow-none mb-0">
                                <div class="card-body p-3">
                                    <h6 class="fw-bold mb-2">የአሁኑ የሥራ / Current Job</h6>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="current_job_title" name="current_job_title" value="{{ old('current_job_title') }}" placeholder="የሥራ ኃላፊነት / Job Title">
                                    </div>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="current_institution" name="current_institution" value="{{ old('current_institution') }}" placeholder="ተቋም / Institution">
                                    </div>
                                    <div class="row g-2">
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="experience_from" name="experience_from" value="{{ old('experience_from') }}"></div>
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="experience_to" name="experience_to" value="{{ old('experience_to') }}"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card bg-light border shadow-none mb-0">
                                <div class="card-body p-3">
                                    <h6 class="fw-bold mb-2">የቀድሞ የሥራ / Previous Job</h6>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="previous_job_title" name="previous_job_title" value="{{ old('previous_job_title') }}" placeholder="የሥራ ኃላፊነት / Job Title">
                                    </div>
                                    <div class="mb-2">
                                        <input type="text" class="form-control form-control-sm" id="previous_institution" name="previous_institution" value="{{ old('previous_institution') }}" placeholder="ተቋም / Institution">
                                    </div>
                                    <div class="row g-2">
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="previous_from" name="previous_from" value="{{ old('previous_from') }}"></div>
                                        <div class="col-6"><input type="date" class="form-control form-control-sm" id="previous_to" name="previous_to" value="{{ old('previous_to') }}"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional & Uploads Info -->
                        <div class="col-md-4">
                            <label for="disability_type" class="form-label">የአካል ጉዳት / Disability Type</label>
                            <select class="form-select" id="disability_type" name="disability_type">
                                <option value="">አይነት ይምረጡ</option>
                                <option value="None" {{ old('disability_type') == 'None' ? 'selected' : '' }}>የለም / None</option>
                                <option value="Physical" {{ old('disability_type') == 'Physical' ? 'selected' : '' }}>አካላዊ / Physical</option>
                                <option value="Visual" {{ old('disability_type') == 'Visual' ? 'selected' : '' }}>የማየት / Visual</option>
                                <option value="Hearing" {{ old('disability_type') == 'Hearing' ? 'selected' : '' }}>የመስማት / Hearing</option>
                            </select>
                        </div>
                        <div class="col-md-8">
                            <label for="diagnosis" class="form-label">ምርመራ / Diagnosis</label>
                            <input type="text" class="form-control" id="diagnosis" name="diagnosis" value="{{ old('diagnosis') }}" placeholder="የምርመራ ዝርዝር መግለጫ">
                        </div>

                        <div class="col-md-4">
                            <label for="photo" class="form-label">ፎቶ / Photo</label>
                            <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
                        </div>
                        <div class="col-md-4">
                            <label for="document" class="form-label">ሰነድ / Document</label>
                            <input type="file" class="form-control" id="document" name="document" accept=".pdf,.doc,.docx">
                        </div>
                        <div class="col-md-4">
                            <label for="fayda" class="form-label">Fayda NationalID ሰነድ</label>
                            <input type="file" class="form-control" id="fayda" name="fayda" accept=".pdf,.doc,.docx">
                        </div>
                    </div>

                    <!-- Final Wizard Submission Actions -->
                    <div class="col-12 d-flex justify-content-between mt-4">
                        <button type="button" class="btn btn-secondary btn-prev">
                            <i class="bx bx-chevron-left me-1"></i> የቀድሞ ገጽ
                        </button>
                        <div>
                            <a href="{{ route('employees.index') }}" class="btn btn-label-secondary me-2">ሰርዝ / Cancel</a>
                            <button type="submit" class="btn btn-success">
                                <i class="bx bx-save me-1"></i> መዝግብ / Save Employee
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const wizardNumbered = document.querySelector('#wizard-numbered');

        if (typeof FormValidation !== 'undefined' && wizardNumbered !== null) {
            const wizardNumberedBtnNextList = [].slice.call(wizardNumbered.querySelectorAll('.btn-next'));
            const wizardNumberedBtnPrevList = [].slice.call(wizardNumbered.querySelectorAll('.btn-prev'));
            const wizardNumberedForm = wizardNumbered.querySelector('#wizard-numbered-form');

            // Initialize bs-stepper
            const numberedStepper = new Stepper(wizardNumbered, {
                linear: false // Set to true if step verification sequence must be strictly tracked
            });

            // Handlers to jump stages
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
@endsection
