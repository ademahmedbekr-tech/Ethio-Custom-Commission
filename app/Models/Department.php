<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Department extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $fillable = [
        'directorate_id',
        'name',
        'branch_id',
        'capacity',
        'description',
        'is_active',
    ];

    protected static function booted()
    {
        // Registering the global scope as a Closure directly
        static::addGlobalScope('branch_filter', function (Builder $builder) {
            if (Auth::check()) {
                $user = Auth::user();
                if ($user && $user->user_branch_id == 4) {
                    return; // Stops execution here, letting this user see ALL records
                }

                // Restrict queries to only match the logged-in user's branch ID
                if ($user && isset($user->user_branch_id)) {
                    $builder->where('branch_id', $user->user_branch_id);
                }
            }
        });
    }

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
    $user = Auth::user()->name ?? 'System';
    $modelName = strtolower(class_basename($this));

    return "{$user} has {$eventName} {$modelName} {$this->name}";
}

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['*'])
            ->useLogName('Position');
    }
}
