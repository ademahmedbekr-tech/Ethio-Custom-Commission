<!DOCTYPE html>
<html lang="am">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>የሠራተኛ የግል ሁኔታ መግለጫ – የጉምሩክ ኮሚሽን</title>
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
            font-family: 'Abyssinica SIL', 'Nyala', 'Ethiopic', 'DejaVu Sans', serif;
            font-size: 10.5pt;
            line-height: 1.35;
            background: #f5f0e8;
            color: #1e1e1e;
            padding: 20px;
        }

        .official-paper {
            width: 100%;
            max-width: 900px;
            background: white;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            border: 20px solid #f0e9d8;
            padding: 25px 30px 20px;
            margin: 0 auto;
        }

        .subtitle-wrapper {
            text-align: center;
            margin-bottom: 10px;
        }

        .document-subtitle {
            text-align: center;
            font-size: 14pt;
            font-weight: bold;
            color: #1c0488;
            margin: 5px 0 15px;
            border-bottom: 2px solid #c4a27a;
            display: inline-block;
            padding-bottom: 3px;
        }

        .personal-table {
            width: 100%;
            border-collapse: collapse;
            margin: 14px 0 12px;
        }

        .personal-table td {
            padding: 5px 8px;
            vertical-align: middle;
            font-size: 10pt;
        }

        .personal-table .label-cell {
            font-weight: bold;
            width: 25%;
            color: #1c0488;
            text-align: left;
        }

        .personal-table .value-cell {
            background-color: #ffffff;
            width: 25%;
        }

        .value-text {
            border-bottom: 1px dotted #4c4c99;
            display: inline-block;
            min-width: 80px;
        }

        .value-text:empty::before {
            content: '_______________';
            color: #b8a990;
            letter-spacing: 1px;
        }

        .section-heading {
            font-size: 11pt;
            font-weight: bold;
            text-align: center;
            color: #1c0488;
            margin: 8px 0 4px;
            border-top: 1px solid #c4a27a;
            border-bottom: 1px solid #c4a27a;
            padding: 3px 0;
            background: #fcf9f2;
        }

        .experience-table {
            width: 100%;
            border-collapse: collapse;
            margin: 6px 0 8px;
            font-size: 9.5pt;
            border: 1px solid #1c0488;
        }

        .experience-table th {
            background-color: #1c0488;
            color: white;
            font-weight: bold;
            padding: 5px 4px;
            text-align: center;
            border: 1px solid #ffffff;
            font-size: 9.5pt;
        }

        .experience-table th.sub-header {
            background-color: #3b3486;
            font-size: 9pt;
        }

        .experience-table td {
            border: 1px solid #1c0488;
            padding: 5px 4px;
            text-align: center;
            background-color: #ffffff;
            font-size: 9.5pt;
        }

        .experience-table .total-row td {
            background-color: #e8e4f0;
            font-weight: bold;
            border-top: 2px solid #1c0488;
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

        .official-footer {
            text-align: center;
            margin-top: 8px;
            font-size: 8pt;
            color: #2c3e50;
            border-top: 1px solid #c4a27a;
            padding-top: 5px;
        }

        @media print {
            body {
                margin: 0;
                padding: 0;
                background: white;
            }
            .official-paper {
                box-shadow: none;
                border: 1px solid #000;
                padding: 14px 18px;
                max-width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="official-paper">

        <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px; border-bottom: 3px double #1e3c72; padding-bottom: 15px;">
            <tr>
                <td style="width: 85px; vertical-align: middle; padding-bottom: 10px;">
                    <img src="<?php echo e(public_path('Photo/picture1.jpg')); ?>" alt="Logo" style="width: 70px; height: 70px; display: block; object-fit: contain;">
                </td>
                <td style="vertical-align: middle; text-align: left; padding-bottom: 10px; padding-left: 5px;">
                    <div style="font-size: 26px; font-weight: 800; color: #1e3c72; letter-spacing: 1px; line-height: 1.3; margin: 0;">የኢትዮጵያ ጉምሩክ ኮሚሽን</div>
                    <div style="font-size: 18px; font-weight: 700; color: #1e3c72; text-transform: uppercase; letter-spacing: 2px; font-family: 'Arial', 'DejaVu Sans', sans-serif; line-height: 1.3; margin-top: 2px; margin: 0;">FDRE CUSTOMS COMMISSION</div>
                </td>
                 <td style="width: 85px; vertical-align: middle; padding-bottom: 10px;">
                    <img src="<?php echo e(public_path('dash/assets/img/avatars/FDRE_logo.jpg')); ?>" alt="Logo" style="width: 70px; height: 70px; display: block; object-fit: contain;">
                </td>
            </tr>
        </table>

        <div class="subtitle-wrapper">
            <span class="document-subtitle">የሠራተኛ የግል ሁኔታ መግለጫ</span>
        </div>

        <table class="personal-table">
            <tr>
                <td class="label-cell">ስም ከነ አያት</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->employee_name ?? ''); ?></span></td>
                <td class="label-cell">የሰለጠኑበት ሙያ</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->previous_job_title ?? ''); ?></span></td>
            </tr>
            <tr>
                <td class="label-cell">የልደት ዘመን</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->date_of_birth ? $employee->date_of_birth->format('d/m/Y') : ''); ?></span></td>
                <td class="label-cell">የሥራ መደብ / ድርሻ</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->current_job_title ?? ($employee->job_title ?? '')); ?></span></td>
            </tr>
            <tr>
                <td class="label-cell">የቅጥር ዘመን</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->hire_date ? $employee->hire_date->format('d/m/Y') : ''); ?></span></td>
                <td class="label-cell">የአገልግሎት ደረጃ</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->job_level ?? ''); ?></span></td>
            </tr>
            <tr>
                <td class="label-cell">የትምህርት ደረጃ</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->education_level ?? ''); ?></span></td>
                <td class="label-cell">የጡረታ መለያ ቁጥር</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->pension_id ?? ''); ?></span></td>
            </tr>
            <tr>
                <td class="label-cell">የትምህርት አይነት</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->education_type ?? ''); ?></span></td>
                <td class="label-cell">ደመወዝ / አበል</td>
                <td class="value-cell">
                    <span class="value-text"><?php echo e($employee->salary ? number_format($employee->salary, 2) : ''); ?></span>
                    /
                    <span class="value-text"><?php echo e($employee->allowance ? number_format($employee->allowance, 2) : ''); ?></span>
                </td>
            </tr>
            <tr>
                <td class="label-cell">የተመረቁበት ቀን</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->graduation_date ? $employee->graduation_date->format('d/m/Y') : ''); ?></span></td>
                <td class="label-cell">አማካይ BSC ምዘና ውጤት</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->cgpa ?? ''); ?></span></td>
            </tr>
            <tr>
                <td class="label-cell">የፋይል ቁጥር</td>
                <td class="value-cell"><span class="value-text"><?php echo e($employee->file_number ?? ''); ?></span></td>
                <td class="label-cell">የማህደር ጥራት ሁኔታ</td>
                <td class="value-cell">
                    <span class="value-text"><?php echo e(isset($employee->higher_ed_verified) ? ($employee->higher_ed_verified ? 'የተረጋገጠ' : 'ያልተረጋገጠ') : ''); ?></span>
                </td>
            </tr>
        </table>

        <div class="section-heading">ኃላፊነቶችና ጠቅላላ አገልግሎት</div>

        <?php
            $totalYears = 0;
            $totalMonths = 0;
            $totalDays = 0;
        ?>

        <table class="experience-table">
            <thead>
                <tr>
                    <th colspan="2">የቀጣሪ ዘመን</th>
                    <th colspan="3">ጠቅላላ የስራ ዘመን</th>
                    <th rowspan="2">የስራ መጠሪያ</th>
                    <th colspan="2">ያገለገሉበት ተቋም</th>
                </tr>
                <tr>
                    <th class="sub-header">ከወር/ዓመት</th>
                    <th class="sub-header">እስከ ወር/ዓመት</th>
                    <th class="sub-header">ዓመት</th>
                    <th class="sub-header">ወር</th>
                    <th class="sub-header">ቀን</th>
                    <th class="sub-header">የአሁን ተቋም</th>
                    <th class="sub-header">የቀድሞ ተቋም</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $employee->experiences ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $exp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <?php
                        $start = $exp->from_date ? \Carbon\Carbon::parse($exp->from_date) : null;
                        $end = $exp->to_date
                            ? \Carbon\Carbon::parse($exp->to_date)
                            : ($exp->experience_type == 'current'
                                ? \Carbon\Carbon::now()
                                : null);
                        $years = 0;
                        $months = 0;
                        $days = 0;
                        if ($start && $end) {
                            $diff = $start->diff($end);
                            $years = $diff->y;
                            $months = $diff->m;
                            $days = $diff->d;
                            $totalYears += $years;
                            $totalMonths += $months;
                            $totalDays += $days;
                        }
                        $currentInstitution = $exp->in_outside == 'inside' ? $exp->institution ?? '' : '';
                        $previousInstitution = $exp->in_outside != 'inside' ? $exp->institution ?? '' : '';
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
                        <td><?php echo e($exp->job_title ?? '_______________'); ?></td>
                        <td><?php echo e($currentInstitution ?: '__________'); ?></td>
                        <td><?php echo e($previousInstitution ?: '__________'); ?></td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td>__________</td>
                        <td>__________</td>
                        <td>__</td>
                        <td>__</td>
                        <td>__</td>
                        <td>_______________</td>
                        <td>__________</td>
                        <td>__________</td>
                    </tr>
                <?php endif; ?>

                <?php
                    if ($totalDays >= 30) {
                        $totalMonths += floor($totalDays / 30);
                        $totalDays = $totalDays % 30;
                    }
                    if ($totalMonths >= 12) {
                        $totalYears += floor($totalMonths / 12);
                        $totalMonths = $totalMonths % 12;
                    }
                ?>

                <tr class="total-row">
                    <td colspan="2" style="text-align: right;">ድምር</td>
                    <td><?php echo e($totalYears); ?></td>
                    <td><?php echo e($totalMonths); ?></td>
                    <td><?php echo e($totalDays); ?></td>
                    <td colspan="3"></td>
                </tr>
            </tbody>
        </table>

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



        <div class="official-footer">
            ይህ ሰነድ የጉምሩክ ኮሚሽን ኦፊሴላዊ መዝገብ ነው።
        </div>

    </div>
</body>

</html>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/employees/pdf.blade.php ENDPATH**/ ?>