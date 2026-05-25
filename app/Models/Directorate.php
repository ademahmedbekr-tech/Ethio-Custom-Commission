<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Directorate extends Model
{
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



}
