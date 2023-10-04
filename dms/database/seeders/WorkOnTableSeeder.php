<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as Faker;
use App\Models\WorkOn;

class WorkOnTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create(); 
        for ($i = 0; $i < 50; $i++) { 

            $employeeId = $faker->numberBetween(1,20);
            $projectId = $faker->numberBetween(1,30);

            // Kiểm tra nếu cặp khóa đã tồn tại, thử lại cho đến khi tạo được một cặp khóa không trùng lặp
            while (WorkOn::where('employee_id', $employeeId)->where('project_id', $projectId)->exists()) {
                $employeeId = $faker->numberBetween(1,20);
                $projectId = $faker->numberBetween(1,30);
            }

            WorkOn::create([
                'employee_id' => $employeeId,
                'project_id' => $projectId,
                'hour' => $faker->numberBetween(1,50)
            ]);
        };

    }
}
