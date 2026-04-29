<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\DocumentType;
use App\Models\EmployeeDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class DocumentController extends Controller
{
    /**
     * Display a listing of documents.
     */
    public function index(Request $request)
    {
        try {
            $employeeId = $request->query('employeeid');
            $documentType = $request->query('document_type');
            $search = $request->query('search');
            $status = $request->query('status');

            // Get document types for filter
            $documentTypes = DocumentType::active()->ordered()->get();

            if (!$employeeId) {
                // All documents view
                $query = EmployeeDocument::with(['employee', 'documentType']);

                if ($documentType) {
                    $query->byType($documentType);
                }

                if ($search) {
                    $query->where(function ($q) use ($search) {
                        $q->where('document_name', 'LIKE', "%{$search}%")
                          ->orWhere('document_number', 'LIKE', "%{$search}%")
                          ->orWhere('issuing_authority', 'LIKE', "%{$search}%")
                          ->orWhereHas('employee', function ($emp) use ($search) {
                              $emp->where('employee_name', 'LIKE', "%{$search}%")
                                  ->orWhere('file_number', 'LIKE', "%{$search}%");
                          });
                    });
                }

                if ($status === 'expired') {
                    $query->expired();
                } elseif ($status === 'expiring_soon') {
                    $query->expiringSoon();
                } elseif ($status === 'verified') {
                    $query->verified();
                }

                $documents = $query->orderBy('created_at', 'desc')
                    ->paginate(15)
                    ->withQueryString();

                // Statistics
                $statistics = $this->getGeneralStatistics();

                return view('documents.index', compact(
                    'documents',
                    'documentTypes',
                    'statistics'
                ));
            }

            // Employee-specific documents
            $employee = Employee::findOrFail($employeeId);

            $query = $employee->documents()->with('documentType');

            if ($documentType) {
                $query->byType($documentType);
            }

            if ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('document_name', 'LIKE', "%{$search}%")
                      ->orWhere('document_number', 'LIKE', "%{$search}%");
                });
            }

            $documents = $query->orderBy('document_type_id')
                ->orderBy('display_order')
                ->paginate(15)
                ->withQueryString();

            // Employee document statistics
            $statistics = $this->getEmployeeStatistics($employee);
            $documentStatus = $employee->document_status;

            // Group documents by type
            $documentsByType = $employee->documents()
                ->with('documentType')
                ->get()
                ->groupBy('document_type_id');

            return view('documents.index', compact(
                'employee',
                'documents',
                'documentTypes',
                'statistics',
                'documentStatus',
                'documentsByType'
            ));
        } catch (\Exception $e) {
            return redirect()->route('employees.index')
                ->with('error', 'Failed to fetch documents: ' . $e->getMessage());
        }
    }

    /**
     * Show form for creating a new document.
     */
    public function create(Request $request)
    {
        $employeeId = $request->query('employeeid');
        $documentType = $request->query('document_type');

        if (!$employeeId) {
            return redirect()->route('employees.index')
                ->with('error', 'Please select an employee first');
        }

        $employee = Employee::findOrFail($employeeId);
        $documentTypes = DocumentType::active()->ordered()->get();
        $selectedType = $documentType ? DocumentType::where('slug', $documentType)->first() : null;

        return view('documents.create', compact('employee', 'documentTypes', 'selectedType'));
    }

    /**
     * Store a newly created document.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'employeeid' => 'required|exists:employees,id',
            'document_type_id' => 'required|exists:document_types,id',
            'document_name' => 'required|string|max:255',
            'document_number' => 'nullable|string|max:100',
            'issuing_authority' => 'nullable|string|max:255',
            'document_file' => 'required|file|max:10240', // 10MB
            'issue_date' => 'nullable|date',
            'expiry_date' => 'nullable|date|after:issue_date',
            'renewal_date' => 'nullable|date',
            'description' => 'nullable|string',
            'remarks' => 'nullable|string',
            'tags' => 'nullable|array',
            'display_order' => 'nullable|integer',
        ]);

        if ($validator->fails()) {
            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => $validator->errors(),
                ], 422);
            }

            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            DB::beginTransaction();

            if ($request->hasFile('document_file')) {
                $file = $request->file('document_file');
                $documentType = DocumentType::find($request->document_type_id);

                // Create folder structure: documents/employeeid/document_type/
                $folderPath = 'documents/' . $request->employeeid . '/' . $documentType->slug;
                $fileName = time() . '_' . preg_replace('/[^A-Za-z0-9\-\.]/', '', $file->getClientOriginalName());
                $filePath = $file->storeAs($folderPath, $fileName, 'public');

                // Calculate display order
                $displayOrder = $request->display_order;
                if (!$displayOrder) {
                    $maxOrder = EmployeeDocument::where('employeeid', $request->employeeid)
                        ->where('document_type_id', $request->document_type_id)
                        ->max('display_order');
                    $displayOrder = ($maxOrder ?? 0) + 1;
                }

                $document = EmployeeDocument::create([
                    'employeeid' => $request->employeeid,
                    'document_type_id' => $request->document_type_id,
                    'document_name' => $request->document_name,
                    'document_number' => $request->document_number,
                    'issuing_authority' => $request->issuing_authority,
                    'file_path' => $filePath,
                    'file_name' => $file->getClientOriginalName(),
                    'file_type' => $file->getClientOriginalExtension(),
                    'file_size' => $file->getSize(),
                    'issue_date' => $request->issue_date,
                    'expiry_date' => $request->expiry_date,
                    'renewal_date' => $request->renewal_date,
                    'description' => $request->description,
                    'remarks' => $request->remarks,
                    'tags' => $request->tags ? json_encode($request->tags) : null,
                    'display_order' => $displayOrder,
                    'uploaded_by' => auth()->user()->name ?? 'System',
                ]);

                DB::commit();

                if ($request->expectsJson()) {
                    return response()->json([
                        'success' => true,
                        'message' => 'Document uploaded successfully',
                        'data' => $document->load('documentType'),
                    ], 201);
                }

                return redirect()->route('document.index', ['employeeid' => $request->employeeid])
                    ->with('success', 'Document uploaded successfully');
            }

            throw new \Exception('No file uploaded');
        } catch (\Exception $e) {
            DB::rollBack();

            if (isset($filePath)) {
                Storage::disk('public')->delete($filePath);
            }

            if ($request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to upload document',
                    'error' => $e->getMessage(),
                ], 500);
            }

            return redirect()->back()
                ->with('error', 'Failed to upload document: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Bulk upload documents.
     */
    public function bulkUpload(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'employeeid' => 'required|exists:employees,id',
            'document_type_id' => 'required|exists:document_types,id',
            'documents' => 'required|array',
            'documents.*' => 'required|file|max:10240',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            DB::beginTransaction();

            $uploadedDocs = [];
            $documentType = DocumentType::find($request->document_type_id);

            foreach ($request->file('documents') as $file) {
                $folderPath = 'documents/' . $request->employeeid . '/' . $documentType->slug;
                $fileName = time() . '_' . preg_replace('/[^A-Za-z0-9\-\.]/', '', $file->getClientOriginalName());
                $filePath = $file->storeAs($folderPath, $fileName, 'public');

                $document = EmployeeDocument::create([
                    'employeeid' => $request->employeeid,
                    'document_type_id' => $request->document_type_id,
                    'document_name' => pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME),
                    'file_path' => $filePath,
                    'file_name' => $file->getClientOriginalName(),
                    'file_type' => $file->getClientOriginalExtension(),
                    'file_size' => $file->getSize(),
                    'uploaded_by' => auth()->user()->name ?? 'System',
                ]);

                $uploadedDocs[] = $document;
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => count($uploadedDocs) . ' documents uploaded successfully',
                'data' => $uploadedDocs,
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to upload documents',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Get general statistics.
     */
    private function getGeneralStatistics()
    {
        return [
            'total_documents' => EmployeeDocument::count(),
            'active_documents' => EmployeeDocument::active()->count(),
            'verified_documents' => EmployeeDocument::verified()->count(),
            'expired_documents' => EmployeeDocument::expired()->count(),
            'expiring_soon' => EmployeeDocument::expiringSoon(30)->count(),
            'total_size' => EmployeeDocument::sum('file_size'),
            'by_type' => DocumentType::withCount('documents')->get(),
        ];
    }

    /**
     * Get employee-specific statistics.
     */
    private function getEmployeeStatistics($employee)
    {
        return [
            'total_documents' => $employee->documents()->count(),
            'active_documents' => $employee->documents()->active()->count(),
            'verified_documents' => $employee->documents()->verified()->count(),
            'expired_documents' => $employee->documents()->expired()->count(),
            'expiring_soon' => $employee->documents()->expiringSoon(30)->count(),
            'total_size' => $employee->documents()->sum('file_size'),
            'by_type' => $employee->documents()
                ->join('document_types', 'employee_documents.document_type_id', '=', 'document_types.id')
                ->select('document_types.name', DB::raw('count(*) as count'))
                ->groupBy('document_types.name')
                ->get(),
        ];
    }
}
