<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;

class EmployeeExperience extends Model {



protected $table = 'employee_experiences';

protected $fillable = [
      'employee_id',
            'institution',
            'job_title',
            'from_date',
            'to_date',
            'experience_type',
            'is_current',
            'description',
            'responsibilities',
            'achievements',
            'location',
            'employment_type',
            'salary',
            'display_order',
            'in_outside'
];
  public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class, 'employee_id', 'id');
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
            ->useLogName("employee_experiences");
    }
}
