<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeExperience;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ExperienceController extends Controller
{
    /**
     * Display a listing of experiences for an employee.
     */
public function index(Request $request)
{
    try {
        $employeeId = $request->query('employee_id');

        // If no employee_id provided, show all experiences or redirect
        if (!$employeeId) {
            // Option 1: Show all experiences across all employees
            $experiences = EmployeeExperience::with('employee')
                ->orderBy('created_at', 'desc')
                ->paginate(7);

            $totalExperiences = EmployeeExperience::count();
            $currentExperiences = EmployeeExperience::where('experience_type', 'current')->count();
            $previousExperiences = EmployeeExperience::where('experience_type', 'previous')->count();
            $totalYears = 0; // Calculate if needed

            return view('experiences.index', compact('experiences', 'totalExperiences', 'currentExperiences', 'previousExperiences', 'totalYears'));

            // Option 2: Redirect back with error
            // return redirect()->route('employees.index')
            //     ->with('error', 'Please select an employee first');
        }

        // Get experiences for specific employee
        $employee = Employee::findOrFail($employeeId);

        $experiences = $employee->experiences()
            ->orderBy('experience_type', 'desc')
            ->orderBy('display_order')
            ->paginate(15);

        // Calculate statistics
        $totalExperiences = $employee->experiences()->count();
        $currentExperiences = $employee->experiences()->where('experience_type', 'current')->count();
        $previousExperiences = $employee->experiences()->where('experience_type', 'previous')->count();

        // Calculate total years of experience
        $totalYears = $employee->experiences()->get()->sum(function($exp) {
            $start = $exp->from_date ? \Carbon\Carbon::parse($exp->from_date) : null;
            $end = $exp->to_date ? \Carbon\Carbon::parse($exp->to_date) : ($exp->is_current || $exp->experience_type == 'current' ? \Carbon\Carbon::now() : null);

            if ($start && $end) {
                return $start->diffInYears($end);
            }
            return 0;
        });

        return view('experiences.index', compact('employee', 'experiences', 'totalExperiences', 'currentExperiences', 'previousExperiences', 'totalYears'));

    } catch (\Exception $e) {
        return redirect()->route('employees.index')
            ->with('error', 'Failed to fetch experiences: ' . $e->getMessage());
    }
}

    /**
     * Show form for creating a new experience.
     */
   public function create(Request $request)
    {
        $employeeId = $request->query('employee_id');

        if (!$employeeId) {
            return redirect()->route('employees.index')
                ->with('error', 'Please select an employee first');
        }

        $employee = Employee::with('experiences')->findOrFail($employeeId);

        // Check if employee exists
        if (!$employee) {
            return redirect()->route('employees.index')
                ->with('error', 'Employee not found');
        }

        return view('experiences.create', compact('employee'));
    }


    /**
     * Store a newly created experience.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'employee_id' => 'required|exists:employees,id',
            'institution' => 'required|string|max:255',
            'job_title' => 'required|string|max:255',
            'from_date' => 'required|date',
            'to_date' => 'nullable|date|after_or_equal:from_date',
            'experience_type' => 'required|in:current,previous',
            'is_current' => 'nullable|boolean',
            'description' => 'nullable|string',
            'responsibilities' => 'nullable|string',
            'achievements' => 'nullable|string',
            'location' => 'nullable|string|max:255',
            'employment_type' => 'nullable|string|max:50',
            'salary' => 'nullable|numeric',
            'display_order' => 'nullable|integer'
        ]);

        if ($validator->fails()) {
            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors()
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            DB::beginTransaction();

            // If this is a current experience, mark other current experiences as previous
            if ($request->experience_type === 'current' || $request->is_current) {
                EmployeeExperience::where('employee_id', $request->employee_id)
                    ->where('experience_type', 'current')
                    ->update([
                        'experience_type' => 'previous',
                        'to_date' => now(),
                        'is_current' => false
                    ]);
            }

            // Calculate display order if not provided
            $displayOrder = $request->display_order;
            if (!$displayOrder) {
                $maxOrder = EmployeeExperience::where('employee_id', $request->employee_id)
                    ->where('experience_type', $request->experience_type)
                    ->max('display_order');
                $displayOrder = $maxOrder + 1;
            }

            // Create experience
            $experience = EmployeeExperience::create([
                'employee_id' => $request->employee_id,
                'institution' => $request->institution,
                'job_title' => $request->job_title,
                'from_date' => $request->from_date,
                'to_date' => $request->is_current ? null : $request->to_date,
                'experience_type' => $request->experience_type,
                'is_current' => $request->is_current ?? ($request->experience_type === 'current'),
                'display_order' => $displayOrder,
                'description' => $request->description,
                'responsibilities' => $request->responsibilities,
                'achievements' => $request->achievements,
                'location' => $request->location,
                'employment_type' => $request->employment_type,
                'salary' => $request->salary,
                'currency' => $request->currency ?? 'ETB',
                'metadata' => $request->metadata ? json_encode($request->metadata) : null
            ]);

            DB::commit();

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Experience added successfully',
                    'data' => $experience
                ], 201);
            }

            return redirect()->route('employees.show', $request->employee_id)
                ->with('success', 'Experience added successfully');

        } catch (\Exception $e) {
            DB::rollBack();

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to add experience',
                    'error' => $e->getMessage()
                ], 500);
            }

            return redirect()->back()
                ->with('error', 'Failed to add experience: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Display the specified experience.
     */
    public function show(int $id)
    {
        try {
            $experience = EmployeeExperience::with('employee')->findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $experience
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Experience not found',
                'error' => $e->getMessage()
            ], 404);
        }
    }

    /**
     * Show form for editing the specified experience.
     */
    public function edit(int $id)
    {
        $experience = EmployeeExperience::with('employee')->findOrFail($id);

        return view('experiences.edit', compact('experience'));
    }

    /**
     * Update the specified experience.
     */
    public function update(Request $request, int $id)
    {
        $experience = EmployeeExperience::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'institution' => 'sometimes|required|string|max:255',
            'job_title' => 'sometimes|required|string|max:255',
            'from_date' => 'sometimes|required|date',
            'to_date' => 'nullable|date|after_or_equal:from_date',
            'experience_type' => 'sometimes|required|in:current,previous',
            'is_current' => 'nullable|boolean',
            'description' => 'nullable|string',
            'responsibilities' => 'nullable|string',
            'achievements' => 'nullable|string',
            'location' => 'nullable|string|max:255',
            'employment_type' => 'nullable|string|max:50',
            'salary' => 'nullable|numeric',
            'display_order' => 'nullable|integer'
        ]);

        if ($validator->fails()) {
            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors()
                ], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            DB::beginTransaction();

            // Handle current experience changes
            if ($request->has('experience_type') && $request->experience_type === 'current') {
                // Mark other current experiences as previous
                EmployeeExperience::where('employee_id', $experience->employee_id)
                    ->where('id', '!=', $id)
                    ->where('experience_type', 'current')
                    ->update([
                        'experience_type' => 'previous',
                        'is_current' => false,
                        'to_date' => now()
                    ]);
            }

            // Prepare update data
            $updateData = $request->only([
                'institution', 'job_title', 'from_date', 'to_date',
                'experience_type', 'description', 'responsibilities',
                'achievements', 'location', 'employment_type', 'salary',
                'currency', 'display_order'
            ]);

            // Handle current flag
            if ($request->has('is_current')) {
                $updateData['is_current'] = $request->is_current;
                if ($request->is_current) {
                    $updateData['to_date'] = null;
                }
            }

            // Handle metadata
            if ($request->has('metadata')) {
                $updateData['metadata'] = json_encode($request->metadata);
            }

            $experience->update($updateData);

            DB::commit();

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Experience updated successfully',
                    'data' => $experience->fresh()
                ]);
            }

            return redirect()->route('employees.show', $experience->employee_id)
                ->with('success', 'Experience updated successfully');

        } catch (\Exception $e) {
            DB::rollBack();

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to update experience',
                    'error' => $e->getMessage()
                ], 500);
            }

            return redirect()->back()
                ->with('error', 'Failed to update experience: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Remove the specified experience.
     */
    public function destroy(int $id)
    {
        try {
            DB::beginTransaction();

            $experience = EmployeeExperience::findOrFail($id);
            $employeeId = $experience->employee_id;

            // Reorder remaining experiences
            EmployeeExperience::where('employee_id', $employeeId)
                ->where('experience_type', $experience->experience_type)
                ->where('display_order', '>', $experience->display_order)
                ->decrement('display_order');

            $experience->delete();

            DB::commit();

            if (request()->expectsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Experience deleted successfully'
                ]);
            }

            return redirect()->route('employees.show', $employeeId)
                ->with('success', 'Experience deleted successfully');

        } catch (\Exception $e) {
            DB::rollBack();

            if (request()->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to delete experience',
                    'error' => $e->getMessage()
                ], 500);
            }

            return redirect()->back()
                ->with('error', 'Failed to delete experience: ' . $e->getMessage());
        }
    }

    /**
     * Reorder experiences (drag and drop functionality)
     */
    public function reorder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'employee_id' => 'required|exists:employees,id',
            'experiences' => 'required|array',
            'experiences.*.id' => 'required|exists:employee_experiences,id',
            'experiences.*.display_order' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            DB::beginTransaction();

            foreach ($request->experiences as $exp) {
                EmployeeExperience::where('id', $exp['id'])
                    ->where('employee_id', $request->employee_id)
                    ->update(['display_order' => $exp['display_order']]);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Experiences reordered successfully'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to reorder experiences',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Copy experiences from one employee to another
     */
    public function copy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'source_employee_id' => 'required|exists:employees,id',
            'target_employee_id' => 'required|exists:employees,id',
            'experience_types' => 'nullable|array',
            'experience_types.*' => 'in:current,previous'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            DB::beginTransaction();

            $query = EmployeeExperience::where('employee_id', $request->source_employee_id);

            if ($request->has('experience_types')) {
                $query->whereIn('experience_type', $request->experience_types);
            }

            $experiences = $query->get();

            foreach ($experiences as $exp) {
                $newExp = $exp->replicate();
                $newExp->employee_id = $request->target_employee_id;
                $newExp->save();
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => count($experiences) . ' experiences copied successfully',
                'data' => [
                    'copied_count' => count($experiences)
                ]
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to copy experiences',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get experience timeline for an employee
     */
    public function timeline(Request $request, int $employeeId)
    {
        try {
            $employee = Employee::findOrFail($employeeId);

            $experiences = $employee->experiences()
                ->orderBy('from_date')
                ->get()
                ->map(function ($exp) {
                    return [
                        'id' => $exp->id,
                        'title' => $exp->job_title,
                        'institution' => $exp->institution,
                        'start' => $exp->from_date ? $exp->from_date->format('Y-m-d') : null,
                        'end' => $exp->to_date ? $exp->to_date->format('Y-m-d') : null,
                        'is_current' => $exp->is_current,
                        'type' => $exp->experience_type,
                        'duration' => $exp->duration
                    ];
                });

            return response()->json([
                'success' => true,
                'data' => [
                    'employee' => $employee->employee_name,
                    'experiences' => $experiences
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch timeline',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
