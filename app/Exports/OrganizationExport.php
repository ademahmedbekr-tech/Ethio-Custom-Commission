<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;


class OrganizationExport implements FromCollection, WithMapping, WithHeadings
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

            $report->id,
            $report->member_id,
            $report->organization_name,
            $report->organization_type,
            $report->address,
            $report->contact_number,
            $report->woreda,
            $report->email,
            $report->payment_period,
            $report->member_started,
            $report->membership_type,
            $report->membership_fee,


        ];
    }

    public function headings(): array
    {
        return [
        'Number',
        'Member ID',
        'First Name',
        'Middle Name',
        'Last Name',
        'Gender',
        'Age',
        'Education',
        'Address',
        'Contact',
        'Woreda',
        'Email',
        'Position',
        'Joined Date',
        'Membership Type',
        'Membership Fee',


        ];
    }
}
