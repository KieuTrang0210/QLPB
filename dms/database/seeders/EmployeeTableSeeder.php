<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use App\Models\Employee;

class EmployeeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create(); 
        for ($i = 0; $i < 10; $i++) { 
            Employee::create([
                'name' => $faker->name,
                'address' => $faker->address,
                'gender' => $faker->randomElement(['Male', 'Female']),
                'dob' => $faker->date('Y-m-d', 'now'),
                'doj' => $faker->date('Y-m-d', 'now'),
                //'department_id' => $i+1
                'department_id' => $faker->numberBetween(1,10)
            ]);
        };
    }
}
