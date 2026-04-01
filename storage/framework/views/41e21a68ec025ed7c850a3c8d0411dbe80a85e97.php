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
        src: url("<?php echo e(storage_path('fonts/AbyssinicaSIL-Regular.ttf')); ?>") format('truetype');
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Abyssinica SIL', 'Nyala', 'Ethiopic', 'DejaVu Sans', sans-serif;
        direction: ltr;
        font-size: 12px;
        line-height: 1.3;
        margin: 10px 15px;
        background: #fffcf0;
        color: #2c3e50;
    }

    .container {
        background: rgba(255, 255, 255, 0.95);
        padding: 12px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .header {
        text-align: center;
        margin-bottom: 15px;
        padding-bottom: 8px;
        border-bottom: 2px solid #c4a27a;
    }

    .header h1 {
        font-size: 18px;
        font-weight: bold;
        margin: 0;
        color: #2c1810;
        letter-spacing: 0.5px;
    }

    .header h2 {
        font-size: 16px;
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
        margin-bottom: 12px;
    }

    .form-table td {
        padding: 6px 8px;
        vertical-align: middle;
    }

    .form-table td:first-child {
        width: 40%;
        background-color: #faf5eb;
        font-weight: bold;
    }

    .form-table td:last-child {
        width: 60%;
        background-color: white;
    }

    .label {
        font-weight: bold;
        color: #5c3e2d;
        font-size: 12px;
    }

    .value {
        border-bottom: 1px dotted #8b6b4d;
        padding: 3px 5px;
        min-height: 25px;
        display: flex;
        align-items: center;
    }

    .value:empty::before {
        content: '________';
        color: #c4a27a;
        opacity: 0.5;
    }

    .experience-section {
        margin: 15px 0 10px;
        padding: 10px;
        border: 0px solid #ffffff;
        border-radius: 6px;
    }

    .experience-section h3 {
        font-size: 15px;
        font-weight: bold;
        text-align: center;
        margin: -18px auto 10px;
        width: fit-content;
        padding: 0 10px;
        background: #fffcf0;
        color: #2c1810;
    }

    .experience-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 11px;
    }

    .experience-table th,
    .experience-table td {
        border: 1px solid #b8a990;
        padding: 4px 3px;
        text-align: center;
    }

    .experience-table th {
        background-color: #8b6b4d;
        color: white;
        font-weight: bold;
        font-size: 11px;
        padding: 5px 3px;
    }

    .experience-table td {
        background-color: white;
    }

    .total-row td {
        background-color: #f0e6d8 !important;
        font-weight: bold;
        border-top: 2px solid #8b6b4d;
    }

    .signature-section {
        margin-top: 15px;
        padding: 10px;
        border-top: 2px dashed #c4a27a;
    }

    .signature-table {
        width: 100%;
        border-collapse: collapse;
    }

    .signature-table td {
        padding: 8px 10px;
        vertical-align: bottom;
        width: 50%;
    }

    .signature-line {
        margin-top: 5px;
        border-top: 1px solid #8b6b4d;
        width: 180px;
        height: 15px;
    }

    .employee-signature {
        margin-top: 5px;
        text-align: center;
    }

    .employee-signature .line {
        border-top: 1px solid #8b6b4d;
        width: 180px;
        margin: 0 auto 5px;
    }

    .dots {
        letter-spacing: 2px;
        font-size: 14px;
        color: #8b6b4d;
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
    }

    .footer-note {
        text-align: center;
        margin-top: 8px;
        font-size: 9px;
        color: #8b6b4d;
    }
</style>
</head>

<body>
    <!-- Header -->
    <div class="header" style="text-align: center; padding: 20px;">
        <div class="logo" style="margin-bottom: 15px;">
            <img src="<?php echo e(public_path('Photo/p.png')); ?>" alt="የጉምሩክ ኮሚሽን ሎጎ"
                style="max-height: 170px; width: 170px; border-radius: 50%;">
        </div>
        <h1 style="margin: 0; color: #003366;">የጉምሩክ ኮሚሽን</h1>
        <h2 style="margin: 5px 0 0 0; color: #0066cc;">የሠራተኛ የግል ሁኔታ መግለጫ</h2>
    </div>

    <!-- Main Form -->
    <table class="form-table">
        <tr>
            <td><span class="label">ስም ከነ አያት፡-</span></td>
            <td><span class="value"><?php echo e($employee->employee_name ?? '_________________'); ?></span></td>
            <td><span class="label">የሰለጠኑበት ሙያ፡-</span></td>
            <td><span class="value"><?php echo e($employee->job_title ?? '_________________'); ?></span></td>
        </tr>
        <tr>
            <td><span class="label">የልደት ዘመን፡-</span></td>
            <td><span class="value"><?php echo e($employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : '_________________'); ?></span></td>
            <td><span class="label">የሥራ መደብ / የሥራ ድርሻ፡-</span></td>
            <td><span class="value"><?php echo e($employee->current_job_title ?? ($employee->job_title ?? '_________________')); ?></span></td>
        </tr>
        <tr>
            <td><span class="label">የቅጥር ዘመን:-</span></td>
            <td><span class="value"><?php echo e($employee->hire_date ? $employee->hire_date->format('d/m/Y') : '_________________'); ?></span></td>
            <td><span class="label">የአገልግሎት ደረጃ፡-</span></td>
            <td><span class="value"><?php echo e($employee->job_level ?? '_________________'); ?></span></td>
        </tr>
        <tr>
            <td><span class="label">የትምህርት ደረጃ፡-</span></td>
            <td><span class="value"><?php echo e($employee->education_level ?? '_________________'); ?></span></td>
            <td><span class="label">የጡረታ መለያ ቁጥር፡-</span></td>
            <td><span class="value"><?php echo e($employee->pension_id ?? '_________________'); ?></span></td>
        </tr>
        <tr>
            <td><span class="label">የትምህርት አይነት:-</span></td>
            <td><span class="value"><?php echo e($employee->education_type ?? '_________________'); ?></span></td>
            <td><span class="label">ደመወዝ፡-</span></td>
            <td><span class="value"><?php echo e($employee->salary ? number_format($employee->salary, 2) : '___________'); ?>/<?php echo e($employee->allowance ? number_format($employee->allowance, 2) : '___________'); ?>/</span></td>
        </tr>
        <tr>
            <td><span class="label">የተመረቁበት ቀን፡-</span></td>
            <td><span class="value"><?php echo e($employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : '_________________'); ?></span></td>
            <td><span class="label">አማካይ BSC ምዘና ውጤት ፡-</span></td>
            <td><span class="value"><?php echo e($employee->cgpa ?? '_________________'); ?></span></td>
        </tr>
        <tr>
            <td><span class="label">የፋይል ቁጥር፡-</span></td>
            <td><span class="value"><?php echo e($employee->file_number ?? '_________________'); ?></span></td>
            <td><span class="label">የማህደር ጥራት ሁኔታ:-</span></td>
            <td><span class="value"><?php echo e($employee->higher_ed_verified ? 'የተረጋገጠ' : '_______________'); ?></span></td>
        </tr>
    </table>

    <!-- Experience Section -->
    <div class="experience-section">
        <h3>ኃላፊነቶችና ጠቅላላ አገልግሎት</h3>

        <?php
            $totalYears = 0;
            $totalMonths = 0;
            $totalDays = 0;
        ?>

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
                <?php $__empty_1 = true; $__currentLoopData = $employee->experiences ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $exp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php
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
                ?>
                <tr>
                    <td><?php echo e($exp->from_date ? \Carbon\Carbon::parse($exp->from_date)->format('d/m/Y') : '__________'); ?></td>
                    <td>
                        <?php if($exp->to_date): ?>
                            <?php echo e(\Carbon\Carbon::parse($exp->to_date)->format('d/m/Y')); ?>

                        <?php elseif($exp->experience_type == 'current'): ?>
                            እስከ አሁን
                        <?php else: ?>
                            __________
                        <?php endif; ?>
                    </td>
                    <td><?php echo e($years); ?></td>
                    <td><?php echo e($months); ?></td>
                    <td><?php echo e($days); ?></td>
                    <td><?php echo e($exp->job_title ?? '____________________'); ?></td>
                    <td><?php echo e($exp->institution ?? '____________________'); ?></td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <tr>
                    <td>__________</td>
                    <td>__________</td>
                    <td>__</td>
                    <td>__</td>
                    <td>__</td>
                    <td>____________________</td>
                    <td>____________________</td>
                </tr>
                <tr>
                    <td>__________</td>
                    <td>__________</td>
                    <td>__</td>
                    <td>__</td>
                    <td>__</td>
                    <td>____________________</td>
                    <td>____________________</td>
                </tr>
                <?php endif; ?>

                <?php
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
                ?>

                <tr class="total-row">
                    <td colspan="2" style="text-align: right; font-weight: bold;">ድምር</td>
                    <td style="font-weight: bold;"><?php echo e($totalYears); ?></td>
                    <td style="font-weight: bold;"><?php echo e($totalMonths); ?></td>
                    <td style="font-weight: bold;"><?php echo e($totalDays); ?></td>
                    <td colspan="2"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Signature Section -->
    <table class="signature-table align-items-right">
        <tr>
            <td style="width: 33%;">
                <div>ያዘጋጀው _______________</div>
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

</body>

</html>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/employees/pdf.blade.php ENDPATH**/ ?>