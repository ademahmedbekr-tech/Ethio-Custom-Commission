<?php
namespace App\Http\Controllers;

use App\Models\Directorate;
use App\Models\Managers;
// use App\Models\Managers as ModelsManagers;
use Illuminate\Http\Request;

class ManagersController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('permission:managers-list|managers-create|managers-edit|managers-delete', ['only' => ['index', 'store']]);

        $this->middleware('permission:managers-create', ['only' => ['create', 'store']]);

        $this->middleware('permission:managers-edit', ['only' => ['edit', 'update']]);

        $this->middleware('permission:managers-delete', ['only' => ['destroy']]);
    }
  public function index()
{
    $department = Directorate::first();
    $managers = Managers::with('department')->paginate(7);

    // Statistics for dashboard cards
    $totalmanagers = Managers::count();
    $managersWithHeads = Managers::whereNotNull('department_id')->count();
    $managersWithoutHeads = Managers::whereNull('department_id')->count();
    $recentmanagers = Managers::whereMonth('created_at', now()->month)->count();

    return view('managers.index', compact(
        'managers',
        'totalmanagers',
        'managersWithHeads',
        'managersWithoutHeads',
        'recentmanagers'
    ));
}

    public function create()
    {

        $department = Directorate::get();
        return view('managers.create', compact('department'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'department_id' => 'nullable|unique:managers,department_id',
        ]);
        // dd($request->all());


        managers::create([
            'name' =>$request->name,
            'department_id' => $request->department,
        ]);


        return redirect()->route('managers.index')
            ->with('success', 'managers created successfully');
    }

    public function edit($id)
    {
        $department = Directorate::get();

        $managers = Managers::findOrFail($id);

        return view('managers.edit', compact('managers','department'));
    }

public function update(Request $request, $id)
{
    $request->validate([
        'name' => 'required',
        'department_id' => 'nullable|unique:managers,department_id,' . $id,
    ]);

    $manager = Managers::findOrFail($id);
    $manager->update([
        'name' => $request->name,
        'department_id' => $request->department_id,  // ✅ Changed from 'department' to 'department_id'
    ]);

    return redirect()->route('managers.index')
        ->with('success', 'Manager updated successfully');
}

    public function destroy($id)
    {
        Managers::find($id)->delete();

        return back()->with('success', 'managers deleted');
    }

    public function show(){
return view('managers.show');
    }

}
