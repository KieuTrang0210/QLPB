<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use App\Models\Dependent;

class DependentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create(); 
        for ($i = 0; $i < 30; $i++) { 
            Dependent::create([
                'employee_id' => $faker->numberBetween(1,20),
                'dependent_name' => $faker->name,
                'gender' => $faker->randomElement(['Male', 'Female']),
                'relationship' => $faker->randomElement(['Wife', 'Husband', 'Dad', 'Mom'])
            ]);
        };
    }
}
