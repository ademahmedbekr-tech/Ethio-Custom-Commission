<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Department extends Model
{
    protected $table = 'departments';
    protected $fillable = [
        'name',
        'code',
        'description',
        'managers_id', // ✅ added
    ];

    /**
     * One Department → Many Employees
     */


    /**
     * Department Head (belongs to Employee)
     */
  public function manage(): BelongsTo
    {
        return $this->belongsTo(Managers::class,'managers_id','id');
    }



}
