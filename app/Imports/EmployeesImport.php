<?php

namespace App\Imports;

use App\Models\Employee;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Carbon\Carbon;

class EmployeesImport implements ToCollection
{
    protected $id;

    public $errors = [];
    public $successCount = 0;
       public function __construct($id)
    {
        $this->id = $id;
    }

    public function collection(Collection $rows)
    {
        foreach ($rows as $index => $row) {
            $rowNumber = $index + 2; // Excel row number (accounting for header)

              if (empty($row[0])) {
                continue;
            }

            try {
                $dob = $this->parseDate($row[7] ?? null, $rowNumber);
                $hid = $this->parseDate($row[8] ?? null, $rowNumber);
                $assigndate = $this->parseDate($row[12] ?? null, $rowNumber);
                $graduate = $this->parseDate($row[27] ?? null, $rowNumber);
                $experfrom = $this->parseDate($row[32] ?? null, $rowNumber);
                $experto = $this->parseDate($row[33] ?? null, $rowNumber);
                $previous1 = $this->parseDate($row[36] ?? null, $rowNumber);
                $previous2 = $this->parseDate($row[37] ?? null, $rowNumber);


                Employee::create([
                    'id' => $this->id,
                    'file_number' => $row[0],
                    'employee_name' => $row[1],
                    'job_title' => $row[2],

                    'gender' => $this->parseGender($row[3] ?? null),

                    'job_level' => $row[4],
                    'ethnicity' => $row[5],
                    'religion' => $row[6],

                    'date_of_birth' => $dob,
                    'hire_date' => $hid,

                    'step' => $row[9],
                    'salary' => $row[10],
                    'allowance' => $row[11],

                    'assignment_date' => $assigndate,
                    'housing_allowance' => $row[13],

                    'pension_id' => $row[14],

                    'marital_status' => $this->parseMaritalStatus($row[15] ?? null),

                    'region' => $row[16],
                    'zone' => $row[17],
                    'district' => $row[18],
                    'specific_location' => $row[19],

                    'house_number' => $row[20],
                    'phone_number' => (string)$row[21],
                    'email' => $row[22],

                    'education_type' => $row[23],
                    'education_level' => $row[24],
                    'cgpa' => $row[25],
                    'institution' => $row[26],

                    'graduation_date' => $graduate,

                    'coc_certificate' => $row[28] ? 1 : 0,
                    'higher_ed_verified' => $row[29] ? 1 : 0,

                    'current_job_title' => $row[30],
                    'current_institution' => $row[31],

                    'experience_from' => $experfrom,
                    'experience_to' => $experto,

                    'previous_job_title' => $row[34],
                    'previous_institution' => $row[35],

                    'previous_from' => $previous1,
                    'previous_to' => $previous2,

                    'diagnosis' => $row[38],
                    'disability_type' => $row[39],
                    'column_40' => $row[40] ?? null,

                ]);

                $this->successCount++;

            } catch (\Exception $e) {
                $this->errors[] = "Row ".($index+2).": ".$e->getMessage();
            }

        }
    }


    private function parseDate($dateValue, $rowNumber)
    {
        if (empty($dateValue)) {
            return null;
        }

        try {
            // If it's an Excel serial number
            if (is_numeric($dateValue)) {
                return Date::excelToDateTimeObject($dateValue)->format('Y-m-d');
            }

            // If it's already a DateTime object
            if ($dateValue instanceof \DateTime) {
                return $dateValue->format('Y-m-d');
            }

            // If it's a string, try multiple formats
            $stringValue = trim((string)$dateValue);

            // Common date formats
            $formats = [
                'Y-m-d',    // 2024-01-15
                'd/m/Y',    // 15/01/2024
                'm/d/Y',    // 01/15/2024
                'd-m-Y',    // 15-01-2024
                'm-d-Y',    // 01-15-2024
                'Y/m/d',    // 2024/01/15
                'd.m.Y',    // 15.01.2024
                'm.d.Y',    // 01.15.2024
                'j/n/Y',    // 15/1/2024
                'n/j/Y',    // 1/15/2024
                'd M Y',    // 15 Jan 2024
                'M d Y',    // Jan 15 2024
            ];

            foreach ($formats as $format) {
                $date = \DateTime::createFromFormat($format, $stringValue);
                if ($date !== false && $date->format($format) === $stringValue) {
                    return $date->format('Y-m-d');
                }
            }

            // Try Carbon as last resort
            return Carbon::parse($stringValue)->format('Y-m-d');

        } catch (\Exception $e) {
            $this->errors[] = "Row {$rowNumber}: Invalid date format '{$dateValue}'. Using NULL.";
            return null;
        }
    }

    private function parseGender($gender)
    {
        $gender = trim($gender);

        if ($gender == 'ወ' || $gender == 'ወንድ') {
            return 'ወ';
        }

        if ($gender == 'ሴ' || $gender == 'ሴት') {
            return 'ሴ';
        }

        return null;
    }

    private function parseMaritalStatus($status)
    {
        return match(trim($status)) {
            'ያገባ' => 'Married',
            'ነጠላ' => 'Single',
            'የተፋታ' => 'Divorced',
            'የሞተባት' => 'Widowed',
            default => null
        };
    }

}
