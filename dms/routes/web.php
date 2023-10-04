<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DepartmentController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'getAllDepartments'])->name('home');

Route::get('/departments/create', [DepartmentController::class, 'create'])->name('departments.create');

Route::post('/departments/store', [DepartmentController::class, 'store'])->name('departments.store');

Route::get('/departments/{id}/show', [DepartmentController::class, 'show'])->name('departments.show');

Route::get('/departments/{id}/edit', [DepartmentController::class, 'edit'])->name('departments.edit');

Route::put('/departments/{id}', [DepartmentController::class, 'update'])->name('departments.update');

Route::delete('/departments/{id}', [DepartmentController::class, 'delete'])->name('departments.delete');