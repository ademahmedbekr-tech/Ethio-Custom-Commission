<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

use App\Models\Directorate;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Branch extends Model
{
    use HasFactory;
    use LogsActivity;

protected $fillable = [
        'name',
        'code',
        'city',
        'address',
        'is_active'
    ];

    public function directorates()
    {
        return $this->hasMany(Directorate::class);
    }

    public function user(){
        return $this->hasMany(User::class);
    }

    //   public function branch()
    // {
    //     return $this->belongsTo(Branch::class);
    // }

    protected static $logAttributes = ['*'];

    protected static $logOnlyDirty = true;

    public function getDescriptionForEvent(string $eventName): string
{
    $user = Auth::user()->name ?? 'System';
    $modelName = strtolower(class_basename($this));

    return "{$user} has {$eventName} {$modelName} {$this->name}";
}
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['*'])
            ->useLogName("Branch");
    }
}
