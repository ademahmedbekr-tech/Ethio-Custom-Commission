<?php

namespace App\Http\Controllers;

// use App\Models\Branch as ModelsBranch;

use App\Models\Branch;
use App\Models\Department;
use App\Models\Directorate;
use Illuminate\Http\Request;
// Branch
class DepartmentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('permission:position-list|position-create|position-edit|position-delete', ['only' => ['index', 'store']]);

        $this->middleware('permission:position-create', ['only' => ['create', 'store']]);

        $this->middleware('permission:position-edit', ['only' => ['edit', 'update']]);

        $this->middleware('permission:position-delete', ['only' => ['destroy']]);
    }

    public function index()
    {
        $departments = Department::with('directorate', 'branch')
            ->latest()
            ->paginate(7);

        return view('departments.index', compact('departments'));
    }

    // app/Http/Controllers/DepartmentController.php

    public function getDirectoratesByBranch(Request $request)
    {
        // Fetches directorates that belong to the selected branch ID
        // $directorates = Directorate::where('branch_id', $branchId)
        $directorates = Directorate::where('branch_id', $request->branch_id)->get();

        return response()->json($directorates);
    }

    public function create()
    {
        $directorates = Directorate::with('branch')->get();
        $branch = Branch::get();

        return view('departments.create', compact('directorates', 'branch'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'directorate_id' => 'required|exists:directorates,id',
            'branch_id' => 'required',
            'name' => 'required|string|max:255',
            'capacity' => 'required',
            'description' => 'nullable|string',
            'is_active' => 'nullable|boolean',
        ]);

        Department::create($validated);

        return redirect()->route('departments.index')
            ->with('success', 'Department created successfully');
    }

    public function show($id)
    {
        $department = Department::with('directorate.branch')->findOrFail($id);

        return view('departments.show', compact('department'));
    }

    public function edit($id)
    {
        $department = Department::findOrFail($id);
        $directorates = Directorate::all();
        $branch = Branch::get();
        $directorates = Directorate::where('branch_id', $department->branch_id)->get();

        return view('departments.edit', compact('department', 'directorates', 'branch'));
    }

    public function update(Request $request, $id)
    {
        $department = Department::findOrFail($id);

        $validated = $request->validate([
            'directorate_id' => 'required|exists:directorates,id',
            'name' => 'required|string|max:255',
            'capacity' => 'required',
            'description' => 'nullable|string',
            'is_active' => 'nullable|boolean',
            'branch_id' => 'required',
        ]);

        $department->update($validated);

        return redirect()->route('departments.index')
            ->with('success', 'Department updated successfully');
    }

    public function destroy($id)
    {
        Department::findOrFail($id)->delete();

        return redirect()->route('departments.index')
            ->with('success', 'Department deleted successfully');
    }
}
