<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\Department;
use Illuminate\Support\Facades\Validator;

class DepartmentController extends Controller
{

    public function search(Request $request){
        $search = $request->input('search');
        $departments = Department::where(function($query) use ($search){
                $query->where('D_No', 'like', "%$search%")
                ->orWhere('location', 'like', "%$search%");})

                ->orWhereHas('manager', function($query) use ($search){
                    $query->where('name', 'like', "%$search%");})

                ->paginate(5);

        return view('layouts.home', compact('departments', 'search'));
    }

    // form thêm 
    public function create(){
        $employees = Employee::all();
        return view('departments.create', compact('employees'));
    }

    // thêm vào csdl
    public function store(Request $request){

        $data = $request->all();
        $validator = Validator::make($data, [
            'name' => 'required|max:100',
            'location' => 'required',
            'manager_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect()->route('departments.create')->with('error', 'Invalid input data!');
        }
    
        $exist = Department::where('manager_id', $data['manager_id'])->first();
        if($exist){
            return redirect()->route('departments.create')->with('error', 'Employee is already a manager!');
        }

        $department = Department::create($data);
        if($department) {
            return redirect()->route('home')->with('success', 'Create success!');
        } else {
            return redirect()->route('departments.create')->with('error', 'Create failed!');
        }
    }

    // form hiển thị chi tiết
    public function show($id){
        $department = Department::where('D_No', $id)->first();
        return view('departments.show', compact('department'));
    }

        // Form sửa
    public function edit($id){
        $department = Department::where('D_No', $id)->first();
        $employees = Employee::all();
        return view('departments.edit', compact('department', 'employees'));
    }

    // lưu vào csdl
    public function update(Request $request, $id){
        $data = $request->all();
        $validator = Validator::make($data, [
            'name' => 'required|max:100',
            'location' => 'required',
            'manager_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect()->route('departments.edit', ['id' => $id])->with('error', 'Invalid input data!');
        }

        $department = Department::where('D_No', $id)->first();
        if(!$department) {
            return redirect()->route('departments.edit', ['id' => $id])->with('error', 'Edit failed!');
        }
    
        $currentManagerId = $department->manager_id;

        // Nếu người quản lý đã bị thay đổi 
        if($data['manager_id'] != $currentManagerId) {
            // xem người quản lý mới mà mình chọn có đang làm quản lý phòng khác không
            $exist = Department::where('manager_id', $data['manager_id'])->first();
            if($exist){
                return redirect()->route('departments.edit', ['id' => $id])->with('error', 'Employee is already a manager!');
            }
        }   
        
        $department->update($data);
            return redirect()->route('home')->with('success', 'Edit success!');
    }

    // xóa
    public function delete($id){
        $department = Department::where('D_No', $id)->first();
        if($department) {
            $department->delete();
            return redirect()->route('home')->with('success', 'Department deleted successfully');
        } else {
            return redirect()->route('home')->with('error', 'Department deleted failed!');
        }
    }

}
