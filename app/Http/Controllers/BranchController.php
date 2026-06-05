<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use Illuminate\Http\Request;

class BranchController extends Controller
{
    /**
     * Display a listing of branches.
     */
    public function index()
    {
        $branches = Branch::latest()->paginate(7);

        return view('branches.index', compact('branches'));
    }

    /**
     * Show the form for creating a new branch.
     */
    public function create()
    {
        return view('branches.create');
    }

    /**
     * Store a newly created branch.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'required|string|max:50|unique:branches,code',

            'city'        => 'nullable|string|max:100',
            'address'     => 'nullable|string',
            'is_active'   => 'nullable|boolean',
        ]);

        Branch::create($validated);

        return redirect()
            ->route('branches.index')
            ->with('success', 'Branch created successfully.');
    }

    /**
     * Display the specified branch.
     */
    public function show(int $id)
    {
        $branch = Branch::findOrFail($id);

        return view('branches.show', compact('branch'));
    }

    /**
     * Show the form for editing the specified branch.
     */
    public function edit(int $id)
    {
        $branch = Branch::findOrFail($id);

        return view('branches.edit', compact('branch'));
    }

    /**
     * Update the specified branch.
     */
    public function update(Request $request, int $id)
    {
        $branch = Branch::findOrFail($id);

        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'required|string|max:50|unique:branches,code,' . $branch->id,
            'city'        => 'nullable|string|max:100',
            'address'     => 'nullable|string',
            'is_active'   => 'nullable|boolean',
        ]);

        $branch->update($validated);

        return redirect()
            ->route('branches.index')
            ->with('success', 'Branch updated successfully.');
    }

    /**
     * Remove the specified branch.
     */
    public function destroy(int $id)
    {
        $branch = Branch::findOrFail($id);

        $branch->delete();

        return redirect()
            ->route('branches.index')
            ->with('success', 'Branch deleted successfully.');
    }
}
