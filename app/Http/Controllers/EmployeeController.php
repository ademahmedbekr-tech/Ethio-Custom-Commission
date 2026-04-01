<?php

// app/Http/Controllers/EmployeeController.php

namespace App\Http\Controllers;

use App\Exports\EmployeeExport;
use App\Imports\EmployeesImport;
use App\Models\Employee;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;
use Maatwebsite\Excel\Facades\Excel;
use Mpdf\Config\ConfigVariables;
use Mpdf\Config\FontVariables;
use Mpdf\Mpdf;

class EmployeeController extends Controller
{
    /**
     * Dashboard/Summary page
     */
    public function dashboard()
    {
        $name = 'Employee Dashboard';

        // Statistics
        $totalEmployees = Employee::count();
        $activeEmployees = Employee::whereNull('deleted_at')->count();
        $inactiveEmployees = Employee::onlyTrashed()->count();

        // Statistics by job position
        $jobStats = Employee::select('job_title', DB::raw('count(*) as total'))
            ->whereNotNull('job_title')
            ->whereNull('deleted_at')
            ->groupBy('job_title')
            ->orderBy('total', 'desc')
            ->limit(10)
            ->get();

        // Statistics by gender
        $genderStats = Employee::select('gender', DB::raw('count(*) as total'))
            ->whereNotNull('gender')
            ->whereNull('deleted_at')
            ->groupBy('gender')
            ->get();

        // Statistics by education level
        $educationStats = Employee::select('education_level', DB::raw('count(*) as total'))
            ->whereNotNull('education_level')
            ->whereNull('deleted_at')
            ->groupBy('education_level')
            ->get();

        // Statistics by region
        $regionStats = Employee::select('region', DB::raw('count(*) as total'))
            ->whereNotNull('region')
            ->whereNull('deleted_at')
            ->groupBy('region')
            ->orderBy('total', 'desc')
            ->limit(10)
            ->get();

        // Recent employees
        $recentEmployees = Employee::latest()->take(5)->get();

        // Salary statistics
        $avgSalary = Employee::whereNull('deleted_at')->avg('salary');
        $totalPayroll = Employee::whereNull('deleted_at')->sum(DB::raw('COALESCE(salary, 0) + COALESCE(allowance, 0) + COALESCE(housing_allowance, 0)'));

        return view('employees.dashboard', compact(
            'name',
            'totalEmployees',
            'activeEmployees',
            'inactiveEmployees',
            'jobStats',
            'genderStats',
            'educationStats',
            'regionStats',
            'recentEmployees',
            'avgSalary',
            'totalPayroll'
        ));
    }

    /**
     * Display listing of employees
     */
    public function index(Request $request)
    {
        $name = 'Employees List';
    $zone   = 'employees';

        $employees = 'emplooyees';
        $count = Employee::count();

        // Filter parameters
        $jobTitle = $request->job_title;
        $region = $request->region;
        $gender = $request->gender;
        $educationLevel = $request->education_level;
        $status = $request->status; // active, inactive, all

        // Get distinct values for filters
        $jobTitles = Employee::select('job_title')
            ->distinct()
            ->whereNotNull('job_title')
            ->orderBy('job_title', 'ASC')
            ->pluck('job_title');

        $regions = Employee::select('region')
            ->distinct()
            ->whereNotNull('region')
            ->orderBy('region', 'ASC')
            ->pluck('region');

        $educationLevels = Employee::select('education_level')
            ->distinct()
            ->whereNotNull('education_level')
            ->orderBy('education_level', 'ASC')
            ->pluck('education_level');

        // Base query
        if ($status === 'inactive') {
            $query = Employee::onlyTrashed();
        } elseif ($status === 'all') {
            $query = Employee::withTrashed();
        } else {
            $query = Employee::query(); // active only (default)
        }

        // Apply filters
        if ($jobTitle) {
            $query->where('job_title', 'LIKE', "%{$jobTitle}%");
        }

        if ($region) {
            $query->where('region', $region);
        }

        if ($gender) {
            $query->where('gender', $gender);
        }

        if ($educationLevel) {
            $query->where('education_level', $educationLevel);
        }

        // Pagination
        $employees = $query->orderBy('created_at', 'desc')->paginate(7)->withQueryString();

        // Add computed fields

        $employees->getCollection()->transform(function ($item, $key) use ($employees) {
            $item->row_id = ($employees->currentPage() - 1) * $employees->perPage() + $key + 1;

            $item->age = $item->date_of_birth
                ? Carbon::parse($item->date_of_birth)->age
                : null;

            $item->years_of_service = $item->hire_date
                ? Carbon::parse($item->hire_date)->diffInYears(now())
                : null;

            $item->total_salary = ($item->salary ?? 0)
                + ($item->allowance ?? 0)
                + ($item->housing_allowance ?? 0);

            return $item;
        });

        // Statistics for summary cards
        $totalCount = Employee::count();
        $regionCount = Employee::select('region')
        ->distinct()
        ->orderBy('region', 'ASC')
        ->pluck('region');
        $maleCount = Employee::where('gender', 'ወ')->count();
        $femaleCount = Employee::where('gender', 'ሴ')->count();
        $withDisability = Employee::whereNotNull('disability_type')->count();
        $rcount = Employee::select('region', DB::raw('count(*) as total'))->groupBy('region')->pluck('total', 'region')->toArray();

        return view('employees.index', compact(
            'employees',
            'name',
            'zone',
            'jobTitle',
            'region',
            'gender',
            'educationLevel',
            'status',
            'jobTitles',
            'regions',
            'educationLevels',
            'totalCount',
            'maleCount',
            'femaleCount',
            'withDisability',
            'count',
            'regionCount',
            'rcount'
        ));
    }

    /**
     * Show create form
     */
    public function create()
    {
        // Predefined lists
        $genders = ['ወ', 'ሴ'];
        $maritalStatuses = ['Single', 'Married', 'Divorced', 'Widowed'];
        $educationLevels = ['High School', 'Diploma', 'Bachelor', 'Master', 'PhD', 'Certificate', 'Other'];
        $educationTypes = ['Formal', 'Informal', 'Technical', 'Vocational', 'Religious', 'Other'];
        $religions = ['Christian', 'Muslim', 'Traditional', 'Other'];
        $ethnicities = ['Oromo', 'Amhara', 'Tigray', 'Somali', 'Gurage', 'Sidama', 'Wolayta', 'Afar', 'Other'];
        $jobLevels = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII'];
        $disabilityTypes = ['Physical', 'Visual', 'Hearing', 'Speech', 'Intellectual', 'Mental', 'None'];

        // Regions of Ethiopia
        $regions = [
            'Addis Ababa',
            'Afar',
            'Amhara',
            'Benishangul-Gumuz',
            'Dire Dawa',
            'Gambela',
            'Harari',
            'Oromia',
            'Sidama',
            'Somali',
            'SNNPR',
            'Tigray',
            'South West Ethiopia Peoples',
        ];

        return view('employees.create', compact(
            'genders',
            'maritalStatuses',
            'educationLevels',
            'educationTypes',
            'religions',
            'ethnicities',
            'jobLevels',
            'regions',
            'disabilityTypes'
        ));
    }

    /**
     * Store new employee
     */
    public function store(Request $request)
    {
        // Validate request
        $validated = $request->validate([
            // Required fields
            'file_number' => 'nullable|string|unique:employees,file_number',
            'employee_name' => 'required|string|max:255',

            // Employee Information
            'job_title' => 'nullable|string|max:255',
            'gender' => 'nullable|string|in:ወ,ሴ',
            'job_level' => 'nullable|string|max:50',
            'branch_name' => 'nullable|string|max:50',
            'ethnicity' => 'nullable|string|max:100',
            'religion' => 'nullable|string|max:100',
            'date_of_birth' => 'nullable|date',
            'hire_date' => 'nullable|date',

            // Job and Compensation
            'step' => 'nullable|integer|min:1|max:20',
            'salary' => 'nullable|numeric|min:0',
            'allowance' => 'nullable|numeric|min:0',
            'assignment_date' => 'nullable|date',
            'housing_allowance' => 'nullable|numeric|min:0',

            // Personal & Contact
            'pension_id' => 'nullable|string|max:50',
            'marital_status' => 'nullable|string|in:Single,Married,Divorced,Widowed',
            'region' => 'nullable|string|max:100',
            'zone' => 'nullable|string|max:100',
            'district' => 'nullable|string|max:100',
            'specific_location' => 'nullable|string|max:255',
            'house_number' => 'nullable|string|max:50',
            'phone_number' => 'nullable|string|max:20',
            'email' => 'nullable|email|unique:employees,email',

            // Education
            'education_type' => 'nullable|string|max:100',
            'education_level' => 'nullable|string|max:100',
            'cgpa' => 'nullable|numeric|min:0|max:4',
            'institution' => 'nullable|string|max:255',
            'graduation_date' => 'nullable|date',
            'coc_certificate' => 'nullable|boolean',
            'higher_ed_verified' => 'nullable|boolean',

            // Work Experience (Current)
            'current_job_title' => 'nullable|string|max:255',
            'current_institution' => 'nullable|string|max:255',
            'experience_from' => 'nullable|date',
            'experience_to' => 'nullable|date',

            // Work Experience (Previous)
            'previous_job_title' => 'nullable|string|max:255',
            'previous_institution' => 'nullable|string|max:255',
            'previous_from' => 'nullable|date',
            'previous_to' => 'nullable|date',

            // Additional Info
            'column_40' => 'nullable|string|max:255',
            'diagnosis' => 'nullable|string',
            'disability_type' => 'nullable|string|max:255',

            // Files
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'document' => 'nullable|mimes:pdf,doc,docx,txt|max:5120',
        ]);

        // Handle photo upload
        if ($request->hasFile('photo')) {
            $image = $request->file('photo');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();

            // Create directory if it doesn't exist
            if (! file_exists(public_path('uploads/employees/photos'))) {
                mkdir(public_path('uploads/employees/photos'), 0777, true);
            }

            // Resize and save image
            $img = Image::make($image);
            $img->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });
            $img->save(public_path('uploads/employees/photos/'.$name_gen));

            $validated['photo'] = 'uploads/employees/photos/'.$name_gen;
        }

        // Handle document upload
        if ($request->hasFile('document')) {
            $document = $request->file('document');
            $documentName = time().'_'.$document->getClientOriginalName();

            // Create directory if it doesn't exist
            if (! file_exists(public_path('uploads/employees/documents'))) {
                mkdir(public_path('uploads/employees/documents'), 0777, true);
            }

            $document->move(public_path('uploads/employees/documents'), $documentName);
            $validated['document'] = 'uploads/employees/documents/'.$documentName;
        }

        // Set boolean fields
        $validated['coc_certificate'] = $request->has('coc_certificate');
        $validated['higher_ed_verified'] = $request->has('higher_ed_verified');

        // Create employee
        $employee = Employee::create($validated);

        return redirect()->route('employees.index')
            ->with('success', 'Employee created successfully.');
    }

    /**
     * Display employee details
     */
    public function show($id)
    {
        $employee = Employee::withTrashed()->findOrFail($id);

        return view('employees.show', compact('employee'));
    }

    /**
     * Show edit form
     */
    public function edit($id)
    {
        $employee = Employee::findOrFail($id);

        // Predefined lists
        $genders = ['ወ', 'ሴ'];
        $maritalStatuses = ['Single', 'Married', 'Divorced', 'Widowed'];
        $educationLevels = ['High School', 'Diploma', 'Bachelor', 'Master', 'PhD', 'Certificate', 'Other'];
        $educationTypes = ['Formal', 'Informal', 'Technical', 'Vocational', 'Religious', 'Other'];
        $religions = ['Christian', 'Muslim', 'Traditional', 'Other'];
        $ethnicities = ['Oromo', 'Amhara', 'Tigray', 'Somali', 'Gurage', 'Sidama', 'Wolayta', 'Afar', 'Other'];
        $jobLevels = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII'];
        $disabilityTypes = ['Physical', 'Visual', 'Hearing', 'Speech', 'Intellectual', 'Mental', 'None'];

        $regions = [
            'Addis Ababa',
            'Afar',
            'Amhara',
            'Benishangul-Gumuz',
            'Dire Dawa',
            'Gambela',
            'Harari',
            'Oromia',
            'Sidama',
            'Somali',
            'SNNPR',
            'Tigray',
            'South West Ethiopia Peoples',
        ];

        return view('employees.edit', compact(
            'employee',
            'genders',
            'maritalStatuses',
            'educationLevels',
            'educationTypes',
            'religions',
            'ethnicities',
            'jobLevels',
            'regions',
            'disabilityTypes'
        ));
    }

    /**
     * Update employee
     */
    public function update(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);

        // Validate request
        $validated = $request->validate([
            'file_number' => 'nullable|string|unique:employees,file_number,'.$id,
            'employee_name' => 'required|string|max:255',
            'job_title' => 'nullable|string|max:255',
            'gender' => 'nullable|string|in:ወ,ሴ',
            'job_level' => 'nullable|string|max:50',
            'ethnicity' => 'nullable|string|max:100',
            'religion' => 'nullable|string|max:100',
            'date_of_birth' => 'nullable|date',
            'hire_date' => 'nullable|date',
            'step' => 'nullable|integer|min:1|max:20',
            'salary' => 'nullable|numeric|min:0',
            'allowance' => 'nullable|numeric|min:0',
            'assignment_date' => 'nullable|date',
            'housing_allowance' => 'nullable|numeric|min:0',
            'pension_id' => 'nullable|string|max:50',
            'marital_status' => 'nullable|string|in:Single,Married,Divorced,Widowed',
            'region' => 'nullable|string|max:100',
            'zone' => 'nullable|string|max:100',
            'district' => 'nullable|string|max:100',
            'specific_location' => 'nullable|string|max:255',
            'house_number' => 'nullable|string|max:50',
            'phone_number' => 'nullable|string|max:20',
            'email' => 'nullable|email|unique:employees,email,'.$id,
            'education_type' => 'nullable|string|max:100',
            'education_level' => 'nullable|string|max:100',
            'cgpa' => 'nullable|numeric|min:0|max:4',
            'institution' => 'nullable|string|max:255',
            'graduation_date' => 'nullable|date',
            'coc_certificate' => 'nullable|boolean',
            'higher_ed_verified' => 'nullable|boolean',
            'current_job_title' => 'nullable|string|max:255',
            'current_institution' => 'nullable|string|max:255',
            'experience_from' => 'nullable|date',
            'experience_to' => 'nullable|date',
            'previous_job_title' => 'nullable|string|max:255',
            'previous_institution' => 'nullable|string|max:255',
            'previous_from' => 'nullable|date',
            'previous_to' => 'nullable|date',
            'column_40' => 'nullable|string|max:255',
            'diagnosis' => 'nullable|string',
            'disability_type' => 'nullable|string|max:255',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'document' => 'nullable|mimes:pdf,doc,docx,txt|max:5120',
        ]);

        // Handle photo upload
        if ($request->hasFile('photo')) {
            // Delete old photo
            if ($employee->photo && file_exists(public_path($employee->photo))) {
                unlink(public_path($employee->photo));
            }

            $image = $request->file('photo');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();

            // Create directory if it doesn't exist
            if (! file_exists(public_path('uploads/employees/photos'))) {
                mkdir(public_path('uploads/employees/photos'), 0777, true);
            }

            // Resize and save image
            $img = Image::make($image);
            $img->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });
            $img->save(public_path('uploads/employees/photos/'.$name_gen));

            $validated['photo'] = 'uploads/employees/photos/'.$name_gen;
        }

        // Handle document upload
        if ($request->hasFile('document')) {
            // Delete old document
            if ($employee->document && file_exists(public_path($employee->document))) {
                unlink(public_path($employee->document));
            }

            $document = $request->file('document');
            $documentName = time().'_'.$document->getClientOriginalName();

            // Create directory if it doesn't exist
            if (! file_exists(public_path('uploads/employees/documents'))) {
                mkdir(public_path('uploads/employees/documents'), 0777, true);
            }

            $document->move(public_path('uploads/employees/documents'), $documentName);
            $validated['document'] = 'uploads/employees/documents/'.$documentName;
        }

        // Set boolean fields
        $validated['coc_certificate'] = $request->has('coc_certificate');
        $validated['higher_ed_verified'] = $request->has('higher_ed_verified');

        // Update employee
        $employee->update($validated);

        return redirect()->route('employees.index')
            ->with('success', 'Employee updated successfully.');
    }

    /**
     * Delete employee (soft delete)
     */
    public function destroy($id)
    {
        $employee = Employee::findOrFail($id);
        $employee->delete();

        return redirect()->route('employees.index')
            ->with('success', 'Employee deleted successfully.');
    }

    /**
     * Restore soft-deleted employee
     */
    public function restore($id)
    {
        $employee = Employee::onlyTrashed()->findOrFail($id);
        $employee->restore();

        return redirect()->route('employees.index')
            ->with('success', 'Employee restored successfully.');
    }

    /**
     * Force delete employee (permanent)
     */
    public function forceDelete($id)
    {
        $employee = Employee::onlyTrashed()->findOrFail($id);

        // Delete files
        if ($employee->photo && file_exists(public_path($employee->photo))) {
            unlink(public_path($employee->photo));
        }
        if ($employee->document && file_exists(public_path($employee->document))) {
            unlink(public_path($employee->document));
        }

        $employee->forceDelete();

        return redirect()->route('employees.index')
            ->with('success', 'Employee permanently deleted.');
    }

    /**
     * Toggle employee status (active/inactive)
     */
    public function toggleStatus($id)
    {
        $employee = Employee::withTrashed()->findOrFail($id);

        if ($employee->trashed()) {
            $employee->restore();
            $message = 'Employee activated successfully.';
        } else {
            $employee->delete();
            $message = 'Employee deactivated successfully.';
        }

        return redirect()->route('employees.index')
            ->with('success', $message);
    }

/**
 * Print employee ID card
 */

    // ... other methods ...

  public function exportPdf($id)
{
    $employee = Employee::withTrashed()->findOrFail($id);

    $html = view('employees.pdf', compact('employee'))->render();

    $defaultConfig = (new ConfigVariables())->getDefaults();
    $fontDirs = $defaultConfig['fontDir'];

    $defaultFontConfig = (new FontVariables())->getDefaults();
    $fontData = $defaultFontConfig['fontdata'];

    $mpdf = new Mpdf([
        'mode' => 'utf-8',
        'format' => 'A4',

        'fontDir' => array_merge($fontDirs, [
            storage_path('fonts'),
        ]),

        'fontdata' => $fontData + [
            'ethiopic' => [
                'R' => 'NotoSerifEthiopic-Regular.ttf',
                'B' => 'AbyssinicaSIL-B.ttf',
            ],
        ],

        'default_font' => 'ethiopic',
    ]);

    $mpdf->WriteHTML($html);

    return $mpdf->Output('employee-profile-'.$employee->file_number.'.pdf', 'D');
}

    /**
     * Calculate experience statistics
     */
    private function calculateExperienceStats($employee)
    {
        $currentYears = 0;
        $currentMonths = 0;
        $currentDays = 0;
        $previousYears = 0;
        $previousMonths = 0;
        $previousDays = 0;

        // Calculate current experiences
        $currentExps = $employee->experiences->where('experience_type', 'current');
        foreach ($currentExps as $exp) {
            if ($exp->from_date) {
                $fromDate = Carbon::parse($exp->from_date);
                $toDate = $exp->to_date ? Carbon::parse($exp->to_date) : Carbon::now();

                $diff = $fromDate->diff($toDate);
                $currentYears += $diff->y;
                $currentMonths += $diff->m;
                $currentDays += $diff->d;
            }
        }

        // Calculate previous experiences
        $previousExps = $employee->experiences->where('experience_type', 'previous');
        foreach ($previousExps as $exp) {
            if ($exp->from_date && $exp->to_date) {
                $fromDate = Carbon::parse($exp->from_date);
                $toDate = Carbon::parse($exp->to_date);

                $diff = $fromDate->diff($toDate);
                $previousYears += $diff->y;
                $previousMonths += $diff->m;
                $previousDays += $diff->d;
            }
        }

        // Calculate total
        $totalYears = $currentYears + $previousYears;
        $totalMonths = $currentMonths + $previousMonths;
        $totalDays = $currentDays + $previousDays;

        // Normalize days to months (30 days per month)
        if ($totalDays >= 30) {
            $totalMonths += floor($totalDays / 30);
            $totalDays = $totalDays % 30;
        }

        // Normalize months to years
        if ($totalMonths >= 12) {
            $totalYears += floor($totalMonths / 12);
            $totalMonths = $totalMonths % 12;
        }

        return [
            'current' => [
                'years' => $currentYears,
                'months' => $currentMonths,
                'days' => $currentDays,
            ],
            'previous' => [
                'years' => $previousYears,
                'months' => $previousMonths,
                'days' => $previousDays,
            ],
            'total' => [
                'years' => $totalYears,
                'months' => $totalMonths,
                'days' => $totalDays,
            ]
        ];
    }


public function printCard($id)
{
    $employee = Employee::withTrashed()->findOrFail($id);

    $data = [
        'employee' => $employee,
        'title' => 'የሠራተኛ የግል ሁኔታ መግለጫ',
        'date' => now()->format('d/m/Y'),
    ];

    $pdf = Pdf::loadView('employees.pdf-card', $data);
    $pdf->setPaper([0, 0, 350, 600], 'portrait'); // Custom card size

    return $pdf->stream('employee-card-'.$employee->file_number.'.pdf');
}

    /**
     * Show profile view
     */
    public function profile($id)
    {
        $employee = Employee::withTrashed()->findOrFail($id);

        return view('employees.profile', compact('employee'));
    }

    /**
     * Search employees (AJAX)
     */
    public function search(Request $request)
    {
        $search = $request->get('q');

        $employees = Employee::where('employee_name', 'LIKE', "%{$search}%")
            ->orWhere('file_number', 'LIKE', "%{$search}%")
            ->orWhere('email', 'LIKE', "%{$search}%")
            ->orWhere('phone_number', 'LIKE', "%{$search}%")
            ->select('id', 'employee_name as text', 'file_number', 'job_title', 'email')
            ->limit(10)
            ->get();

        return response()->json($employees);
    }

    /**
     * Get employees by region (AJAX)
     */
    public function getByRegion($region)
    {
        $employees = Employee::where('region', $region)
            ->whereNull('deleted_at')
            ->select('id', 'employee_name', 'file_number', 'job_title')
            ->get();

        return response()->json($employees);
    }

    /**
     * Check if file number exists (AJAX)
     */
    public function checkFileNumber(Request $request)
    {
        $exists = Employee::where('file_number', $request->file_number)
            ->when($request->id, function ($query, $id) {
                return $query->where('id', '!=', $id);
            })
            ->exists();

        return response()->json(['exists' => $exists]);
    }

    /**
     * Check if email exists (AJAX)
     */
    public function checkEmail(Request $request)
    {
        $exists = Employee::where('email', $request->email)
            ->when($request->id, function ($query, $id) {
                return $query->where('id', '!=', $id);
            })
            ->exists();

        return response()->json(['exists' => $exists]);
    }

    /**
     * Bulk delete employees
     */
    public function bulkDelete(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:employees,id',
        ]);

        Employee::whereIn('id', $request->ids)->delete();

        return redirect()->route('employees.index')
            ->with('success', count($request->ids).' employees deleted successfully.');
    }

    /**
     * Bulk restore employees
     */
    public function bulkRestore(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:employees,id',
        ]);

        Employee::onlyTrashed()->whereIn('id', $request->ids)->restore();

        return redirect()->route('employees.index')
            ->with('success', count($request->ids).' employees restored successfully.');
    }

    /**
     * Export employees to CSV
     */
    public function exportCsv(Request $request)
    {
        $query = Employee::query();

        // Apply filters
        if ($request->filled('job_title')) {
            $query->where('job_title', 'LIKE', "%{$request->job_title}%");
        }
        if ($request->filled('region')) {
            $query->where('region', $request->region);
        }
        if ($request->filled('gender')) {
            $query->where('gender', $request->gender);
        }

        $employees = $query->get();

        $filename = 'employees_'.date('Y-m-d').'.csv';
        $handle = fopen('php://output', 'w');

        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="'.$filename.'"');

        // Add headers
        fputcsv($handle, [
            'ID', 'File Number', 'Name', 'Job Title', 'Gender', 'Age',
            'Hire Date', 'Salary', 'Phone', 'Email', 'Region', 'District',
            'Education Level', 'Status',
        ]);

        // Add data
        foreach ($employees as $employee) {
            fputcsv($handle, [
                $employee->id,
                $employee->file_number,
                $employee->employee_name,
                $employee->job_title,
                $employee->gender,
                $employee->age,
                $employee->hire_date ? $employee->hire_date->format('Y-m-d') : '',
                $employee->salary,
                $employee->phone_number,
                $employee->email,
                $employee->region,
                $employee->district,
                $employee->education_level,
                $employee->trashed() ? 'Inactive' : 'Active',
            ]);
        }

        fclose($handle);
        exit;
    }

     public function export($zone)
     {
         $date = date('d-m-y');

       if ($zone == 'employees') {
            $name = 'Rename it';
        };

          $reports = DB::table($zone)->select('file_number',
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

                 // File Uploads
                 )
             ->get();
         $id = 1;
         foreach ($reports as $report) {
             $report->id = $id++;
         }

         return (new EmployeeExport($reports))->download('Name you excel'.$date.'.xlsx');
     }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xls,xlsx,csv|max:2048',
        ]);

        // Check if file was uploaded
        if (! $request->hasFile('file')) {
            return redirect()->back()->with('error', 'Please select a file to upload.');
        }

        try {
            // Get max ID or start from 1
            $maxId = Employee::max('id') ?? 0;
            $newId = $maxId + 1;

            // Create import instance
            $import = new EmployeesImport($newId);

            // Import the file
            Excel::import($import, $request->file('file'));

            // Prepare response messages
            $importedCount = $import->successCount;
            $errorCount = count($import->errors);

            if ($errorCount > 0 && $importedCount > 0) {
                // Partial success - some rows imported, some failed
                $message = "Imported {$importedCount} record(s) successfully, but {$errorCount} error(s) occurred.";

                // Store errors in session
                $request->session()->flash('import_errors', $import->errors);

                return redirect()->route('employees.index')
                    ->with('warning', $message)
                    ->with('imported_count', $importedCount);
            } elseif ($errorCount > 0 && $importedCount == 0) {
                // Complete failure
                $message = "Import failed with {$errorCount} error(s). No records were imported.";

                $request->session()->flash('import_errors', $import->errors);

                return redirect()->route('employees.index')
                    ->with('error', $message);
            } elseif ($importedCount > 0) {
                // Complete success
                $message = "Successfully imported {$importedCount} record(s)!";

                return redirect()->route('employees.index')
                    ->with('success', $message)
                    ->with('imported_count', $importedCount);
            } else {
                // No data found
                return redirect()->route('employees.index')
                    ->with('info', 'No valid data found in the file. Please check the file format.');
            }
        } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
            // Handle Laravel Excel validation errors
            $failures = $e->failures();
            $errors = [];

            foreach ($failures as $failure) {
                $errors[] = "Row {$failure->row()}, Column '{$failure->attribute()}': {$failure->errors()[0]}";
            }

            $request->session()->flash('import_errors', $errors);

            return redirect()->route('employees.index')
                ->with('error', 'Validation failed. Please check your data.');
        } catch (\Exception $e) {
            // Handle all other exceptions
            Log::error('Import error: '.$e->getMessage());

            // Check for common date errors
            $errorMessage = $e->getMessage();
            if (strpos($errorMessage, 'date') !== false ||
                strpos($errorMessage, 'datetime') !== false ||
                strpos($errorMessage, 'joined_date') !== false) {
                return redirect()->route('employees.index')
                    ->with('error', 'Date format error: '.$errorMessage.
                           '. Please ensure dates are in a recognizable format (YYYY-MM-DD, DD/MM/YYYY, etc.)');
            }

            return redirect()->route('employees.index')
                ->with('error', 'Import failed: '.$errorMessage);
        }
    }
}
