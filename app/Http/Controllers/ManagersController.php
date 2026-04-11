<?php
namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\managers;
use App\Models\Managers as ModelsManagers;
use Illuminate\Http\Request;

class ManagersController extends Controller
{
  public function index()
{
    $department = Department::first();
    $managers = Managers::with('department')->paginate(7);

    // Statistics for dashboard cards
    $totalmanagers = managers::count();
    $managersWithHeads = managers::whereNotNull('department_id')->count();
    $managersWithoutHeads = managers::whereNull('department_id')->count();
    $recentmanagers = managers::whereMonth('created_at', now()->month)->count();

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

        $department = Department::get();
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
        $managers = managers::findOrFail($id);

        return view('managers.edit', compact('managers'));
    }

    public function update(Request $request, managers $managers)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:managers,code,' . $managers->id,
        ]);

        $managers->update($request->all());

        return redirect()->route('managers.index')
            ->with('success', 'managers updated successfully');
    }

    public function destroy(managers $managers)
    {
        $managers->delete();

        return back()->with('success', 'managers deleted');
    }

    public function show(){
return view('managers.show');
    }

}
