<?php

namespace App\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope; // <-- CRITICAL: If this is missing, the interface check fails
use Illuminate\Support\Facades\Auth;

class BranchScope implements Scope
{
    public function apply(Builder $builder, Model $model)
    {
        if (Auth::check()) {
            $user = Auth::user();
            if ($user && isset($user->branch_id)) {
                $builder->where('branch_id', $user->branch_id);
            }
        }
    }
}
