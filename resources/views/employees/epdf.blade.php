<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Experience Certificate - {{ $employee->employee_name }}</title>
    <style>
        @page {
            font-family: 'Abyssinica SIL';
            font-style: normal;
            font-weight: normal;
            src: url("{{ storage_path('fonts/AbyssinicaSIL-Regular.ttf') }}") format('truetype');
            /* src: url("{{ asset('assets/img/avatars/17.png') }}") */
        }

        body {
            font-family: 'Abyssinica SIL', 'Nyala', 'Ethiopic', 'DejaVu Sans', serif;
            background: #f9f6e7;
            margin: 0;
            padding: 0;
            color: #2c3e50;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .certificate-wrapper {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            background: white;
            /* box-shadow: 0 10px 40px rgba(0,0,0,0.2); */
            position: relative;
            /* border: 20px solid #89afe3; */
        }

        .certificate-border {
            border: 2px solid #4032e1;
            padding: 40px;
            position: relative;
            background: white;
        }

        /* Decorative Corner Elements */


        /* Header Styles */
        .header {
            text-align: center;
            margin-bottom: 1px;
            position: relative;
        }

        .institution-name {
            font-size: 20px;
            font-weight: 500;
            color: #1e3c72;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 5px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .institution-address {
            font-size: 14px;
            color: #666;
            font-style: italic;
            margin-bottom: 20px;
        }

        .certificate-title {
            font-size:14px;
            font-weight: 400;
            color: #b8860b;
            text-transform: uppercase;
            letter-spacing: 5px;
            margin: 20px 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            border-top: 2px solid #b8860b;
            border-bottom: 2px solid #b8860b;
            display: inline-block;
            padding: 10px 30px;
        }

        /* Content Styles */
        .content {
            margin: 40px 0;
            line-height: 2;
        }

        .intro-text {
            font-size: 14px;
            text-align: justify;
            margin-bottom: 30px;
        }

        .employee-name {
            font-size: 14px;
            /* font-weight: 1; */
            color: #1e3c72;
            text-align: center;
            /* margin: 20px 0; */
            text-transform: uppercase;
            border-bottom: 2px solid #b8860b;
            /* padding-bottom: 10px; */
        }

        .details {
            font-size: 18px;
            margin: 30px 0;
        }

        .detail-row {
            margin: 15px 0;
            display: flex;
            align-items: baseline;
        }

        .detail-label {
            font-weight: 600;
            min-width: 200px;
            color: #1e3c72;
        }

        .detail-value {
            font-weight: 500;
            border-bottom: 1px dotted #999;
            flex: 1;
            padding: 0 10px;
        }

        .detail-value strong {
            color: #b8860b;
            font-size: 20px;
        }

        .experience-box {
            background: #f9f6e7;
            padding: 20px;
            margin: 30px 0;
            text-align: center;
            border: 2px solid #b8860b;
            border-radius: 10px;
        }

        .experience-text {
            font-size: 24px;
            font-weight: 600;
            color: #1e3c72;
        }

        .experience-number {
            font-size: 48px;
            font-weight: 800;
            color: #b8860b;
            margin: 0 15px;
        }

        .performance-text {
            font-style: italic;
            font-size: 14px;
            margin: 20px 0;
            text-align: center;
            color: #444;
        }

        /* Signature Section */
        .signature-section {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .signature-box {
            text-align: center;
            width: 250px;
        }

        .signature-line {
            width: 200px;
            border-top: 2px solid #333;
            margin: 10px auto;
        }

        .signature-name {
            font-weight: 600;
            color: #1e3c72;
        }

        .signature-title {
            font-size: 14px;
            color: #666;
        }

        .date-box {
            text-align: center;
        }

        .date-label {
            font-weight: 600;
            color: #1e3c72;
        }

        .date-value {
            font-size: 16px;
            border-top: 2px solid #333;
            padding-top: 5px;
            margin-top: 5px;
        }

        /* Certificate Number */
        .certificate-number {
            position: absolute;
            bottom: 20px;
            right: 40px;
            font-size: 12px;
            color: #999;
            font-style: italic;
        }

        /* Footer */
        .footer-note {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: #999;
            border-top: 1px solid #eee;
            padding-top: 15px;
        }

        /* Official Stamp */
        .stamp {
            position: absolute;
            bottom: 100px;
            right: 80px;
            width: 120px;
            height: 120px;
            border: 3px solid #b8860b;
            border-radius: 50%;
            transform: rotate(-15deg);
            opacity: 0.3;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stamp-text {
            font-size: 18px;
            font-weight: 800;
            color: #b8860b;
            text-transform: uppercase;
            transform: rotate(15deg);
        }

        /* Badge */
        .badge {
            position: absolute;
            top: 40px;
            right: 40px;
            width: 100px;
            height: 100px;
            background: #f0e9d8;
            border: 3px solid #b8860b;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 700;
            color: #1e3c72;
            text-align: center;
            text-transform: uppercase;
            transform: rotate(15deg);
        }
    </style>
</head>
<body>

    <div class="certificate-wrapper">
        <div class="certificate-border">
            <!-- Decorative Corners -->

            <!-- Badge -->
             <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px; border-bottom: 3px double #1e3c72; padding-bottom: 15px;">
            <tr>
                <td style="width: 85px; vertical-align: middle; padding-bottom: 10px;">
                    <img src="{{ public_path('Photo/picture1.jpg') }}" alt="Logo" style="width: 70px; height: 70px; display: block; object-fit: contain;">
                </td>
                <td style="vertical-align: middle; text-align: left; padding-bottom: 10px; padding-left: 5px;">
                    <div style="font-size: 26px; font-weight: 800; color: #1e3c72; letter-spacing: 1px; line-height: 1.3; margin: 0;">የኢትዮጵያ ጉምሩክ ኮሚሽን</div>
                    <div style="font-size: 18px; font-weight: 700; color: #1e3c72; text-transform: uppercase; letter-spacing: 2px; font-family: 'Arial', 'DejaVu Sans', sans-serif; line-height: 1.3; margin-top: 2px; margin: 0;">FDRE CUSTOMS COMMISSION</div>
                </td>
                <td style="width: 85px; vertical-align: middle; padding-bottom: 10px;">
                    <img src="{{ public_path('dash/assets/img/avatars/FDRE_logo.jpg') }}" alt="Logo" style="width: 70px; height: 70px; display: block; object-fit: contain;">
                </td>
            </tr>
        </table>

            <!-- Header -->
            <div class="header">
                {{-- <div class="institution-name">የሰራተኞች አስተዳደር ሥርዓት</div> --}}
                <div class="institution-name" style="font-size: 28px;">ለሚመለከተዉ ሁሉ</div>
                <div class="institution-address">Addis Ababa, Ethiopia | 2018 EC</div>
            </div>

            <!-- Content -->
            <div class="content">
                <div class="intro-text">
                    This is to certify that <strong class="employee-name">Mr./Ms. {{ $employee->employee_name }}</strong> was employed by our institution and has served with dedication and integrity. During their tenure, they have demonstrated exceptional professional conduct and commitment to their duties.
                </div>

                {{-- <div class="employee-name">{{ $employee->employee_name }}</div>

                <div class="details">
                    <div class="detail-row">
                        <span class="detail-label">Employee ID Number:</span>
                        <span class="detail-value"><strong>{{ $employee->file_number }}</strong></span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Position Held:</span>
                        <span class="detail-value"><strong>{{ $employee->job_title ?? 'Employee' }}</strong></span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Department/Unit:</span>
                        <span class="detail-value"><strong>{{ $employee->department ?? 'General' }}</strong></span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Employment Status:</span>
                        <span class="detail-value"><strong>{{ $employee->employment_status ?? 'Permanent' }}</strong></span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Date of Joining:</span>
                        <span class="detail-value"><strong>{{ $employee->experience_inside_from ? date('F d, Y', strtotime($employee->experience_inside_from)) : $employee->created_at->format('F d, Y') }}</strong></span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Date of Leaving:</span>
                        <span class="detail-value"><strong>{{ now()->format('F d, Y') }}</strong></span>
                    </div>
                </div> --}}

                <!-- Experience Summary -->
                {{-- <div class="experience-box">
                    <div class="experience-text">
                        TOTAL SERVICE PERIOD
                    </div>
                    <div>
                        <span class="experience-number">{{ floor($employee->total_work_experience ?? 0) }}</span> YEARS
                        @if(($employee->total_work_experience - floor($employee->total_work_experience ?? 0)) > 0)
                            <span class="experience-number">{{ round(($employee->total_work_experience - floor($employee->total_work_experience)) * 12) }}</span> MONTHS
                        @endif
                    </div>
                </div> --}}

                <!-- Experience Details -->


                <div class="performance-text">
                    "During their employment, {{ explode(' ', $employee->employee_name)[0] }} has shown exemplary performance,
                    professionalism, and dedication. They leave with our best wishes for their future endeavors."
                </div>
            </div>

            <!-- Signature Section -->
            <table class="signature-section">
                <tr>
                <td class="signature-box">
                    <div class="signature-line"></div>
                    <div class="signature-name">_________________________</div>
                    <div class="signature-title">HR Manager</div>
                </td>

                <td class="signature-box">
                    <div class="signature-line"></div>
                    <div class="signature-name">_________________________</div>
                    <div class="signature-title">Director</div>
                </td>


                </tr>
            </table>
  <div class="date-box">
                    <div class="date-label">Issue Date</div>
                    <div class="date-value">{{ now()->format('F d, Y') }}</div>
                </div>
            <!-- Official Stamp (Optional) -->
            {{-- <div class="stamp">
                <div class="stamp-text">OFFICIAL<br>SEAL</div>
            </div> --}}

            <!-- Certificate Number -->
            <div class="certificate-number">
                Certificate No: CERT-{{ date('Y') }}-{{ str_pad($employee->id, 4, '0', STR_PAD_LEFT) }}
            </div>

            <!-- Footer -->
            <div class="footer-note">
                This is a computer-generated certificate and does not require a physical signature.<br>
                Verified at: {{ url('/employees/' . $employee->id) }}
            </div>
        </div>
    </div>
</body>
</html>
