<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('permission:permission-list|permission-create|permission-edit|permission-delete', ['only' => ['index', 'store']]);

        $this->middleware('permission:permission-create', ['only' => ['create', 'store']]);

        $this->middleware('permission:permission-edit', ['only' => ['edit', 'update']]);

        $this->middleware('permission:permission-delete', ['only' => ['destroy']]);
    }
    public function index()
    {
        $permission = Permission::orderBy('created_at','Asc')->paginate(7);
        return view('acceess_control.permission.index', compact('permission'));
    }

    public function create()
    {


    }

    public function store(Request $request)
    {

$this->validate($request, [

            'name' => 'required|unique:permissions,name',

            'guard_name' => 'required',

        ]);

        $permission = Permission::create($request->all());

        // $permission->syncPermissions($request->input('guard_name'));

        return redirect()->route('permission.index')

            ->with('success', 'permission created successfully');
    }

    public function show(int $id)
    {
    }

    public function edit($id)

    {

        $permission = Permission::findOrFail($id);
        return view('_partials._modals.modal-edit-permission', compact('permission'));

    }

    public function update(Request $request, Permission $permission)
    {
        $request->validate([
            'name' => 'required',
            'guard_name' => 'required'
        ]);

        $permission->update($request->all());

        return redirect()->route('permission.index')
            ->with('success', ' permission updated successfully');
    }

    public function destroy($id)
    {
       DB::table('permissions')->where('id', $id)->delete();

        return redirect()->route('permission.index')

            ->with('success', 'Permission deleted successfully');
    }
}
