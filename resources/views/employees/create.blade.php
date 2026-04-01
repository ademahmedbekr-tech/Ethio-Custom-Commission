@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header bg-primary text-white">
                    <i class="bx bx-user-plus"></i> አዲስ ሠራተኛ መዝግብ / Add New Employee
                </h5>
                <div class="card-body">
                    <form action="{{ route('employees.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <!-- Personal Information Section -->
                        <h6 class="text-primary mb-3">📋 የግል መረጃ / Personal Information</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="employee_name" class="form-label">ሙሉ ስም / Full Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control @error('employee_name') is-invalid @enderror"
                                           id="employee_name" name="employee_name" value="{{ old('employee_name') }}"
                                           placeholder="ሙሉ ስም ያስገቡ" required>
                                    @error('employee_name')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="file_number" class="form-label">የፋይል ቁጥር / File Number</label>
                                    <input type="text" class="form-control @error('file_number') is-invalid @enderror"
                                           id="file_number" name="file_number" value="{{ old('file_number') }}"
                                           placeholder="ራስ-ሰር ይመነጫል / Auto-generated">
                                    @error('file_number')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="gender" class="form-label">ፆታ / Gender</label>
                                    <select class="form-select @error('gender') is-invalid @enderror" id="gender" name="gender">
                                        <option value="">ፆታ ይምረጡ / Select Gender</option>
                                        <option value="ወ" {{ old('gender') == 'ወ' ? 'selected' : '' }}>ወንድ / Male</option>
                                        <option value="ሴ" {{ old('gender') == 'ሴ' ? 'selected' : '' }}>ሴት / Female</option>
                                        <option value="Other" {{ old('gender') == 'Other' ? 'selected' : '' }}>ሌላ / Other</option>
                                    </select>
                                    @error('gender')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="date_of_birth" class="form-label">የልደት ቀን / Date of Birth</label>
                                    <input type="date" class="form-control @error('date_of_birth') is-invalid @enderror"
                                           id="date_of_birth" name="date_of_birth" value="{{ old('date_of_birth') }}">
                                    @error('date_of_birth')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="marital_status" class="form-label">የትዳር ሁኔታ / Marital Status</label>
                                    <select class="form-select @error('marital_status') is-invalid @enderror" id="marital_status" name="marital_status">
                                        <option value="">ሁኔታ ይምረጡ</option>
                                        <option value="Single" {{ old('marital_status') == 'Single' ? 'selected' : '' }}>ነጠላ / Single</option>
                                        <option value="Married" {{ old('marital_status') == 'Married' ? 'selected' : '' }}>ያገቡ / Married</option>
                                        <option value="Divorced" {{ old('marital_status') == 'Divorced' ? 'selected' : '' }}>የተፋቱ / Divorced</option>
                                        <option value="Widowed" {{ old('marital_status') == 'Widowed' ? 'selected' : '' }}>ባል/ሚስት የሞቱ / Widowed</option>
                                    </select>
                                    @error('marital_status')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
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
                                    @error('ethnicity')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="religion" class="form-label">ሃይማኖት / Religion</label>
                                    <select class="form-select @error('religion') is-invalid @enderror" id="religion" name="religion">
                                        <option value="">ሃይማኖት ይምረጡ</option>
                                        <option value="Christian" {{ old('religion') == 'Christian' ? 'selected' : '' }}>ክርስቲያን / Christian</option>
                                        <option value="Muslim" {{ old('religion') == 'Muslim' ? 'selected' : '' }}>ሙስሊም / Muslim</option>
                                        <option value="Other" {{ old('religion') == 'Other' ? 'selected' : '' }}>ሌላ / Other</option>
                                    </select>
                                    @error('religion')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <!-- Contact Information Section -->
                        <h6 class="text-primary mt-4 mb-3">📞 መገኛ / Contact Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
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
                                    @error('region')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="zone" class="form-label">ዞን / Zone</label>
                                    <input type="text" class="form-control" id="zone" name="zone" value="{{ old('zone') }}" placeholder="ዞን / Zone">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="district" class="form-label">ወረዳ / District</label>
                                    <input type="text" class="form-control" id="district" name="district" value="{{ old('district') }}" placeholder="ወረዳ / District">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="specific_location" class="form-label">ልዩ አድራሻ / Specific Location</label>
                                    <input type="text" class="form-control" id="specific_location" name="specific_location" value="{{ old('specific_location') }}" placeholder="ከተማ / ቀበሌ">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="house_number" class="form-label">ቤት ቁጥር / House Number</label>
                                    <input type="text" class="form-control" id="house_number" name="house_number" value="{{ old('house_number') }}" placeholder="ቤት ቁጥር">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="phone_number" class="form-label">ስልክ ቁጥር / Phone Number</label>
                                    <input type="text" class="form-control @error('phone_number') is-invalid @enderror"
                                           id="phone_number" name="phone_number" value="{{ old('phone_number') }}"
                                           placeholder="+251911223344">
                                    @error('phone_number')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email" class="form-label">ኢሜይል / Email</label>
                                    <input type="email" class="form-control @error('email') is-invalid @enderror"
                                           id="email" name="email" value="{{ old('email') }}"
                                           placeholder="name@example.com">
                                    @error('email')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <!-- Job Information Section -->
                        <h6 class="text-primary mt-4 mb-3">💼 የሥራ መረጃ / Job Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="job_title" class="form-label">የሥራ መደብ / Job Title</label>
                                    <input type="text" class="form-control" id="job_title" name="job_title" value="{{ old('job_title') }}" placeholder="ለምሳሌ: ኢንስፔክተር">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="job_level" class="form-label">የአገልግሎት ደረጃ / Job Level</label>
                                    <select class="form-select" id="job_level" name="job_level">
                                        <option value="">ደረጃ ይምረጡ</option>
                                        <option value="I" {{ old('job_level') == 'I' ? 'selected' : '' }}>I</option>
                                        <option value="II" {{ old('job_level') == 'II' ? 'selected' : '' }}>II</option>
                                        <option value="III" {{ old('job_level') == 'III' ? 'selected' : '' }}>III</option>
                                        <option value="IV" {{ old('job_level') == 'IV' ? 'selected' : '' }}>IV</option>
                                        <option value="V" {{ old('job_level') == 'V' ? 'selected' : '' }}>V</option>
                                        <option value="VI" {{ old('job_level') == 'VI' ? 'selected' : '' }}>VI</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="step" class="form-label">ደረጃ / Step</label>
                                    <input type="number" class="form-control" id="step" name="step" value="{{ old('step') }}" min="1" max="20" placeholder="1-20">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="hire_date" class="form-label">የቅጥር ቀን / Hire Date</label>
                                    <input type="date" class="form-control" id="hire_date" name="hire_date" value="{{ old('hire_date') }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="assignment_date" class="form-label">የምደባ ቀን / Assignment Date</label>
                                    <input type="date" class="form-control" id="assignment_date" name="assignment_date" value="{{ old('assignment_date') }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pension_id" class="form-label">የጡረታ መለያ ቁጥር / Pension ID</label>
                                    <input type="text" class="form-control" id="pension_id" name="pension_id" value="{{ old('pension_id') }}" placeholder="ፔንሽን ቁጥር">
                                </div>
                            </div>
                        </div>

                        <!-- Salary Information -->
                        <h6 class="text-primary mt-4 mb-3">💰 የደመወዝ መረጃ / Salary Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="salary" class="form-label">መሠረታዊ ደመወዝ / Basic Salary</label>
                                    <input type="number" step="0.01" class="form-control" id="salary" name="salary" value="{{ old('salary') }}" placeholder="0.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="allowance" class="form-label">አበል / Allowance</label>
                                    <input type="number" step="0.01" class="form-control" id="allowance" name="allowance" value="{{ old('allowance') }}" placeholder="0.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="housing_allowance" class="form-label">የቤት ኪራይ / Housing Allowance</label>
                                    <input type="number" step="0.01" class="form-control" id="housing_allowance" name="housing_allowance" value="{{ old('housing_allowance') }}" placeholder="0.00">
                                </div>
                            </div>
                        </div>

                        <!-- Education Section -->
                        <h6 class="text-primary mt-4 mb-3">🎓 የትምህርት መረጃ / Education Information</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
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
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="education_type" class="form-label">የትምህርት አይነት / Education Type</label>
                                    <input type="text" class="form-control" id="education_type" name="education_type" value="{{ old('education_type') }}" placeholder="ለምሳሌ: የሙያ ትምህርት">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="institution" class="form-label">ተቋም / Institution</label>
                                    <input type="text" class="form-control" id="institution" name="institution" value="{{ old('institution') }}" placeholder="የትምህርት ተቋም">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="graduation_date" class="form-label">የተመረቁበት ቀን / Graduation Date</label>
                                    <input type="date" class="form-control" id="graduation_date" name="graduation_date" value="{{ old('graduation_date') }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="cgpa" class="form-label">አማካይ ውጤት / CGPA</label>
                                    <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="{{ old('cgpa') }}" placeholder="0.00" max="4.00">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label d-block">ማረጋገጫ / Certifications</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="coc_certificate" name="coc_certificate" value="1" {{ old('coc_certificate') ? 'checked' : '' }}>
                                        <label class="form-check-label" for="coc_certificate">COC የምስክር ወረቀት / COC Certificate</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="higher_ed_verified" name="higher_ed_verified" value="1" {{ old('higher_ed_verified') ? 'checked' : '' }}>
                                        <label class="form-check-label" for="higher_ed_verified">ከፍተኛ ትምህርት የተረጋገጠ / Higher Ed Verified</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Work Experience -->
                        <h6 class="text-primary mt-4 mb-3">⏳ የሥራ ልምድ / Work Experience</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <strong>የአሁኑ የሥራ / Current Job</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="current_job_title" class="form-label">የሥራ ኃላፊነት / Job Title</label>
                                            <input type="text" class="form-control" id="current_job_title" name="current_job_title" value="{{ old('current_job_title') }}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="current_institution" class="form-label">ተቋም / Institution</label>
                                            <input type="text" class="form-control" id="current_institution" name="current_institution" value="{{ old('current_institution') }}">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="experience_from" class="form-label">ከ / From</label>
                                                <input type="date" class="form-control" id="experience_from" name="experience_from" value="{{ old('experience_from') }}">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="experience_to" class="form-label">እስከ / To</label>
                                                <input type="date" class="form-control" id="experience_to" name="experience_to" value="{{ old('experience_to') }}">
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
                                            <input type="text" class="form-control" id="previous_job_title" name="previous_job_title" value="{{ old('previous_job_title') }}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="previous_institution" class="form-label">ተቋም / Institution</label>
                                            <input type="text" class="form-control" id="previous_institution" name="previous_institution" value="{{ old('previous_institution') }}">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="previous_from" class="form-label">ከ / From</label>
                                                <input type="date" class="form-control" id="previous_from" name="previous_from" value="{{ old('previous_from') }}">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="previous_to" class="form-label">እስከ / To</label>
                                                <input type="date" class="form-control" id="previous_to" name="previous_to" value="{{ old('previous_to') }}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Additional Information -->
                        <h6 class="text-primary mt-4 mb-3">📎 ተጨማሪ / Additional</h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="disability_type" class="form-label">የአካል ጉዳት / Disability Type</label>
                                    <select class="form-select" id="disability_type" name="disability_type">
                                        <option value="">አይነት ይምረጡ</option>
                                        <option value="None" {{ old('disability_type') == 'None' ? 'selected' : '' }}>የለም / None</option>
                                        <option value="Physical" {{ old('disability_type') == 'Physical' ? 'selected' : '' }}>አካላዊ / Physical</option>
                                        <option value="Visual" {{ old('disability_type') == 'Visual' ? 'selected' : '' }}>የማየት / Visual</option>
                                        <option value="Hearing" {{ old('disability_type') == 'Hearing' ? 'selected' : '' }}>የመስማት / Hearing</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label for="diagnosis" class="form-label">ምርመራ / Diagnosis</label>
                                    <textarea class="form-control" id="diagnosis" name="diagnosis" rows="2">{{ old('diagnosis') }}</textarea>
                                </div>
                            </div>
                        </div>

                        <!-- File Uploads -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="photo" class="form-label">ፎቶ / Photo</label>
                                    <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
                                    <small class="text-muted">ፎቶ ከሆነ (JPG, PNG, max 2MB)</small>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="document" class="form-label">ሰነድ / Document</label>
                                    <input type="file" class="form-control" id="document" name="document" accept=".pdf,.doc,.docx">
                                    <small class="text-muted">ሰነድ ከሆነ (PDF, DOC, max 5MB)</small>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Buttons -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bx bx-save"></i> መዝግብ / Save Employee
                                </button>
                                <a href="{{ route('employees.index') }}" class="btn btn-secondary">
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
@endsection
