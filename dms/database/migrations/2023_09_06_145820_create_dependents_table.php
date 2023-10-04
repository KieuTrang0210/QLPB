<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('dependents', function (Blueprint $table) {
            $table->unsignedInteger('employee_id');
            $table->string('dependent_name');
            $table->string('gender', 6);
            $table->string('relationship', 20);
            
            $table->primary(['employee_id', 'dependent_name']);
            $table->foreign('employee_id')->references('Id')->on('employees')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dependents');
    }
};
