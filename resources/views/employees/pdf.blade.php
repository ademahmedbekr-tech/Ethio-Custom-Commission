<!DOCTYPE html>
<html lang="am">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>የሠራተኛ የግል ሁኔታ መግለጫ</title>
    <style>
    @font-face {
        font-family: 'Abyssinica SIL';
        font-style: normal;
        font-weight: normal;
        src: url("{{ storage_path('fonts/AbyssinicaSIL-Regular.ttf') }}") format('truetype');
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Abyssinica SIL', 'Nyala', 'Ethiopic', 'DejaVu Sans', sans-serif;
        direction: ltr;
        font-size: 11px;
        line-height: 1.3;
        margin: 8px 12px;
        background: #fffcf0;
        color: #2c3e50;
    }

    .container {
        background: rgba(255, 255, 255, 0.95);
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .header {
        text-align: center;
        margin-bottom: 12px;
        padding-bottom: 6px;
        border-bottom: 2px solid #c4a27a;
    }

    .header h1 {
        font-size: 16px;
        font-weight: bold;
        margin: 0;
        color: #2c1810;
        letter-spacing: 0.5px;
    }

    .header h2 {
        font-size: 14px;
        font-weight: bold;
        margin: 3px 0;
        color: #4a3525;
        border-bottom: 1px dotted #c4a27a;
        display: inline-block;
        padding-bottom: 2px;
    }

    .form-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 10px;
    }

    .form-table td {
        padding: 5px 6px;
        border: 1px solid #d4c9b7;
        vertical-align: middle;
    }

    .form-table td:first-child {
        width: 35%;
        background-color: #faf5eb;
        font-weight: bold;
    }

    .form-table td:last-child {
        width: 65%;
        background-color: white;
    }

    .label {
        font-weight: bold;
        color: #5c3e2d;
        font-size: 11px;
    }

    .value {
        border-bottom: 1px dotted #8b6b4d;
        padding: 2px 5px;
        min-height: 22px;
        display: inline-block;
    }

    .value:empty::before {
        content: '_______________';
        color: #c4a27a;
        opacity: 0.5;
    }

    .experience-section {
        margin: 10px 0 8px;
        padding: 8px;
        border: 1px solid #e8ddcc;
        border-radius: 6px;
        background: white;
        overflow-x: auto;
    }

    .experience-section h3 {
        font-size: 13px;
        font-weight: bold;
        text-align: center;
        margin: -14px auto 8px;
        width: fit-content;
        padding: 0 10px;
        background: #fffcf0;
        color: #2c1810;
        display: inline-block;
        left: 50%;
        position: relative;
        transform: translateX(-50%);
    }

    .experience-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 10px;
        text-align: center;
        min-width: 900px;
    }

    /* Common header styling */
    .experience-table th.common-header {
        background-color: #5c3e2d;
        color: white;
        font-size: 11px;
        padding: 6px 4px;
        text-align: center;
        border: 1px solid #4a3022;
        font-weight: bold;
    }

    /* Regular column headers */
    .experience-table th.col-header {
        background-color: #8b6b4d;
        color: white;
        font-weight: bold;
        font-size: 10px;
        padding: 5px 2px;
        text-align: center;
        border: 1px solid #b8a990;
    }

    /* Sub-header for split columns */
    .experience-table th.sub-header {
        background-color: #a07d5a;
        color: white;
        font-weight: bold;
        font-size: 9px;
        padding: 4px 2px;
        text-align: center;
        border: 1px solid #b8a990;
    }

    .experience-table td {
        border: 1px solid #b8a990;
        padding: 4px 2px;
        text-align: center;
        background-color: white;
        vertical-align: middle;
    }

    .experience-table tr:hover td {
        background-color: #faf5eb;
    }

    .total-row td {
        background-color: #f0e6d8 !important;
        font-weight: bold;
        border-top: 2px solid #8b6b4d;
    }

    .signature-section {
        margin-top: 12px;
        padding: 8px;
        border-top: 2px dashed #c4a27a;
    }

    .signature-table {
        width: 100%;
        border-collapse: collapse;
    }

    .signature-table td {
        padding: 6px 8px;
        vertical-align: bottom;
    }

    .signature-line {
        margin-top: 5px;
        border-top: 1px solid #8b6b4d;
        width: 160px;
        height: 12px;
    }

    .employee-signature {
        margin-top: 8px;
        text-align: center;
        padding-top: 8px;
        border-top: 1px dashed #c4a27a;
    }

    .employee-signature .line {
        border-top: 1px solid #8b6b4d;
        width: 200px;
        margin: 0 auto 5px;
    }

    .dots {
        letter-spacing: 2px;
        font-size: 12px;
        color: #8b6b4d;
    }

    .logo {
        margin-bottom: 10px;
    }

    .logo img {
        max-height: 120px;
        width: 120px;
        border-radius: 50%;
    }

    @media print {
        body {
            background: white;
            margin: 5px;
        }
        .container {
            box-shadow: none;
            padding: 5px;
        }
        .experience-section {
            overflow-x: visible;
        }
    }

    .footer-note {
        text-align: center;
        margin-top: 6px;
        font-size: 8px;
        color: #8b6b4d;
    }
</style>
</head>

<body>
    <!-- Header -->
    <div class="header" style="text-align: center;">
        <div class="logo">
            <img src="{{ public_path('Photo/p.png') }}" alt="የጉምሩክ ኮሚሽን ሎጎ" style="max-height: 120px; width: 120px; border-radius: 50%;">
        </div>
        <h1>የጉምሩክ ኮሚሽን</h1>
        <h2>የሠራተኛ የግል ሁኔታ መግለጫ</h2>
    </div>

    <!-- Main Form -->
    <table class="form-table">
        <tr>
            <td><span class="label">ስም ከነ አያት፡-</span></td>
            <td><span class="value">{{ $employee->employee_name ?? '_________________' }}</span></td>
            <td><span class="label">የሰለጠኑበት ሙያ፡-</span></td>
            <td><span class="value">{{ $employee->job_title ?? '_________________' }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የልደት ዘመን፡-</span></td>
            <td><span class="value">{{ $employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : '_________________' }}</span></td>
            <td><span class="label">የሥራ መደብ / የሥራ ድርሻ፡-</span></td>
            <td><span class="value">{{ $employee->current_job_title ?? ($employee->job_title ?? '_________________') }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የቅጥር ዘመን:-</span></td>
            <td><span class="value">{{ $employee->hire_date ? $employee->hire_date->format('d/m/Y') : '_________________' }}</span></td>
            <td><span class="label">የአገልግሎት ደረጃ፡-</span></td>
            <td><span class="value">{{ $employee->job_level ?? '_________________' }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የትምህርት ደረጃ፡-</span></td>
            <td><span class="value">{{ $employee->education_level ?? '_________________' }}</span></td>
            <td><span class="label">የጡረታ መለያ ቁጥር፡-</span></td>
            <td><span class="value">{{ $employee->pension_id ?? '_________________' }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የትምህርት አይነት:-</span></td>
            <td><span class="value">{{ $employee->education_type ?? '_________________' }}</span></td>
            <td><span class="label">ደመወዝ፡-</span></td>
            <td><span class="value">{{ $employee->salary ? number_format($employee->salary, 2) : '___________' }}/{{ $employee->allowance ? number_format($employee->allowance, 2) : '___________' }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የተመረቁበት ቀን፡-</span></td>
            <td><span class="value">{{ $employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : '_________________' }}</span></td>
            <td><span class="label">አማካይ BSC ምዘና ውጤት ፡-</span></td>
            <td><span class="value">{{ $employee->cgpa ?? '_________________' }}</span></td>
        </tr>
        <tr>
            <td><span class="label">የፋይል ቁጥር፡-</span></td>
            <td><span class="value">{{ $employee->file_number ?? '_________________' }}</span></td>
            <td><span class="label">የማህደር ጥራት ሁኔታ:-</span></td>
            <td><span class="value">{{ $employee->higher_ed_verified ? 'የተረጋገጠ' : '_______________' }}</span></td>
        </tr>
    </table>

    <!-- Experience Section with New Structure -->
    <div class="experience-section">
        <h3>ኃላፊነቶችና ጠቅላላ አገልግሎት</h3>

        @php
            $totalYears = 0;
            $totalMonths = 0;
            $totalDays = 0;
        @endphp

        <table class="experience-table">
            <thead>
                <!-- Common Headers Row -->
                <tr>
                    <th class="common-header" colspan="2">የቀጣሪ ዘመን</th>
                    <th class="common-header" colspan="3">ጠቅላላ የስራ ዘመን</th>
                    <th class="common-header" rowspan="2">የስራ መጠሪያ</th>
                    <th class="common-header" colspan="2">ያገለገሉበት ተቋም</th>
                </tr>

                <!-- Column Headers Row -->
                <tr>
                    <!-- Under "የቀጣሪ ዘመን" -->
                    <th class="col-header">ከወር/ዓመት</th>
                    <th class="col-header">እስከ ወር/ዓመት</th>

                    <!-- Under "ጠቅላላ የስራ ዘመን" -->
                    <th class="col-header">ዓመት</th>
                    <th class="col-header">ወር</th>
                    <th class="col-header">ቀን</th>

                    <!-- "የስራ መጠሪያ" column header already above -->

                    <!-- Under "ያገለገሉበት ተቋም" -->
                    <th class="sub-header">የአሁን ተቋም</th>
                    <th class="sub-header">የቀድሞ ተቋም</th>
                </tr>
            </thead>
            <tbody>
                @forelse($employee->experiences ?? [] as $exp)
                @php
                    $start = $exp->from_date ? \Carbon\Carbon::parse($exp->from_date) : null;
                    $end = $exp->to_date ? \Carbon\Carbon::parse($exp->to_date) : ($exp->experience_type == 'current' ? \Carbon\Carbon::now() : null);
                    $years = 0;
                    $months = 0;
                    $days = 0;
                    if($start && $end) {
                        $diff = $start->diff($end);
                        $years = $diff->y;
                        $months = $diff->m;
                        $days = $diff->d;
                        $totalYears += $years;
                        $totalMonths += $months;
                        $totalDays += $days;
                    }

                    // Determine if current or previous institution
                    $currentInstitution = ($exp->in_outside == 'inside') ? ($exp->institution ?? '') : '';
                    $previousInstitution = ($exp->in_outside != 'inside') ? ($exp->institution ?? '') : '';
                @endphp
                <tr>
                    <td>{{ $exp->from_date ? \Carbon\Carbon::parse($exp->from_date)->format('d/m/Y') : '__________' }}</td>
                    <td>
                        @if($exp->to_date)
                            {{ \Carbon\Carbon::parse($exp->to_date)->format('d/m/Y') }}
                        @elseif($exp->experience_type == 'current')
                            እስከ አሁን
                        @else
                            __________
                        @endif
                    </td>
                    <td>{{ $years }}</td>
                    <td>{{ $months }}</td>
                    <td>{{ $days }}</td>
                    <td>{{ $exp->job_title ?? '____________________' }}</td>
                    <td>{{ $currentInstitution ?: '__________' }}</td>
                    <td>{{ $previousInstitution ?: '__________' }}</td>
                </tr>
                @empty
                <!-- Sample empty row -->
                <tr>
                    <td>__________</td>
                    <td>__________</td>
                    <td>__</td>
                    <td>__</td>
                    <td>__</td>
                    <td>____________________</td>
                    <td>__________</td>
                    <td>__________</td>
                </tr>
                @endforelse

                @php
                    // Normalize days to months
                    if($totalDays >= 30) {
                        $totalMonths += floor($totalDays / 30);
                        $totalDays = $totalDays % 30;
                    }
                    // Normalize months to years
                    if($totalMonths >= 12) {
                        $totalYears += floor($totalMonths / 12);
                        $totalMonths = $totalMonths % 12;
                    }
                @endphp

                <tr class="total-row">
                    <td colspan="2" style="text-align: right; font-weight: bold;">ድምር</td>
                    <td style="font-weight: bold;">{{ $totalYears }}</td>
                    <td style="font-weight: bold;">{{ $totalMonths }}</td>
                    <td style="font-weight: bold;">{{ $totalDays }}</td>
                    <td colspan="3"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Signature Section -->
    <table class="signature-table">
        <tr>
            <td style="width: 33%;">
                <div>ያዘጋጀው _______________</div>
                <div style="margin-top: 8px;">ፈርማ _______________</div>
            </td>
            <td style="width: 33%;">
                <div>ያረጋገጠው _______________</div>
                <div style="margin-top: 8px;">ፈርማ _______________</div>
            </td>
            <td style="width: 34%;">
                <div>ቀን _______________</div>
                <div style="margin-top: 8px;">ማህተም _______________</div>
            </td>
        </tr>
    </table>

    <!-- Employee Signature -->
    <div class="employee-signature">
        <div>የሠራተኛው ስምና ፈርማ _______________</div>
    </div>

</body>

</html>
