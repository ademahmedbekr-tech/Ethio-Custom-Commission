<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class Department extends Model
{
    use HasFactory;
    use LogsActivity;

protected $fillable = [
        'directorate_id',
        'name',
        'branch_id',
        'code',
        'description',
        'is_active'
    ];

    public function directorate()
    {
        return $this->belongsTo(Directorate::class, 'directorate_id', 'id');
    }
      public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id', 'id');
    }

    public function teams()
    {
        return $this->hasMany(Team::class);
    }
    protected static $logAttributes = ['*'];

    protected static $logOnlyDirty = true;

    public function getDescriptionForEvent(string $eventName): string
    {
        //$user = Auth::user()->name;
        //return "{$user} has {$eventName} user {$this->name}";

        return "user has {$eventName} user {$this->name}";
    }
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['*'])
            ->useLogName("Department");
    }
}



