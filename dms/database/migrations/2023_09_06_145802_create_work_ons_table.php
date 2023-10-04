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
        Schema::create('work_ons', function (Blueprint $table) {
            $table->unsignedInteger('employee_id');
            $table->unsignedInteger('project_id');
            $table->integer('hour');

            $table->primary(['employee_id', 'project_id']);
            $table->foreign('employee_id')->references('Id')->on('employees')->onDelete('cascade');
            $table->foreign('project_id')->references('P_No')->on('projects')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('work_ons');
    }
};
