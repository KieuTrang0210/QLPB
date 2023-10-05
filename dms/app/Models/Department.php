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

    public static function search($search){
        return Department::where(function($query) use ($search){
            $query->where('D_No', 'like', "%$search%")
            ->orWhere('location', 'like', "%$search%");})

            ->orWhereHas('manager', function($query) use ($search){
                $query->where('name', 'like', "%$search%");})

            ->paginate(5);
    }

}
