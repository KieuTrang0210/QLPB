<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use App\Models\Project;

class ProjectTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create(); 
        for ($i = 0; $i < 30; $i++) { 
            Project::create([
                'name' => $faker->sentence(3),
                'department_id' => $faker->numberBetween(1,10)
            ]);
        };

    }
}
