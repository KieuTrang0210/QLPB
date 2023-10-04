@extends('layouts.base')

@section('title', 'Show')

@section('main')
    <div class="container">
        <!-- Quay lại trang chủ -->
        <a href="{{route('home')}}" class="btn btn-primary mt-3"><i class="bi bi-house-door-fill"></i></a>

        <!-- Title -->
        <h2 class="text-center text-success mb-3">Details of a department</h2>

        <div class="form-group mb-3">
            <div class="row">
                <div class="col-md-2 text-end my-auto">
                    <label for="id">D_No:</label>
                </div>
                
                <div class="col-md-10">
                    <input type="text" name="D_No" id="D_No" class="form-control bg-light" value="{{ $department->D_No }}" readonly>
                </div>
            </div>
        </div>

        <div class="form-group mb-3">
            <div class="row">
                <div class="col-md-2 text-end my-auto">
                    <label for="name">Name:</label>
                </div>
                    
                <div class="col-md-10">
                    <input type="text" name="name" id="name" class="form-control" value="{{ $department->name }}" readonly>
                </div>
            </div>
        </div>

        <div class="form-group mb-3">
            <div class="row">
                <div class="col-md-2 text-end my-auto">
                    <label for="location">Location:</label>
                </div>
                    
                <div class="col-md-10">
                    <input type="text" name="location" id="location" class="form-control" value="{{ $department->location }}" readonly>
                </div>
            </div>
        </div>

        <div class="form-group mb-3">
            <div class="row">
                <div class="col-md-2 text-end my-auto">
                    <label for="manager">Manager:</label>
                </div>
                    
                <div class="col-md-10">
                    <input type="text" name="manager_id" id="manager_id" class="form-control" value="{{ $department->manager->name }}" readonly>
                </div>
            </div>
        </div>

        <div class="d-flex">
            <a href="{{route('home')}}" class="btn btn-danger ms-auto">Close</a>
        </div>   
    </div>
@endsection
