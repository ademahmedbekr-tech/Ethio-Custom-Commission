<?php

use App\Http\Livewire\Profile;
use App\Http\Livewire\Students;
use App\Http\Livewire\MembersReport;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\City1Controller;
use App\Http\Controllers\City2Controller;
use App\Http\Controllers\OrganizationController;
use App\Http\Controllers\City3Controller;
use App\Http\Controllers\City4Controller;
use App\Http\Controllers\City5Controller;
use App\Http\Controllers\City6Controller;
use App\Http\Controllers\City7Controller;
use App\Http\Controllers\City8Controller;
use App\Http\Controllers\City9Controller;
use App\Http\Controllers\Zone1Controller;
use App\Http\Controllers\Zone2Controller;
use App\Http\Controllers\Zone3Controller;
use App\Http\Controllers\Zone4Controller;
use App\Http\Controllers\Zone5Controller;
use App\Http\Controllers\Zone6Controller;
use App\Http\Controllers\Zone7Controller;
use App\Http\Controllers\Zone8Controller;
use App\Http\Controllers\Zone9Controller;
use App\Http\Controllers\AbroadController;
use App\Http\Controllers\City10Controller;
use App\Http\Controllers\City11Controller;
use App\Http\Controllers\City12Controller;
use App\Http\Controllers\City13Controller;
use App\Http\Controllers\City14Controller;
use App\Http\Controllers\City15Controller;
use App\Http\Controllers\City16Controller;
use App\Http\Controllers\City17Controller;
use App\Http\Controllers\City18Controller;
use App\Http\Controllers\City19Controller;
use App\Http\Controllers\CityMemberReport;
use App\Http\Controllers\Zone10Controller;
use App\Http\Controllers\Zone11Controller;
use App\Http\Controllers\Zone12Controller;
use App\Http\Controllers\Zone13Controller;
use App\Http\Controllers\Zone14Controller;
use App\Http\Controllers\Zone15Controller;
use App\Http\Controllers\Zone16Controller;
use App\Http\Controllers\Zone17Controller;
use App\Http\Controllers\Zone18Controller;
use App\Http\Controllers\Zone19Controller;
use App\Http\Controllers\Zone20Controller;
use App\Http\Controllers\Zone21Controller;
use App\Http\Controllers\ZoneMemberReport;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RegionalController;
use App\Http\Controllers\RegionMemberReport;
use App\Http\Controllers\CityMemberFeeReport;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HonorableController;
use App\Http\Controllers\ZoneMemberFeeReport;
use App\Http\Controllers\RegionMemberFeeReport;
use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\Front\DetailController;
use App\Http\Controllers\CityMemberPayController;
use App\Http\Controllers\ZoneMemberPayController;
use App\Http\Controllers\AbroadMemberPayController;
use App\Http\Controllers\RegionMemberPayController;
use App\Http\Controllers\HonorableMemberPayController;
use App\Http\Controllers\Front\NewsController as FrontNewsController;
use App\Http\Controllers\Front\AnnouncementController as FrontAnnouncementController;
use App\Http\Controllers\Organization\ArsiiController;
use App\Http\Controllers\Organization\ArsiiLixaaController;
use App\Http\Controllers\Organization\BaaleeController;
use App\Http\Controllers\Organization\BaaleeBahaaController;
use App\Http\Controllers\Organization\BooranaaController;
use App\Http\Controllers\Organization\BuunnooBeddelleeController;
use App\Http\Controllers\Organization\FinfinneeController;
use App\Http\Controllers\Organization\GujiiController;
use App\Http\Controllers\Organization\GujiiLixaaController;
use App\Http\Controllers\Organization\HarargeeBahaaController;
use App\Http\Controllers\Organization\HarargeeLixaaController;
use App\Http\Controllers\Organization\HoorrooGWallaggaaController;
use App\Http\Controllers\Organization\IluuAbbaaBooraaController;
use App\Http\Controllers\Organization\JimmaaController;
use App\Http\Controllers\Organization\QellamController;
use App\Http\Controllers\Organization\ShawaaBahaaController;
use App\Http\Controllers\Organization\ShawaakibbaLixaaController;
use App\Http\Controllers\Organization\ShawaaKaabaaController;
use App\Http\Controllers\Organization\ShawaaLixaaController;
use App\Http\Controllers\Organization\WallaggaBahaaController;
use App\Http\Controllers\Organization\WallaggaLixaaController;
use App\Http\Controllers\Dashboard2Controller;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\WeeklyReportController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\Branches\JigJigaController;
use App\Http\Controllers\ExperienceController;
use App\Http\Controllers\PermissionController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', FrontNewsController::class)->name('front.news');
Route::get('/front-announcement', FrontAnnouncementController::class)->name('front.announcement');
Route::get('/detail/{id}/{model}', DetailController::class);


// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified'
Route::middleware([
    'auth:web',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/admin', DashboardController::class)->name('dashboard');

    Route::resource('users', UserController::class);
    Route::resource('roles', RoleController::class);
    Route::get('profile', Profile::class)->name('profile');
    Route::get('logout', [ProfileController::class, 'logout'])->name('logout');
    Route::resource('news', NewsController::class);
    Route::resource('announcement', AnnouncementController::class);
    Route::resource('dashboard2', Dashboard2Controller::class);
Route::resource('employees', EmployeeController::class);
Route::resource('jigjiga', JigjigaController::class);
    // zones
    Route::resource('zone1', Zone1Controller::class);
    Route::resource('permission', PermissionController::class);
    Route::resource('experiences', ExperienceController::class);


    //

    //

    //

    // import
    Route::post('zone1/import', [Zone1Controller::class, 'import'])->name('zone1.import');

    //City




    //Zone Member Pay Report

    //
// Employee Resource Routes

// Additional custom routes for employees

    // Import/Export routes
    // Route::get('import/form', [EmployeeController::class, 'showImportForm'])->name('employees.import.form');
    Route::post('emplooyees/import', [EmployeeController::class, 'import'])->name('employees.import');
    Route::post('jigjiga/import', [JigJigaController::class, 'import'])->name('jigjiga.import');
    Route::get('emp/{export}', [EmployeeController::class, 'export'])->name('employees.export');
    Route::get('download/sample', [EmployeeController::class, 'downloadSample'])->name('employees.download.sample');

    // Bulk actions
    Route::post('bulk-delete', [EmployeeController::class, 'bulkDelete'])->name('employees.bulk-delete');
    Route::post('bulk-activate', [EmployeeController::class, 'bulkActivate'])->name('employees.bulk-activate');
    Route::post('bulk-activate', [EmployeeController::class, 'bulkActivate'])->name('employees.bulk-activate');

    // Reports
    Route::get('reports/summary', [EmployeeController::class, 'summaryReport'])->name('employees.reports.summary');
    Route::get('reports/salary', [EmployeeController::class, 'salaryReport'])->name('employees.reports.salary');
    Route::get('reports/demographics', [EmployeeController::class, 'demographicsReport'])->name('employees.reports.demographics');

    // Profile/Details
    Route::get('profile/{employee}', [EmployeeController::class, 'profile'])->name('employees.profile');
    Route::get('card/{employee}', [EmployeeController::class, 'printCard'])->name('employees.print-card');
  Route::get('employee/print-card/{employee}', [EmployeeController::class, 'printCard'])->name('employees.print-card');
  // In routes/web.php
Route::get('employees/pdf/{id}', [EmployeeController::class, 'exportPdf'])->name('employees.pdf');
Route::get('employees/card-pdf/{id}', [EmployeeController::class, 'printCard'])->name('employees.card-pdf');
    // Status updates
    Route::patch('{employee}/toggle-status', [EmployeeController::class, 'toggleStatus'])->name('employees.toggle-status');
    Route::patch('{employee}/restore', [EmployeeController::class, 'restore'])->name('employees.restore')->withTrashed();

    // Salary management
    Route::get('{employee}/salary/history', [EmployeeController::class, 'salaryHistory'])->name('employees.salary.history');
    Route::post('{employee}/salary/update', [EmployeeController::class, 'updateSalary'])->name('employees.salary.update');

    // Search and filters
    Route::get('search', [EmployeeController::class, 'search'])->name('employees.search');
    Route::get('filter', [EmployeeController::class, 'filter'])->name('employees.filter');

    // API-like routes for AJAX requests


// Dashboard/Home route (if needed)
Route::get('/', [EmployeeController::class, 'dashboard'])->name('dashboard');
Route::resource('departments', DepartmentController::class);
});
