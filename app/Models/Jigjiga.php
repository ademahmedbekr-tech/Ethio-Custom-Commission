<?php
// app/Models/Employee.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class Jigjiga extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'jigjiga';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = true;

    /**
     * The data type of the primary key.
     *
     * @var string
     */
    protected $keyType = 'int';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        // Employee Information
        'file_number',
        'employee_name',
        'job_title',
        'branch_name',
        'gender',
        'job_level',
        'ethnicity',
        'religion',
        'date_of_birth',
        'hire_date',

        // Job and Compensation
        'step',
        'salary',
        'allowance',
        'assignment_date',
        'housing_allowance',

        // Personal & Contact
        'pension_id',
        'marital_status',
        'region',
        'zone',
        'district',
        'specific_location',
        'house_number',
        'phone_number',
        'email',

        // Education
        'education_type',
        'education_level',
        'cgpa',
        'institution',
        'graduation_date',
        'coc_certificate',
        'higher_ed_verified',

        // Work Experience (Current)
        'current_job_title',
        'current_institution',
        'experience_from',
        'experience_to',

        // Work Experience (Previous)
        'previous_job_title',
        'previous_institution',
        'previous_from',
        'previous_to',

        // Additional Info
        'column_40',
        'diagnosis',
        'disability_type',

        // File Uploads
        'photo',
        'document',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        // Dates
        'date_of_birth' => 'date:Y-m-d',
        'hire_date' => 'date:Y-m-d',
        'assignment_date' => 'date:Y-m-d',
        'graduation_date' => 'date:Y-m-d',
        'experience_from' => 'date:Y-m-d',
        'experience_to' => 'date:Y-m-d',
        'previous_from' => 'date:Y-m-d',
        'previous_to' => 'date:Y-m-d',

        // Decimals
        'salary' => 'decimal:2',
        'allowance' => 'decimal:2',
        'housing_allowance' => 'decimal:2',
        'cgpa' => 'decimal:2',

        // Booleans
        'coc_certificate' => 'boolean',
        'higher_ed_verified' => 'boolean',

        // Timestamps
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
        //document and photo are stored as file paths (strings)
        'photo' => 'string',
        'document' => 'string',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'deleted_at',
    ];

    /**
     * The model's default values for attributes.
     *
     * @var array
     */
    protected $attributes = [
        'coc_certificate' => false,
        'higher_ed_verified' => false,
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'age',
        'years_of_service',
        'full_address',
        'total_salary',
        'experience_duration',
        'profile_photo_url',
    ];

    // ==================== ACCESSORS ====================

    /**
     * Get the employee's age.
     */
    public function getAgeAttribute(): ?int
    {
        if (!$this->date_of_birth) {
            return null;
        }

        return $this->date_of_birth->age;
    }

    /**
     * Get the employee's years of service.
     */
    public function getYearsOfServiceAttribute(): ?int
    {
        if (!$this->hire_date) {
            return null;
        }

        return $this->hire_date->diffInYears(now());
    }

    /**
     * Get full address as string.
     */
    public function getFullAddressAttribute(): string
    {
        $parts = array_filter([
            $this->specific_location,
            $this->district,
            $this->zone,
            $this->region,
        ]);

        return implode(', ', $parts) ?: 'N/A';
    }

    /**
     * Get total salary (salary + allowances).
     */
    public function getTotalSalaryAttribute(): float
    {
        return ($this->salary ?? 0) +
               ($this->allowance ?? 0) +
               ($this->housing_allowance ?? 0);
    }

    /**
     * Get current experience duration.
     */
    public function getExperienceDurationAttribute(): ?string
    {
        if (!$this->experience_from) {
            return null;
        }

        $endDate = $this->experience_to ?? now();
        $diff = $this->experience_from->diff($endDate);

        $parts = [];
        if ($diff->y > 0) {
            $parts[] = $diff->y . ' year' . ($diff->y > 1 ? 's' : '');
        }
        if ($diff->m > 0) {
            $parts[] = $diff->m . ' month' . ($diff->m > 1 ? 's' : '');
        }

        return implode(', ', $parts) ?: 'Less than a month';
    }

    /**
     * Get profile photo URL.
     */
    public function getProfilePhotoUrlAttribute(): ?string
    {
        if ($this->photo && file_exists(public_path($this->photo))) {
            return asset($this->photo);
        }

        return asset('images/default-avatar.png');
    }

    /**
     * Get full name (alias for employee_name).
     */
    public function getFullNameAttribute(): string
    {
        return $this->employee_name;
    }

    /**
     * Get initials from name.
     */
    public function getInitialsAttribute(): string
    {
        $nameParts = explode(' ', $this->employee_name);
        $initials = '';

        foreach ($nameParts as $part) {
            if (!empty($part)) {
                $initials .= strtoupper(substr($part, 0, 1));
            }
        }

        return substr($initials, 0, 2);
    }

    // ==================== MUTATORS ====================

    /**
     * Set the employee name to proper case.
     */
    public function setEmployeeNameAttribute($value): void
    {
        $this->attributes['employee_name'] = ucwords(strtolower(trim($value)));
    }

    /**
     * Set the email to lowercase.
     */
    public function setEmailAttribute($value): void
    {
        $this->attributes['email'] = $value ? strtolower(trim($value)) : null;
    }

    /**
     * Set the phone number to consistent format.
     */
    public function setPhoneNumberAttribute($value): void
    {
        $this->attributes['phone_number'] = $value ? preg_replace('/[^0-9+]/', '', $value) : null;
    }

    // ==================== SCOPES ====================

    /**
     * Scope a query to only include male jigjiga.
     */
    public function scopeMale($query)
    {
        return $query->where('gender', 'Male');
    }

    /**
     * Scope a query to only include female jigjiga.
     */
    public function scopeFemale($query)
    {
        return $query->where('gender', 'Female');
    }

    /**
     * Scope a query to only include jigjiga by job title.
     */
    public function scopeByJobTitle($query, $title)
    {
        return $query->where('job_title', 'LIKE', "%{$title}%");
    }

    /**
     * Scope a query to only include jigjiga by region.
     */
    public function scopeByRegion($query, $region)
    {
        return $query->where('region', $region);
    }

    /**
     * Scope a query to only include jigjiga by education level.
     */
    public function scopeByEducationLevel($query, $level)
    {
        return $query->where('education_level', $level);
    }

    /**
     * Scope a query to only include jigjiga by marital status.
     */
    public function scopeByMaritalStatus($query, $status)
    {
        return $query->where('marital_status', $status);
    }

    /**
     * Scope a query to only include jigjiga hired between dates.
     */
    public function scopeHiredBetween($query, $startDate, $endDate)
    {
        return $query->whereBetween('hire_date', [$startDate, $endDate]);
    }

    /**
     * Scope a query to only include jigjiga born between dates.
     */
    public function scopeBornBetween($query, $startDate, $endDate)
    {
        return $query->whereBetween('date_of_birth', [$startDate, $endDate]);
    }

    /**
     * Scope a query to only include jigjiga with COC certificate.
     */
    public function scopeWithCoc($query)
    {
        return $query->where('coc_certificate', true);
    }

    /**
     * Scope a query to only include jigjiga with disability.
     */
    public function scopeWithDisability($query)
    {
        return $query->whereNotNull('disability_type');
    }

    /**
     * Scope a query to only include jigjiga with salary above amount.
     */
    public function scopeSalaryAbove($query, $amount)
    {
        return $query->where('salary', '>=', $amount);
    }

    /**
     * Scope a query to only include jigjiga with salary below amount.
     */
    public function scopeSalaryBelow($query, $amount)
    {
        return $query->where('salary', '<=', $amount);
    }

    /**
     * Scope a query to order by name.
     */
    public function scopeOrderByName($query, $direction = 'asc')
    {
        return $query->orderBy('employee_name', $direction);
    }

    /**
     * Scope a query to order by hire date.
     */
    public function scopeOrderByHireDate($query, $direction = 'desc')
    {
        return $query->orderBy('hire_date', $direction);
    }

    // ==================== RELATIONSHIPS ====================

    /**
     * Get the payments for the employee.
     */
    public function payments()
    {
        return $this->hasMany(EmployeePayment::class, 'employee_id', 'id');
    }

    /**
     * Get the current month payment.
     */


    // ==================== CUSTOM METHODS ====================

    /**
     * Check if employee has paid for current month.
     */
    public function hasPaidForCurrentMonth(): bool
    {
        return $this->payments()
            ->whereMonth('payment_date', now()->month)
            ->whereYear('payment_date', now()->year)
            ->exists();
    }

    /**
     * Get employee status (active/inactive).
     */
    public function getStatusAttribute(): string
    {
        if ($this->trashed()) {
            return 'Inactive';
        }

        return 'Active';
    }

    /**
     * Get status badge class.
     */
    public function getStatusBadgeClassAttribute(): string
    {
        if ($this->trashed()) {
            return 'badge bg-danger';
        }

        return 'badge bg-success';
    }

    /**
     * Format salary as currency.
     */
    public function formatSalary($amount = null): string
    {
        $value = $amount ?? $this->salary;

        if (!$value) {
            return 'N/A';
        }

        return number_format($value, 2) . ' ETB';
    }

    /**
     * Generate employee code.
     */
    public static function generateFileNumber(): string
    {
        $year = now()->format('Y');
        $lastEmployee = self::whereYear('created_at', now()->year)
            ->orderBy('id', 'desc')
            ->first();

        if ($lastEmployee && preg_match('/(\d+)$/', $lastEmployee->file_number, $matches)) {
            $nextNumber = intval($matches[1]) + 1;
        } else {
            $nextNumber = 1;
        }

        return 'EMP' . $year . str_pad($nextNumber, 4, '0', STR_PAD_LEFT);
    }

    // ==================== BOOT METHOD ====================

    /**
     * The "booted" method of the model.
     */
    protected static function booted()
    {
        static::creating(function ($employee) {
            // Auto-generate file number if not provided
            if (empty($employee->file_number)) {
                $employee->file_number = self::generateFileNumber();
            }
        });

        static::updating(function ($employee) {
            // Add any update logic here
        });
    }
}
