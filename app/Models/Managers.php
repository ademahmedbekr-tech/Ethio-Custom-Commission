<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Managers extends Model
{
protected $table= 'managers';
    protected $fillable = [
        'name',
        'department_id',
        'job_title',
        'started_date', // ✅ added
    ];

    /**
     * One Department → Many Employees
     */

  public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class,'department_id','id');
    }

}
