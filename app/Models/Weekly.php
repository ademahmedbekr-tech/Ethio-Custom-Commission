<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class Weekly extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $table = 'weekly_report';
    protected $fillable = [

         'zone',
    'qonnaa_bulaa',
    'H_Mootummaa',
    'J_magaalaa',
    'daldalaa_a_c',
    'sector',
    'geejjiba',
    'week',
    'category',
    'total_plan',
    ];

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
            ->useLogName("admin");
    }
}
