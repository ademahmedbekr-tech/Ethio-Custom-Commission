<?php

namespace App\Http\Controllers\Branches;

use App\Http\Controllers\Controller;
use App\Imports\JigjigaImport;
use App\Models\Jigjiga;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Mpdf\Mpdf;
use Mpdf\Config\ConfigVariables;
use Mpdf\Config\FontVariables;
      use Carbon\Carbon;


use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Facades\Excel;

class KombolchaController extends Controller
{
    /**
     * Dashboard/Summary page
     */
    public function dashboard()
    {
        $name = 'Jigjiga Dashboard';

        // Statistics
        $totalEmployees = Jigjiga::count();
        $activeEmployees = Jigjiga::whereNull('deleted_at')->count();
        $inactiveEmployees = Jigjiga::onlyTrashed()->count();

        // Statistics by job position
        $jobStats = Jigjiga::select('job_title', DB::raw('count(*) as total'))
            ->whereNotNull('job_title')
            ->whereNull('deleted_at')
            ->groupBy('job_title')
            ->orderBy('total', 'desc')
            ->limit(10)
            ->get();

        // Statistics by gender
        $genderStats = Jigjiga::select('gender', DB::raw('count(*) as total'))
            ->whereNotNull('gender')
            ->whereNull('deleted_at')
            ->groupBy('gender')
            ->get();

        // Statistics by education level
        $educationStats = Jigjiga::select('education_level', DB::raw('count(*) as total'))
            ->whereNotNull('education_level')
            ->whereNull('deleted_at')
            ->groupBy('education_level')
            ->get();

        // Statistics by region
        $regionStats = Jigjiga::select('region', DB::raw('count(*) as total'))
            ->whereNotNull('region')
            ->whereNull('deleted_at')
            ->groupBy('region')
            ->orderBy('total', 'desc')
            ->limit(10)
            ->get();

        // Recent employees
        $recentEmployees = Jigjiga::latest()->take(5)->get();

        // Salary statistics
        $avgSalary = Jigjiga::whereNull('deleted_at')->avg('salary');
        $totalPayroll = Jigjiga::whereNull('deleted_at')->sum(DB::raw('COALESCE(salary, 0) + COALESCE(allowance, 0) + COALESCE(housing_allowance, 0)'));

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
    $count = Jigjiga::count();


        // Filter parameters
        $jobTitle = $request->job_title;
        $region = $request->region;
        $gender = $request->gender;
        $educationLevel = $request->education_level;
        $status = $request->status; // active, inactive, all

        // Get distinct values for filters
        $jobTitles = Jigjiga::select('job_title')
            ->distinct()
            ->whereNotNull('job_title')
            ->orderBy('job_title', 'ASC')
            ->pluck('job_title');

        $regions = Jigjiga::select('region')
            ->distinct()
            ->whereNotNull('region')
            ->orderBy('region', 'ASC')
            ->pluck('region');

        $educationLevels = Jigjiga::select('education_level')
            ->distinct()
            ->whereNotNull('education_level')
            ->orderBy('education_level', 'ASC')
            ->pluck('education_level');

        // Base query
        if ($status === 'inactive') {
            $query = Jigjiga::onlyTrashed();
        } elseif ($status === 'all') {
            $query = Jigjiga::withTrashed();
        } else {
            $query = Jigjiga::query(); // active only (default)
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
        $employees = $query->orderBy('created_at', 'desc')->paginate(15)->withQueryString();

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
        $totalCount = Jigjiga::count();
          $regionCount = Jigjiga::select('region')
        ->distinct()
        ->orderBy('region', 'ASC')
        ->pluck('region');
        $maleCount = Jigjiga::where('gender', 'ወ')->count();
        $femaleCount = Jigjiga::where('gender', 'ሴ')->count();
        $withDisability = Jigjiga::whereNotNull('disability_type')->count();
        $rcount = Jigjiga::select('region', DB::raw('count(*) as total'))->groupBy('region')->pluck('total', 'region')->toArray();


        return view('branches.jigjiga.index', compact(
            'employees',
            'name',
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
            'South West Ethiopia Peoples'
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
     * Store new Jigjiga
     */
    public function store(Request $request)
    {
        // Validate request
        $validated = $request->validate([
            // Required fields
            'file_number' => 'nullable|string|unique:employees,file_number',
            'Jigjiga_name' => 'required|string|max:255',

            // Jigjiga Information
            'job_title' => 'nullable|string|max:255',
            'gender' => 'nullable|string|in:ወ,ሴ',
            'job_level' => 'nullable|string|max:50',
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
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();

            // Create directory if it doesn't exist
            if (!file_exists(public_path('uploads/employees/photos'))) {
                mkdir(public_path('uploads/employees/photos'), 0777, true);
            }

            // Resize and save image
            $img = Image::make($image);
            $img->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });
            $img->save(public_path('uploads/employees/photos/' . $name_gen));

            $validated['photo'] = 'uploads/employees/photos/' . $name_gen;
        }

        // Handle document upload
        if ($request->hasFile('document')) {
            $document = $request->file('document');
            $documentName = time() . '_' . $document->getClientOriginalName();

            // Create directory if it doesn't exist
            if (!file_exists(public_path('uploads/employees/documents'))) {
                mkdir(public_path('uploads/employees/documents'), 0777, true);
            }

            $document->move(public_path('uploads/employees/documents'), $documentName);
            $validated['document'] = 'uploads/employees/documents/' . $documentName;
        }

        // Set boolean fields
        $validated['coc_certificate'] = $request->has('coc_certificate');
        $validated['higher_ed_verified'] = $request->has('higher_ed_verified');

        // Create Jigjiga
        $Jigjiga = Jigjiga::create($validated);

        return redirect()->route('jigjiga.index')
            ->with('success', 'Jigjiga created successfully.');
    }

    /**
     * Display Jigjiga details
     */
    public function show($id)
    {
        $Jigjiga = Jigjiga::withTrashed()->findOrFail($id);

        return view('employees.show', compact('Jigjiga'));
    }

    /**
     * Show edit form
     */
    public function edit($id)
    {
        $Jigjiga = Jigjiga::findOrFail($id);

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
            'South West Ethiopia Peoples'
        ];

        return view('employees.edit', compact(
            'Jigjiga',
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
     * Update Jigjiga
     */
    public function update(Request $request, $id)
    {
        $Jigjiga = Jigjiga::findOrFail($id);

        // Validate request
        $validated = $request->validate([
            'file_number' => 'nullable|string|unique:employees,file_number,' . $id,
            'Jigjiga_name' => 'required|string|max:255',
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
            'email' => 'nullable|email|unique:employees,email,' . $id,
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
            if ($Jigjiga->photo && file_exists(public_path($Jigjiga->photo))) {
                unlink(public_path($Jigjiga->photo));
            }

            $image = $request->file('photo');
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();

            // Create directory if it doesn't exist
            if (!file_exists(public_path('uploads/employees/photos'))) {
                mkdir(public_path('uploads/employees/photos'), 0777, true);
            }

            // Resize and save image
            $img = Image::make($image);
            $img->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });
            $img->save(public_path('uploads/employees/photos/' . $name_gen));

            $validated['photo'] = 'uploads/employees/photos/' . $name_gen;
        }

        // Handle document upload
        if ($request->hasFile('document')) {
            // Delete old document
            if ($Jigjiga->document && file_exists(public_path($Jigjiga->document))) {
                unlink(public_path($Jigjiga->document));
            }

            $document = $request->file('document');
            $documentName = time() . '_' . $document->getClientOriginalName();

            // Create directory if it doesn't exist
            if (!file_exists(public_path('uploads/employees/documents'))) {
                mkdir(public_path('uploads/employees/documents'), 0777, true);
            }

            $document->move(public_path('uploads/employees/documents'), $documentName);
            $validated['document'] = 'uploads/employees/documents/' . $documentName;
        }

        // Set boolean fields
        $validated['coc_certificate'] = $request->has('coc_certificate');
        $validated['higher_ed_verified'] = $request->has('higher_ed_verified');

        // Update Jigjiga
        $Jigjiga->update($validated);

        return redirect()->route('jigjiga.index')
            ->with('success', 'Jigjiga updated successfully.');
    }

    /**
     * Delete Jigjiga (soft delete)
     */
    public function destroy($id)
    {
        $Jigjiga = Jigjiga::findOrFail($id);
        $Jigjiga->delete();

        return redirect()->route('jigjiga.index')
            ->with('success', 'Jigjiga deleted successfully.');
    }

    /**
     * Restore soft-deleted Jigjiga
     */
    public function restore($id)
    {
        $Jigjiga = Jigjiga::onlyTrashed()->findOrFail($id);
        $Jigjiga->restore();

        return redirect()->route('jigjiga.index')
            ->with('success', 'Jigjiga restored successfully.');
    }

    /**
     * Force delete Jigjiga (permanent)
     */
    public function forceDelete($id)
    {
        $Jigjiga = Jigjiga::onlyTrashed()->findOrFail($id);

        // Delete files
        if ($Jigjiga->photo && file_exists(public_path($Jigjiga->photo))) {
            unlink(public_path($Jigjiga->photo));
        }
        if ($Jigjiga->document && file_exists(public_path($Jigjiga->document))) {
            unlink(public_path($Jigjiga->document));
        }

        $Jigjiga->forceDelete();

        return redirect()->route('jigjiga.index')
            ->with('success', 'Jigjiga permanently deleted.');
    }

    /**
     * Toggle Jigjiga status (active/inactive)
     */
    public function toggleStatus($id)
    {
        $Jigjiga = Jigjiga::withTrashed()->findOrFail($id);

        if ($Jigjiga->trashed()) {
            $Jigjiga->restore();
            $message = 'Jigjiga activated successfully.';
        } else {
            $Jigjiga->delete();
            $message = 'Jigjiga deactivated successfully.';
        }

        return redirect()->route('jigjiga.index')
            ->with('success', $message);
    }

    /**
     * Print Jigjiga ID card
     */





public function exportPdf($id)
{
    $Jigjiga = Jigjiga::withTrashed()->findOrFail($id);

    $html = view('employees.pdf', compact('Jigjiga'))->render();

    $defaultConfig = (new ConfigVariables())->getDefaults();
    $fontDirs = $defaultConfig['fontDir'];

    $defaultFontConfig = (new FontVariables())->getDefaults();
    $fontData = $defaultFontConfig['fontdata'];

    $mpdf = new Mpdf([
        'mode' => 'utf-8',
        'format' => 'A4',

        'fontDir' => array_merge($fontDirs, [
            storage_path('fonts')
        ]),

        'fontdata' => $fontData + [
            'ethiopic' => [
                'R' => 'NotoSerifEthiopic-Regular.ttf',
                'B' => 'AbyssinicaSIL-B.ttf',
            ]
        ],

        'default_font' => 'ethiopic'
    ]);

    $mpdf->WriteHTML($html);

    return $mpdf->Output('Jigjiga-profile-'.$Jigjiga->file_number.'.pdf', 'D');
}






public function printCard($id)
{
    $Jigjiga = Jigjiga::withTrashed()->findOrFail($id);

    $data = [
        'Jigjiga' => $Jigjiga,
        'title' => 'የሠራተኛ የግል ሁኔታ መግለጫ',
        'date' => now()->format('d/m/Y')
    ];

    $pdf = Pdf::loadView('employees.pdf-card', $data);
    $pdf->setPaper([0, 0, 350, 600], 'portrait'); // Custom card size

    return $pdf->stream('Jigjiga-card-'.$Jigjiga->file_number.'.pdf');
}

    /**
     * Show profile view
     */
    public function profile($id)
    {
        $Jigjiga = Jigjiga::withTrashed()->findOrFail($id);

        return view('employees.profile', compact('Jigjiga'));
    }

    /**
     * Search employees (AJAX)
     */
    public function search(Request $request)
    {
        $search = $request->get('q');

        $employees = Jigjiga::where('Jigjiga_name', 'LIKE', "%{$search}%")
            ->orWhere('file_number', 'LIKE', "%{$search}%")
            ->orWhere('email', 'LIKE', "%{$search}%")
            ->orWhere('phone_number', 'LIKE', "%{$search}%")
            ->select('id', 'Jigjiga_name as text', 'file_number', 'job_title', 'email')
            ->limit(10)
            ->get();

        return response()->json($employees);
    }

    /**
     * Get employees by region (AJAX)
     */
    public function getByRegion($region)
    {
        $employees = Jigjiga::where('region', $region)
            ->whereNull('deleted_at')
            ->select('id', 'Jigjiga_name', 'file_number', 'job_title')
            ->get();

        return response()->json($employees);
    }

    /**
     * Check if file number exists (AJAX)
     */
    public function checkFileNumber(Request $request)
    {
        $exists = Jigjiga::where('file_number', $request->file_number)
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
        $exists = Jigjiga::where('email', $request->email)
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
            'ids.*' => 'exists:employees,id'
        ]);

        Jigjiga::whereIn('id', $request->ids)->delete();

        return redirect()->route('jigjiga.index')
            ->with('success', count($request->ids) . ' employees deleted successfully.');
    }

    /**
     * Bulk restore employees
     */
    public function bulkRestore(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:employees,id'
        ]);

        Jigjiga::onlyTrashed()->whereIn('id', $request->ids)->restore();

        return redirect()->route('jigjiga.index')
            ->with('success', count($request->ids) . ' employees restored successfully.');
    }

    /**
     * Export employees to CSV
     */
    public function exportCsv(Request $request)
    {
        $query = Jigjiga::query();

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

        $filename = 'employees_' . date('Y-m-d') . '.csv';
        $handle = fopen('php://output', 'w');

        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="' . $filename . '"');

        // Add headers
        fputcsv($handle, [
            'ID', 'File Number', 'Name', 'Job Title', 'Gender', 'Age',
            'Hire Date', 'Salary', 'Phone', 'Email', 'Region', 'District',
            'Education Level', 'Status'
        ]);

        // Add data
        foreach ($employees as $Jigjiga) {
            fputcsv($handle, [
                $Jigjiga->id,
                $Jigjiga->file_number,
                $Jigjiga->Jigjiga_name,
                $Jigjiga->job_title,
                $Jigjiga->gender,
                $Jigjiga->age,
                $Jigjiga->hire_date ? $Jigjiga->hire_date->format('Y-m-d') : '',
                $Jigjiga->salary,
                $Jigjiga->phone_number,
                $Jigjiga->email,
                $Jigjiga->region,
                $Jigjiga->district,
                $Jigjiga->education_level,
                $Jigjiga->trashed() ? 'Inactive' : 'Active'
            ]);
        }

        fclose($handle);
        exit;
    }
    public function import(Request $request)
{
    $request->validate([
        'file' => 'required|mimes:xls,xlsx,csv|max:2048'
    ]);

    // Check if file was uploaded
    if (!$request->hasFile('file')) {
        return redirect()->back()->with('error', 'Please select a file to upload.');
    }

    try {
        // Get max ID or start from 1
        $maxId = Jigjiga::max('id') ?? 0;
        $newId = $maxId + 1;

        // Create import instance
        $import = new JigjigaImport($newId);


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

            return redirect()->route('jigjiga.index')
                ->with('warning', $message)
                ->with('imported_count', $importedCount);

        } elseif ($errorCount > 0 && $importedCount == 0) {
            // Complete failure
            $message = "Import failed with {$errorCount} error(s). No records were imported.";

            $request->session()->flash('import_errors', $import->errors);

            return redirect()->route('jigjiga.index')
                ->with('error', $message);

        } elseif ($importedCount > 0) {
            // Complete success
            $message = "Successfully imported {$importedCount} record(s)!";

            return redirect()->route('jigjiga.index')
                ->with('success', $message)
                ->with('imported_count', $importedCount);

        } else {
            // No data found
            return redirect()->route('jigjiga.index')
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

        return redirect()->route('jigjiga.index')
            ->with('error', 'Validation failed. Please check your data.');

    } catch (\Exception $e) {
        // Handle all other exceptions
        Log::error('Import error: ' . $e->getMessage());

        // Check for common date errors
        $errorMessage = $e->getMessage();
        if (strpos($errorMessage, 'date') !== false ||
            strpos($errorMessage, 'datetime') !== false ||
            strpos($errorMessage, 'joined_date') !== false) {

            return redirect()->route('jigjiga.index')
                ->with('error', 'Date format error: ' . $errorMessage .
                       '. Please ensure dates are in a recognizable format (YYYY-MM-DD, DD/MM/YYYY, etc.)');
        }


        return redirect()->route('jigjiga.index')
            ->with('error', 'Import failed: ' . $errorMessage);
    }



}
}
