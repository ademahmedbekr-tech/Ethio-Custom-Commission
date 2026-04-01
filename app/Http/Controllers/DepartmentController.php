<?php
namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
  public function index()
{
    $departments = Department::latest()->paginate(7);

    // Statistics for dashboard cards
    $totalDepartments = Department::count();
    $departmentsWithHeads = Department::whereNotNull('head_id')->count();
    $departmentsWithoutHeads = Department::whereNull('head_id')->count();
    $recentDepartments = Department::whereMonth('created_at', now()->month)->count();

    return view('departments.index', compact(
        'departments',
        'totalDepartments',
        'departmentsWithHeads',
        'departmentsWithoutHeads',
        'recentDepartments'
    ));
}

    public function create()
    {
        return view('departments.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:departments,code',
        ]);

        Department::create($request->all());

        return redirect()->route('departments.index')
            ->with('success', 'Department created successfully');
    }

    public function edit(Department $department)
    {
        return view('departments.edit', compact('department'));
    }

    public function update(Request $request, Department $department)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:departments,code,' . $department->id,
        ]);

        $department->update($request->all());

        return redirect()->route('departments.index')
            ->with('success', 'Department updated successfully');
    }

    public function destroy(Department $department)
    {
        $department->delete();

        return back()->with('success', 'Department deleted');
    }
}
