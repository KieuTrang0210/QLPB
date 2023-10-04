<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;

class Employee extends Model
{
    public $timestamps = false;
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'gender',
        'dob',
        'doj',
        'department_id'
    ];

    public function department(){
        return $this->belongsTo(Department::class, 'D_No', 'department_id');
    }
}
