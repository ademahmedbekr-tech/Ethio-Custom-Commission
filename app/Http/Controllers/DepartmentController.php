<?php
namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Managers;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
  public function index(Request $request)
{
    $departments = Department::with('manage')->paginate(7);
    // dd($departments->all());
     $search = $request->input('search');

    $departments = Department::with('manage')
        ->when($search, function ($query, $search) {
            return $query->where('name', 'like', '%' . $search . '%');
        })
        ->paginate(7)
        ->appends(['search' => $search]);

    // Statistics for dashboard cards
    $totalDepartments = Department::count();
    $departmentsWithHeads = Department::whereNotNull('managers_id')->count();
    $departmentsWithoutHeads = Department::whereNull('managers_id')->count();
    $recentDepartments = Department::whereMonth('created_at', now()->month)->count();

    return view('departments.index', compact(
        'departments',
        'totalDepartments',
        'departmentsWithHeads',
        'departmentsWithoutHeads',
        'recentDepartments',
        'search'
    ));
}

    public function create()
    {
        $manager = Managers::select('name')
            ->distinct()
            ->whereNotNull('name')
            ->orderBy('name', 'ASC')
            ->pluck('name');
        return view('departments.create',compact('manager'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:departments,name',
            'code' => 'required|unique:departments,code',
        ]);

        Department::create($request->all());

        return redirect()->route('departments.index')
            ->with('success', 'Department created successfully');
    }

    public function edit($id)
    {
        $department = Department::findOrFail($id);

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

    public function show(){
return view('departments.show');
    }

}
