@extends('layouts.base')

@section('title', 'Department Management')

@section('main')
    <div class="container">
        <!-- Thông báo thêm thành công -->
        @if(session('success'))
            <div class="toast align-items-center text-white bg-success border-0 mx-auto mt-3" role="alert" aria-live="assertive" aria-atomic="true" id="myToast">
                <div class="d-flex">
                    <div class="toast-body">
                        {{ session('success') }}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        @endif

          <!-- Title -->
        <a href="{{route('home')}}" class="py-3 fs-2 fw-bolder text-dark text-decoration-none d-flex justify-content-center">Department Management</a>
        <hr>

        <div class="row py-3">
            <div class="col-md-6">
                <a href="{{route('departments.create')}}" class="btn btn-success"> <i class="bi bi-plus-lg"></i> Add New Department</a>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <form action="{{ route('departments.search') }}" method="get">
                        <div class="input-group">
                            <input class="form-control" name="search" placeholder="Search..." value="{{ isset($search) ? $search : '' }}">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bảng hiển thị danh sách phòng ban -->
        <table class="table table-striped">
            <thead>
                <tr class="text-center">
                    <th scope="col">D_No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Location</th>
                    <th scope="col">Manager</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($departments as $department)
                    <tr>
                        <th scope="row" class="text-center">{{ $department->D_No }}</th>
                        <td class="text-center">{{ $department->name }}</td>
                        <td class="text-center">{{ $department->location }}</td>
                        <td class="text-center">{{ $department->manager->name }}</td>
                        
                        <td class="d-flex justify-content-center gap-2">
                            <a href="{{ route('departments.show', ['id' => $department->D_No]) }}" class="btn btn-info"> <i class="bi bi-eye-fill"></i> </a>
                            <a href="{{ route('departments.edit', ['id' => $department->D_No]) }}" class="btn btn-warning"> <i class="bi bi-pencil-fill"></i> </a>
                            <form action="{{route('departments.delete', ['id' => $department->D_No])}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger text-dark" onclick="return confirm('Are you sure you want to delete?')">  <i class="bi bi-trash3-fill"></i>  </button>
                            </form>
                        </td>
                    </tr>
                @endforeach   
            </tbody>
        </table>
      
        <!-- Hiển thị liên kết phân trang -->
        <div class="d-flex justify-content-center">
            {{ $departments->links() }}
        </div>
    </div>
@endsection
