<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Department;

class HomeController extends Controller
{
    public function getAllDepartments(){
        $departments = Department::orderBy('D_No', 'desc')->paginate(5);
        return view('layouts.home', compact('departments'));
    }
}
