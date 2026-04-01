<?php

namespace App\Http\Controllers;

use App\Exports\ZoneExportController;
use App\Models\Zone1;
use App\Imports\Zone1Import;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;




class Zone1Controller extends Controller
{

    public function first()
    {
        $city = 'zone1s';
        $name = 'Arsii';
        $reports = DB::table($city)
            ->select('position', DB::raw('count(*) as total'))
            ->groupBy('position')
            ->get();
        $id = 1;
        foreach ($reports as $report) {
            $report->id = $id++;
            $report->city = $name;
            $report->position = $report->position;
            $report->total = $report->total;
        }

        return view('zones.zone1.index', compact('reports', 'name', 'city'));
    }
    public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('permission:zone1-list|zone1-create|zone1-edit|zone1-delete', ['only' => ['index', 'store']]);

        $this->middleware('permission:zone1-create', ['only' => ['create', 'store']]);

        $this->middleware('permission:zone1-edit', ['only' => ['edit', 'update']]);

        $this->middleware('permission:zone1-delete', ['only' => ['destroy']]);
    }

public function index(Request $request)
{
    $zone   = 'zone1s';
    $name   = 'Arsii';
    $export = true;
    $woreda = $request->woreda;

    /*
    |--------------------------------------------------------------------------
    | DELETE EXACTLY ONE DUPLICATE PER member_id
    | WARNING: runs on every page load
    |--------------------------------------------------------------------------
    */
    $duplicateMemberIds = Zone1::select('member_id')
        ->groupBy('member_id')
        ->havingRaw('COUNT(*) > 1')
        ->pluck('member_id');

    foreach ($duplicateMemberIds as $memberId) {
        Zone1::where('member_id', $memberId)
            ->orderBy('id', 'DESC') // deletes newest (ASC = delete oldest)
            ->limit(1)
            ->delete();
    }

    // Total count AFTER cleanup
    $count = Zone1::count();

    // Get distinct woredas (FIXED orderBy)
    $woredas = DB::table($zone)
        ->select('woreda')
        ->distinct()
        ->orderBy('woreda', 'ASC')
        ->pluck('woreda');

    // Base query
    $query = Zone1::query();

    if ($woreda) {
        $query->where('woreda', $woreda);
    }

    // Pagination
    $reports = $query->paginate(10);

    // Get paid members ONCE (PERFORMANCE FIX)
    $paidMembers = DB::table('zone_member_pays')
        ->where('model', 'zone1')
        ->whereMonth('date', now()->month)
        ->whereYear('date', now()->year)
        ->pluck('member_id')
        ->toArray();

    // Add computed fields
    $reports->getCollection()->transform(function ($item, $key) use ($reports, $paidMembers) {
        $item->row_id = ($reports->currentPage() - 1) * $reports->perPage() + $key + 1;
        $item->has_paid = in_array($item->id, $paidMembers);
        return $item;
    });

    // Remaining duplicates count
    $userDuplicates = Zone1::select('member_id')
        ->groupBy('member_id')
        ->havingRaw('COUNT(*) > 1')
        ->count();
        $woredaCounts = Zone1::select('woreda', DB::raw('count(*) as total'))->groupBy('woreda')->pluck('total', 'woreda')->toArray();
    $woredacount = Zone1::distinct('woreda')->count('woreda');

    return view(
        'zones.zone1.index',
        compact(
            'reports',
            'name',
            'zone',
            'woreda',
            'export',
            'woredas',
            'count',
            'woredaCounts',
            'userDuplicates',
            'woredacount'
        )
    );
}




    public function create()
    {
        $woredas = [
            'Aminyaa',
            'Asakoo',
            'Asallaa',
            'Balee Gasgaar',
            'Boqojjii',
            'Collee',
            'D/Xiijoo',
            'Diksiis',
            'Doddotaa',
            'Gololchaa',
            'Gunaa',
            'Heexosaa',
            'H/Waabee',
            'Jajuu',
            'L/Bilbiloo',
            'L/Heexosaa',
            'Martii',
            'Muunessaa',
            'Roobee',
            'Seeruu',
            'Shanan Kooluu',
            'Siirkaa',
            'Siree',
            'Suudee',
            'Xichoo',
            'Xiyoo',
            'Z/Dugdaa',

        ];

        $options = [];
        foreach ($woredas as $woreda) {
            $options[] = ['id' => $woreda, 'text' => $woreda];
        }

        $jsonOptions = json_encode($options);

        return view('zones.zone1.create', compact('jsonOptions'));
    }

    public function store(Request $request)
    {

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
            Image::make($image)->save('Photo/' . $name_gen);

            $last_thumb = 'Photo/' . $name_gen;
        } else {
            $last_thumb = null;
        }

        if ($request->hasFile('document')) {
            $document = $request->file('document');
            $documentname = time() . '.' . $document->getClientOriginalExtension();
            $document->move(public_path('/Document'), $documentname);
        } else {
            $documentname = 'default.pdf';
        }

        $validated = $request->validate([
            'first_name' => 'required|string',
            'middle_name' => 'nullable|string',
            'last_name' => 'required|string',
            'gender' => 'required|string',
            'age' => 'required|integer',
            'education_level' => 'required|string',
            'address' => 'nullable|string',
            'contact_number' => 'nullable|numeric|digits_between:9,14',
            'woreda' => 'nullable|string',
            'email' => 'nullable|email|unique:zone1s',
            'position' => 'nullable|string',
            'joined_date' => 'nullable|string',
            'membership_type' => 'nullable|string',
            'membership_fee' => 'nullable|integer',

        ]);

        $zone1 = Zone1::create($validated);

        return redirect()->route('zone1.index')->with('success', 'Zone1 Created successfully');
    }

    public function show($id)
    {
        $zone1 = Zone1::findOrFail($id);
    }

    public function edit($id)
    {
        $zone1 = Zone1::findOrFail($id);

        return view('zones.zone1.edit', compact('zone1'));
    }

    public function update(Request $request, $id)
    {
        $zone1 = Zone1::findOrFail($id);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
            Image::make($image)->save('Photo/' . $name_gen);

            $last_thumb = 'Photo/' . $name_gen;
        } else {
            $last_thumb = $zone1->image;
        }

        if ($request->hasFile('document')) {
            $document = $request->file('document');
            $documentname = time() . '.' . $document->getClientOriginalExtension();
            $document->move(public_path('/Document'), $documentname);
        } else {
            $documentname = $zone1->document;
        }

        $validated = $request->validate([
            'first_name' => 'required|string',
            'middle_name' => 'nullable|string',
            'last_name' => 'required|string',
            'gender' => 'required|string',
            'age' => 'required|integer',
            'education_level' => 'required|string',
            'address' => 'nullable|string',
            'contact_number' => 'nullable|numeric|digits_between:9,14',
            'woreda' => 'nullable|string',
            'email' => 'nullable|email|unique:zone1s',
            'position' => 'nullable|string',
            'membership_type' => 'nullable|string',
            'membership_fee' => 'nullable|integer',

        ]);


        $zone1->update($validated);

        return redirect()->route('zone1.index')->with('update', 'Zone1 Updated successfully');
    }

    public function destroy($id)
    {
        $zone1 = Zone1::findOrFail($id);
        $zone1->delete();

        return redirect()->route('zone1.index')->with('delete', 'Zone1 Deleted successfully');
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
        $maxId = Zone1::max('id') ?? 0;
        $newId = $maxId + 1;

        // Create import instance
        $import = new Zone1Import($newId);

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

            return redirect()->route('zone1.index')
                ->with('warning', $message)
                ->with('imported_count', $importedCount);

        } elseif ($errorCount > 0 && $importedCount == 0) {
            // Complete failure
            $message = "Import failed with {$errorCount} error(s). No records were imported.";

            $request->session()->flash('import_errors', $import->errors);

            return redirect()->route('zone1.index')
                ->with('error', $message);

        } elseif ($importedCount > 0) {
            // Complete success
            $message = "Successfully imported {$importedCount} record(s)!";

            return redirect()->route('zone1.index')
                ->with('success', $message)
                ->with('imported_count', $importedCount);

        } else {
            // No data found
            return redirect()->route('zone1.index')
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

        return redirect()->route('zone1.index')
            ->with('error', 'Validation failed. Please check your data.');

    } catch (\Exception $e) {
        // Handle all other exceptions
        Log::error('Import error: ' . $e->getMessage());

        // Check for common date errors
        $errorMessage = $e->getMessage();
        if (strpos($errorMessage, 'date') !== false ||
            strpos($errorMessage, 'datetime') !== false ||
            strpos($errorMessage, 'joined_date') !== false) {

            return redirect()->route('zone1.index')
                ->with('error', 'Date format error: ' . $errorMessage .
                       '. Please ensure dates are in a recognizable format (YYYY-MM-DD, DD/MM/YYYY, etc.)');
        }

        return redirect()->route('zone1.index')
            ->with('error', 'Import failed: ' . $errorMessage);
    }



}
    public function pay($id)
    {
        $member = Zone1::findOrFail($id);
        $model = "zone1";
        return view('zones.zoneMemberPay.create', compact('member', 'model'));
    }

       public function export($zone)
    {
        $date = date('d-m-y');

        if ($zone == 'zone1s') {
            $name = 'Rename it';
        };

        $reports =
            DB::table($zone)
            ->select('id','member_id',
        'first_name',
        'middle_name',
        'last_name',
        'gender',
        'age',
        'education_level',
        'address',
        'contact_number',
        'woreda',
        'email',
        'position',
        'joined_date',
        'membership_type',
        'membership_fee', DB::raw('count(*) as total'))
            ->groupBy(
                'id',
        'member_id',
        'first_name',
        'middle_name',
        'last_name',
        'gender',
        'age',
        'education_level',
        'address',
        'contact_number',
        'woreda',
        'email',
        'position',
        'joined_date',
        'membership_type',
        'membership_fee',)
            ->get();
        $id = 1;
        foreach ($reports as $report) {
            $report->id = $id++;
            $report->zone = $name;
            $report->woreda = $report->woreda;
            $report->position = $report->position;
            $report->total = $report->total;
        }



        return (new ZoneExportController($reports))->download("Name you excel" . $date . ".xlsx");
    }
}
