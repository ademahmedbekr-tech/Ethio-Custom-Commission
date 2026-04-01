@extends('layouts.app')

@section('title', 'የሠራተኛ የግል ሁኔታ መግለጫ')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!-- Print Controls (hidden when printing) -->
            <div class="print-hide text-end mb-3 no-print">
                <button onclick="window.print()" class="btn btn-primary">
                    <i class="bx bx-printer"></i> ካርድ አትም / Print Card
                </button>
                <a href="{{ route('employees.index') }}" class="btn btn-secondary">
                    <i class="bx bx-arrow-back"></i> ተመለስ / Back
                </a>
            </div>

            <!-- Employee Profile Card - Printable -->
            <div class="card" id="printable-card">
                <div class="card-body" style="font-family: 'Nyala', 'Abyssinica SIL', 'Ethiopic', sans-serif; direction: ltr; text-align: left;">

                    <!-- Header -->
                    <div class="text-center mb-4">
                        <h3 class="fw-bold">የጉምሩክ ኮሚሽን</h3>
                        <h4 class="fw-bold text-decoration-underline">የሠራተኛ የግል ሁኔታ መግለጫ</h4>
                    </div>

                    <!-- Personal Information Grid -->
                    <table class="table table-bordered">
                        <tr>
                            <td style="width: 50%;">
                                <strong>ስም ከነ አያት:-</strong>
                                <span class="ms-2">{{ $employee->employee_name ?? '_________________' }}</span>
                            </td>
                            <td style="width: 50%;">
                                <strong>የሰለጠኑበት ሙያ:-</strong>
                                <span class="ms-2">{{ $employee->job_title ?? '_________________' }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የልደት ዘመን:-</strong>
                                <span class="ms-2">{{ $employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : '_________________' }}</span>
                            </td>
                            <td>
                                <strong>የሥራ መደብ / የሥራ ድርሻ:-</strong>
                                <span class="ms-2">{{ $employee->current_job_title ?? $employee->job_title ?? '_________________' }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የቅጥር ዘመን:-</strong>
                                <span class="ms-2">{{ $employee->hire_date ? $employee->hire_date->format('d/m/Y') : '_________________' }}</span>
                            </td>
                            <td>
                                <strong>የአገልግሎት ደረጃ:-</strong>
                                <span class="ms-2">{{ $employee->job_level ?? '_________________' }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የትምህርት ደረጃ:-</strong>
                                <span class="ms-2">{{ $employee->education_level ?? '_________________' }}</span>
                            </td>
                            <td>
                                <strong>የጡረታ መለያ ቁጥር:-</strong>
                                <span class="ms-2">{{ $employee->pension_id ?? '_________________' }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የትምህርት አይነት:-</strong>
                                <span class="ms-2">{{ $employee->education_type ?? '_________________' }}</span>
                            </td>
                            <td>
                                <strong>ደመወዝ:-</strong>
                                <span class="ms-2">{{ $employee->salary ? number_format($employee->salary, 2) : '___________' }} /ብር/</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የተመረቁበት ቀን:-</strong>
                                <span class="ms-2">{{ $employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : '_________________' }}</span>
                            </td>
                            <td>
                                <strong>አማካይ BSC ምዘና ውጤት:-</strong>
                                <span class="ms-2">{{ $employee->cgpa ?? '_________________' }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>የፋይል ቁጥር:-</strong>
                                <span class="ms-2">{{ $employee->file_number ?? '_________________' }}</span>
                            </td>
                            <td>
                                <strong>የማህደር ጥራት ሁኔታ:-</strong>
                                <span class="ms-2">{{ $employee->higher_ed_verified ? 'የተረጋገጠ' : '___________' }}</span>
                            </td>
                        </tr>
                    </table>

                    <!-- Responsibilities and Service Section -->
                    <div class="mt-4">
                        <h5 class="fw-bold text-center">ኃላፊነቶችና ጠቅላላ አገልግሎት</h5>

                        <table class="table table-bordered">
                            <thead class="table-secondary">
                                <tr>
                                    <th>ከ</th>
                                    <th>እስከ</th>
                                    <th>ዓመት</th>
                                    <th>ወር</th>
                                    <th>ቀን</th>
                                    <th>የሥራ ኃላፊነት</th>
                                    <th>የሚሠሩበት የሥራ ክፍል</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Current Experience Row -->
                                <tr>
                                    <td>{{ $employee->experience_from ? $employee->experience_from->format('d/m/Y') : '__________' }}</td>
                                    <td>{{ $employee->experience_to ? $employee->experience_to->format('d/m/Y') : 'እስካሁን' }}</td>
                                    <td>{{ $employee->experience_from ? $employee->experience_from->diffInYears($employee->experience_to ?? now()) : '__' }}</td>
                                    <td>{{ $employee->experience_from ? $employee->experience_from->diffInMonths($employee->experience_to ?? now()) % 12 : '__' }}</td>
                                    <td>__</td>
                                    <td>{{ $employee->current_job_title ?? '____________________' }}</td>
                                    <td>{{ $employee->current_institution ?? 'የጉምሩክ ኮሚሽን' }}</td>
                                </tr>

                                <!-- Previous Experience Row -->
                                <tr>
                                    <td>{{ $employee->previous_from ? $employee->previous_from->format('d/m/Y') : '__________' }}</td>
                                    <td>{{ $employee->previous_to ? $employee->previous_to->format('d/m/Y') : '__________' }}</td>
                                    <td>{{ $employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInYears($employee->previous_to) : '__' }}</td>
                                    <td>{{ $employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInMonths($employee->previous_to) % 12 : '__' }}</td>
                                    <td>__</td>
                                    <td>{{ $employee->previous_job_title ?? '____________________' }}</td>
                                    <td>{{ $employee->previous_institution ?? '____________________' }}</td>
                                </tr>

                                <!-- Empty rows for additional entries -->
                                <tr>
                                    <td>__________</td>
                                    <td>__________</td>
                                    <td>__</td>
                                    <td>__</td>
                                    <td>__</td>
                                    <td>____________________</td>
                                    <td>____________________</td>
                                </tr>

                                <!-- Total Row -->
                                <tr class="fw-bold">
                                    <td colspan="2" class="text-end">ድምር</td>
                                    <td>{{ $employee->experience_from ? $employee->experience_from->diffInYears($employee->experience_to ?? now()) + ($employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInYears($employee->previous_to) : 0) : '__' }}</td>
                                    <td>{{ $employee->experience_from ? $employee->experience_from->diffInMonths($employee->experience_to ?? now()) % 12 : '__' }}</td>
                                    <td>__</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Signature Section -->
                    <div class="row mt-5">
                        <div class="col-6">
                            <table class="table table-borderless">
                                <tr>
                                    <td><strong>ያዘጋጀው:-</strong> __________________</td>
                                </tr>
                                <tr>
                                    <td><strong>ሙሉ ስም:-</strong> __________________</td>
                                </tr>
                                <tr>
                                    <td><strong>ፈርማ:-</strong> __________________</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-6">
                            <table class="table table-borderless">
                                <tr>
                                    <td><strong>ያረጋገጠው:-</strong> __________________</td>
                                </tr>
                                <tr>
                                    <td><strong>ሙሉ ስም:-</strong> __________________</td>
                                </tr>
                                <tr>
                                    <td><strong>ፈርማ:-</strong> __________________</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Employee Signature -->
                    <div class="row mt-3">
                        <div class="col-12">
                            <table class="table table-borderless">
                                <tr>
                                    <td><strong>የሠራተኛው ፈርማ:-</strong> _________________________</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Footer with date -->
                    <div class="text-center mt-3">
                        <small>ቀን:- {{ now()->format('d/m/Y') }}</small>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<style>
/* Print-specific styles */
@media print {
    body {
        background-color: white;
        font-size: 12pt;
    }

    .no-print, .print-hide, .btn, .card-header {
        display: none !important;
    }

    .card {
        border: none !important;
        box-shadow: none !important;
    }

    .table-bordered {
        border: 1px solid #000 !important;
    }

    .table-bordered td, .table-bordered th {
        border: 1px solid #000 !important;
        padding: 8px;
    }

    #printable-card {
        margin: 0;
        padding: 0;
    }

    .fw-bold {
        font-weight: bold !important;
    }
}

/* Screen styles */
.table-bordered td {
    padding: 10px;
    vertical-align: middle;
}

.table-secondary {
    background-color: #f0f0f0;
}

.fw-bold {
    font-weight: 600;
}

/* Amharic font support */
[lang="am"], .amharic {
    font-family: 'Nyala', 'Abyssinica SIL', 'Ethiopic', 'Noto Sans Ethiopic', sans-serif;
}
</style>
@endsection
