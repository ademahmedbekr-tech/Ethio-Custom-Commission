<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Spatie\Activitylog\Models\Activity;



class NotificationController extends Controller{


    public function index(){
        Activity::query()->update(['seen' => 1]);
        $activity = Activity::with('subject')->paginate(7);

return view('notification.index',compact('activity'));
    }
}
