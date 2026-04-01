<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;


class EmployeeExport implements FromCollection, WithMapping, WithHeadings
{

    use Exportable;

    protected $reports;

    public function __construct($reports)
    {
        $this->reports = $reports;
    }

    public function collection()
    {
        return $this->reports;
    }

    public function map($report): array
    {
        return [

             $report->file_number,
             $report->employee_name,
             $report->job_title,
             $report->gender,
             $report->job_level,
             $report->ethnicity,
             $report->religion,
             $report->date_of_birth,
             $report->hire_date,
             $report->step,
             $report->salary,
             $report->allowance,
             $report->assignment_date,
             $report->housing_allowance,
             $report->pension_id,
             $report->marital_status,
             $report->region,
             $report->zone,
             $report->district,
             $report->specific_location,
             $report->house_number,
             $report->phone_number,
             $report->email,
             $report->education_type,
             $report->education_level,
             $report->cgpa,
             $report->institution,
             $report->graduation_date,
             $report->coc_certificate,
             $report->higher_ed_verified,
             $report->current_job_title,
             $report->current_institution,
             $report->experience_from,
             $report->experience_to,
             $report->previous_job_title,
             $report->previous_institution,
             $report->previous_from,
             $report->previous_to,
             $report->column_40,
             $report->diagnosis,
             $report->disability_type,






        // File Uploads



        ];
    }

    public function headings(): array
    {
        return [
            'File number',
        'employee_name',
        'job_title',
        'gender',
        'job_level',
        'ethnicity',
        'religion',
        'date_of_birth',
        'hire_date',

        // Job and Compensation
        'step',
        'salary',
        'allowance',
        'assignment_date',
        'housing_allowance',

        // Personal & Contact
        'pension_id',
        'marital_status',
        'region',
        'zone',
        'district',
        'specific_location',
        'house_number',
        'phone_number',
        'email',

        // Education
        'education_type',
        'education_level',
        'cgpa',
        'institution',
        'graduation_date',
        'coc_certificate',
        'higher_ed_verified',

        // Work Experience (Current)
        'current_job_title',
        'current_institution',
        'experience_from',
        'experience_to',

        // Work Experience (Previous)
        'previous_job_title',
        'previous_institution',
        'previous_from',
        'previous_to',

        // Additional Info
        'column_40',
        'diagnosis',
        'disability_type',



        ];
    }
}
