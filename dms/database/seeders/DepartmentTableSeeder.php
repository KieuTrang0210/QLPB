<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use App\Models\Department;


class DepartmentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create(); 
        for ($i = 0; $i < 10; $i++) { 
        Department::create([
            'name' => $faker->name,
            'location' => $faker->address,
            'manager_id' => $faker->unique()->numberBetween(1,10)
        ]);
}

    }
}
