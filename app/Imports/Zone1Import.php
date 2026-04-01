<?php

namespace App\Imports;

use App\Models\Zone1;
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class Zone1Import implements ToCollection
{
    protected $id;
    public $errors = [];
    public $successCount = 0;

    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
     * @param Collection $rows
     */
    public function collection(Collection $rows)
    {
        // Remove header row if exists
        $rows = $rows->skip(1);

        foreach ($rows as $index => $row) {
            $rowNumber = $index + 2; // Excel row number (accounting for header)

            // Skip empty rows
            if (empty($row[0])) {
                continue;
            }

            try {
                // Parse joined_date
                $joinedDate = $this->parseDate($row[12] ?? null, $rowNumber);

                // Create the record
                Zone1::create([
                    'id' => $this->id,
                    'member_id' => $row[0],
                    'first_name' => $row[1] ?? null,
                    'middle_name' => $row[2] ?? null,
                    'last_name' => $row[3] ?? null,
                    'gender' => $row[4] ?? null,
                    'age' => $row[5] ?? null,
                    'education_level' => $row[6] ?? null,
                    'address' => $row[7] ?? null,
                    'contact_number' => $row[8] ?? null,
                    'woreda' => $row[9] ?? null,
                    'email' => $row[10] ?? null,
                    'position' => $row[11] ?? null,
                    'joined_date' => $joinedDate,
                    'membership_type' => $row[13] ?? null,
                    'membership_fee' => $row[14] ?? null,
                ]);

                $this->successCount++;

            } catch (\Exception $e) {
                $this->errors[] = "Row {$rowNumber}: " . $e->getMessage();
                Log::error("Import error on row {$rowNumber}: " . $e->getMessage());
            }
        }
    }

    /**
     * Parse date from various formats
     */
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
}
