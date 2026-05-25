<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Directorate;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
    public function index()
    {
        $departments = Department::with('directorate')
            ->latest()
            ->paginate(10);

        return view('departments.index', compact('departments'));
    }

    public function create()
    {
        $directorates = Directorate::with('branch')->get();

        return view('departments.create', compact('directorates'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'directorate_id' => 'required|exists:directorates,id',
            'name' => 'required|string|max:255',
            'code' => 'required|unique:departments,code',
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

        return view('departments.edit', compact('department', 'directorates'));
    }

    public function update(Request $request, $id)
    {
        $department = Department::findOrFail($id);

        $validated = $request->validate([
            'directorate_id' => 'required|exists:directorates,id',
            'name' => 'required|string|max:255',
            'code' => 'required|unique:departments,code,' . $department->id,
            'description' => 'nullable|string',
            'is_active' => 'nullable|boolean',
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
