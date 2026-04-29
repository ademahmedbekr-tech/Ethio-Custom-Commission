<?php
 namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;

class Fayda extends Model{
protected $table = "fayda";
protected $fillable = [
    'employe_id',
    'fan',
    'fin'
];


  public function fayda(): BelongsTo
    {
        return $this->belongsTo(Employee::class,'employe_id','id');
    }
}
