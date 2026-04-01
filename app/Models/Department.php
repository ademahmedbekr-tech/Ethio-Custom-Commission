<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $fillable = [
        'name',
        'code',
        'description',
        'head_id', // ✅ added
    ];

    /**
     * One Department → Many Employees
     */
    public function employees()
    {
        return $this->hasMany(Employee::class);
    }

    /**
     * Department Head (belongs to Employee)
     */
    public function head()
    {
        return $this->belongsTo(Employee::class, 'head_id');
    }
}
