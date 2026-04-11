<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Permission extends Model
{
protected $table= 'permissions';
    protected $fillable = [
        'name',
        'guard_name'
    ];

    /**
     * One Department → Many Employees
     */



}
