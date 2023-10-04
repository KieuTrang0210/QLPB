<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Employee;

class Department extends Model
{
    public $timestamps = false;
    protected $primaryKey = 'D_No';
    use HasFactory;

    protected $fillable = [
        'name',
        'location',
        'manager_id'
    ];

    public function employees(){
        return $this->hasMany(Employee::class);
    }

    public function manager(){
        return $this->hasOne(Employee::class, 'Id', 'manager_id');
    }

}
