<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionController
{
    public function index()
    {
        $permission = DB::table('permissions')->orderBy('created_at','Asc')->paginate(7);
        return view('acceess_control.permission.index', compact('permission'));
    }

    public function create()
    {
    }

    public function store(Request $request)
    {
    }

    public function show(int $id)
    {
    }

    public function edit(int $id)
    {
    }

    public function update(Request $request, int $id)
    {
    }

    public function destroy($id)
    {
       DB::table('permissions')->where('id', $id)->delete();

        return redirect()->route('permission.index')

            ->with('success', 'Permission deleted successfully');
    }
}
