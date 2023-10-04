@extends('layouts.base')

@section('title', 'Create')

@section('main')
    <div class="container">
        <!-- Thông báo thêm thất bại -->
        @if(session('error'))
            <div class="toast align-items-center text-white bg-danger border-0 mx-auto mt-3" role="alert" aria-live="assertive" aria-atomic="true" id="myToast">
                <div class="d-flex">
                    <div class="toast-body">
                        {{ session('error') }}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        @endif

        <!-- Quay lại trang chủ -->
        <a href="{{route('home')}}" class="btn btn-primary mt-3"><i class="bi bi-house-door-fill"></i></a>

        <!-- Title -->
        <h2 class="text-center text-success mb-3">Create a department</h2>

        <!-- Form thêm department -->
        <form action="{{route('departments.store')}}" method="post">
            @csrf
            <div class="form-group mb-3">
                <div class="row">
                    <div class="col-md-2 text-end my-auto">
                        <label for="name">Name:</label>
                    </div>
                    
                    <div class="col-md-10">
                        <input type="text" name="name" id="name" class="form-control" placeholder="" aria-describedby="helpId" required>
                    </div>
                </div>
            </div>

            <div class="form-group mb-3">
                <div class="row">
                    <div class="col-md-2 text-end my-auto">
                        <label for="location">Loaction:</label>
                    </div>
                    
                    <div class="col-md-10">
                        <input type="text" name="location" id="location" class="form-control" placeholder="" aria-describedby="helpId" required>
                    </div>
                </div>
            </div>

            <div class="form-group mb-3">
                <div class="row">
                    <div class="col-md-2 text-end my-auto">
                        <label for="manager">Manager:</label>
                    </div>
                    
                    <div class="col-md-10">
                        <select class="form-select" name="manager_id" id="manager_id" required>
                            <option selected>--None--</option>
                            @foreach ($employees as $employee)
                                <option value="{{$employee->Id}}">{{$employee->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="d-flex">
                <button class="btn btn-success ms-auto" type="submit">Create</button>
            </div>   
        </form>
    </div>
@endsection
