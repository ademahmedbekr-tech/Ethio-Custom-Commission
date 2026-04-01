<!DOCTYPE html>
<html lang="am">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>የሠራተኛ የግል ሁኔታ መግለጫ</title>
    <style>

 @font-face {
        font-family: 'Abyssinica SIL';
        font-style: normal;
        font-weight: normal;
        src: url("<?php echo e(storage_path('fonts/AbyssinicaSIL-Regular.ttf')); ?>") format('truetype');
    }

        body {
            font-family: 'Abyssinica SIL', 'Nyala', 'Ethiopic', 'DejaVu Sans', sans-serif;
            direction: ltr;
            font-size: 14px;
            line-height: 1.6;
            margin: 20px;
            background: #f9f6e7;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 22px;
            font-weight: bold;
            margin: 0;
        }
        .header h2 {
            font-size: 20px;
            font-weight: bold;
            margin: 5px 0;
            text-decoration: underline;
        }
        .form-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .form-table td {
            padding: 10px;
            border: 1px solid #ebe9e9;
            vertical-align: top;
        }
        .form-table td:first-child {
            width: 50%;
        }
        .form-table td:last-child {
            width: 50%;
        }
        .label {
            font-weight: bold;
        }
        .value {
            border-bottom: 1px dotted #333;
            padding: 0 5px;
        }
        .experience-section {
            margin: 10px 0;
        }
        .experience-section h3 {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
        .experience-table {
            width: 100%;
            border-collapse: collapse;
        }
        .experience-table th, .experience-table td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        .experience-table th {
            background-color: #f0f0f0;
            font-weight: bold;
        }
        .total-row td {
            background-color: #f0f0f0;
            font-weight: bold;
        }
        .signature-section {
            margin-top: 20px;
            width: 100%;
        }
        .signature-table {
            margin-top: 10px;
            width: 100%;
            border-collapse: collapse;
        }
        .signature-table td {
            padding: 10px;
            vertical-align: top;
        }
        .signature-line {
            margin-top: 20px;
            border-top: 1px solid #000;
            width: 80%;
        }
        .employee-signature {
            margin-top: 10px;
            text-align: center;
        }
        .employee-signature .line {
            border-top: 1px solid #000;
            width: 50%;
            margin: 0 auto 10px;
        }
        .dots {
            letter-spacing: 2px;
            font-size: 16px;
        }
        im
    </style>
</head>
<body>
    <!-- Header -->
  <div class="header" style="text-align: center; padding: 20px;">
    <!-- Logo Centered -->
    <div class="logo" style="margin-bottom: 15px;">

        <img src="<?php echo e(public_path('Photo/Picture1.jpg')); ?>"
             alt="የጉምሩክ ኮሚሽን ሎጎ"
             style="max-height: 170px; width: 170px; border-radius: 50%;">
    </div>

    <!-- Text Below Logo -->
    <h1 style="margin: 0; color: #003366;">የጉምሩክ ኮሚሽን</h1>
    <h2 style="margin: 5px 0 0 0; color: #0066cc;">የሠራተኛ የግል ሁኔታ መግለጫ</h2>
</div>

    <!-- Main Form -->
    <table class="form-table">
        <tr>
            <td>
                <span class="label">ስም ከነ አያት፡-</span>
                <span class="value"><?php echo e($employee->employee_name ?? '_________________'); ?></span>
            </td>
            <td>
                <span class="label">የሰለጠኑበት ሙያ፡-</span>
                <span class="value"><?php echo e($employee->job_title ?? '_________________'); ?></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የልደት ዘመን፡-</span>
                <span class="value"><?php echo e($employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : '_________________'); ?></span>
            </td>
            <td>
                <span class="label">የሥራ መደብ / የሥራ ድርሻ፡-</span>
                <span class="value"><?php echo e($employee->current_job_title ?? $employee->job_title ?? '_________________'); ?></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የቅጥር ዘመን:-</span>
                <span class="value"><?php echo e($employee->hire_date ? $employee->hire_date->format('d/m/Y') : '_________________'); ?></span>
            </td>
            <td>
                <span class="label">የአገልግሎት ደረጃ፡-</span>
                <span class="value"><?php echo e($employee->job_level ?? '_________________'); ?></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የትምህርት ደረጃ፡-</span>
                <span class="value"><?php echo e($employee->education_level ?? '_________________'); ?></span>
            </td>
            <td>
                <span class="label">የጡረታ መለያ ቁጥር፡-</span>
                <span class="value"><?php echo e($employee->pension_id ?? '_________________'); ?></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የትምህርት አይነት:-</span>
                <span class="value"><?php echo e($employee->education_type ?? '_________________'); ?></span>
            </td>
            <td>
                <span class="label">ደመወዝ፡-</span>
                <span class="value"><?php echo e($employee->salary ? number_format($employee->salary, 2) : '___________'); ?>/<?php echo e($employee->allowance ? number_format($employee->allowance, 2) : '___________'); ?>/</span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የተመረቁበት ቀን፡-</span>
                <span class="value"><?php echo e($employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : '_________________'); ?></span>
            </td>
            <td>
                <span class="label">አማካይ BSC ምዘና ውጤት ፡-</span>
                <span class="value"><?php echo e($employee->cgpa ?? '_________________'); ?></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="label">የፋይል ቁጥር፡-</span>
                <span class="value"><?php echo e($employee->file_number ?? '_________________'); ?></span>
            </td>
            <td>
                <span class="label">የማህደር ጥራት ሁኔታ:-</span>
                <span class="value"><?php echo e($employee->higher_ed_verified ? 'የተረጋገጠ' : '_______________'); ?></span>
            </td>
        </tr>
    </table>

    <!-- Experience Section -->
    <div class="experience-section">
        <h3>ኃላፊነቶችና ጠቅላላ አገልግሎት</h3>

        <table class="experience-table">
            <thead>
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
                <!-- Current Experience -->
                <tr>
                    <td><?php echo e($employee->experience_from ? $employee->experience_from->format('d/m/Y') : '__________'); ?></td>
                    <td><?php echo e($employee->experience_to ? $employee->experience_to->format('d/m/Y') : '__________'); ?></td>
                    <td><?php echo e($employee->experience_from ? $employee->experience_from->diffInYears($employee->experience_to ?? now()) : '__'); ?></td>
                    <td><?php echo e($employee->experience_from ? $employee->experience_from->diffInMonths($employee->experience_to ?? now()) % 12 : '__'); ?></td>
                    <td>__</td>
                    <td><?php echo e($employee->current_job_title ?? '____________________'); ?></td>
                    <td><?php echo e($employee->current_institution ?? '____________________'); ?></td>
                </tr>

                <!-- Previous Experience -->
                <tr>
                    <td><?php echo e($employee->previous_from ? $employee->previous_from->format('d/m/Y') : '__________'); ?></td>
                    <td><?php echo e($employee->previous_to ? $employee->previous_to->format('d/m/Y') : '__________'); ?></td>
                    <td><?php echo e($employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInYears($employee->previous_to) : '__'); ?></td>
                    <td><?php echo e($employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInMonths($employee->previous_to) % 12 : '__'); ?></td>
                    <td>__</td>
                    <td><?php echo e($employee->previous_job_title ?? '____________________'); ?></td>
                    <td><?php echo e($employee->previous_institution ?? '____________________'); ?></td>
                </tr>

                <!-- Empty Row 1 -->
                <tr>
                    <td>__________</td>
                    <td>__________</td>
                    <td>__</td>
                    <td>__</td>
                    <td>__</td>
                    <td>____________________</td>
                    <td>____________________</td>
                </tr>

                <!-- Empty Row 2 -->
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
                <tr class="total-row">
                    <td colspan="2" style="text-align: right;">ድምር</td>
                    <td><?php echo e($employee->experience_from ? $employee->experience_from->diffInYears($employee->experience_to ?? now()) + ($employee->previous_from && $employee->previous_to ? $employee->previous_from->diffInYears($employee->previous_to) : 0) : '__'); ?></td>
                    <td><?php echo e($employee->experience_from ? $employee->experience_from->diffInMonths($employee->experience_to ?? now()) % 12 : '__'); ?></td>
                    <td>__</td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Signature Section -->
    <table class="signature-table align-items-right">
        <tr>
            <td style="width: 33%;">
                <div>ያዘጋጀው  _______________</div>
                
                <div style="margin-top: 10px;">ፈርማ _______________</div>
            </td>
            <td style="width: 33%;">
                <div>ያረጋገጠው _______________</div>
                
                <div style="margin-top: 10px;">ፈርማ _______________</div>
            </td>
            <td style="width: 34%;"></td>
        </tr>
    </table>

    <!-- Employee Signature -->
    <div class="employee-signature">

        <div>የሠራተኛው ስምና ፈርማ _______________</div>
    </div>

    <!-- Optional: Generated Date (hidden when printing) -->

</body>
</html>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ODA-Membership\ODA-Membership\resources\views/employees/pdf.blade.php ENDPATH**/ ?>