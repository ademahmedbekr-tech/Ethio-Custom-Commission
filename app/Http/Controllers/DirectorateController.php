<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Directorate;
use App\Models\Managers;
use Illuminate\Http\Request;

class DirectorateController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('permission:directorate-list|directorate-create|directorate-edit|directorate-delete', ['only' => ['index', 'store']]);

        $this->middleware('permission:directorate-create', ['only' => ['create', 'store']]);

        $this->middleware('permission:directorate-edit', ['only' => ['edit', 'update']]);

        $this->middleware('permission:directorate-delete', ['only' => ['destroy']]);
    }
    public function index(Request $request)
    {
        $directorates = Directorate::with('manage','branch')->first();
        // dd($directorates->all());
        $search = $request->input('search');

        $directorates = Directorate::with('manage','branch')
            ->when($search, function ($query, $search) {
                return $query->where('name', 'like', '%'.$search.'%');
            })
            ->paginate(7)
            ->appends(['search' => $search]);

        // Statistics for dashboard cards
        $totalDirectorates = Directorate::count();
        $directoratesWithHeads = Directorate::whereNotNull('manager_id')->count();
        $directoratesWithoutHeads = Directorate::whereNull('manager_id')->count();
        $recentDirectorates = Directorate::whereMonth('created_at', now()->month)->count();

        return view('directorates.index', compact(
            'directorates',
            'totalDirectorates',
            'directoratesWithHeads',
            'directoratesWithoutHeads',
            'recentDirectorates',
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
        $branch = Directorate::select('branch')->distinct();

        return view('directorates.create', compact('manager', 'branch'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:directorates,name',
            'code' => 'required|unique:directorates,code',
        ]);

        Directorate::create($request->all());

        return redirect()->route('directorates.index')
            ->with('success', 'Directorate created successfully');
    }

    public function edit($id)
    {
        $manager = Managers::get();
        $branch = Branch::get();
        $department = Directorate::findOrFail($id);

        return view('directorates.edit', compact('department', 'manager', 'branch'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:directorates,code,'.$id,
            'manager_id' => 'required|unique:directorates,manager_id,'.$id,
            'branch_id' => 'required',

        ]);
        $department = Directorate::findOrFail($id);

        $department->update([
            'name' => $request->name,
            'manager_id' => $request->manager_id,
            'code' => $request->code,
            'branch_id' => $request->branch_id,
        ]);

        // dd($department->all());
        return redirect()->route('directorates.index')
            ->with('success', 'Directorate updated successfully');
    }

    public function destroy(Directorate $department)
    {
        $department->delete();

        return back()->with('success', 'Directorate deleted');
    }

    public function show()
    {
        return view('directorates.show');
    }
}
