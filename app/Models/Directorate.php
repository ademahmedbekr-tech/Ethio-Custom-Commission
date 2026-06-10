<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Directorate extends Model
{
    use LogsActivity;
    protected $table = 'directorates';
    protected $fillable = [
        'name',
        'code',
        'branch_id', // ✅ added
        'description',
        'manager_id', // ✅ added
    ];

    /**
     * One Directorate → Many Employees
     */


    /**
     * Directorate Head (belongs to Employee)
     */

     public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id', 'id');
    }

    public function departments()
    {
        return $this->hasMany(Department::class);
    }
  public function manage(): BelongsTo
    {
        return $this->belongsTo(Managers::class,'manager_id','id');
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
            ->useLogName("Directorate");
    }


}
