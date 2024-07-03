<?php

namespace Database\Seeders;

use App\Models\SalaryCategory;
use Illuminate\Database\Seeder;

class SalaryCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        SalaryCategory::truncate();

        $salary_category = new SalaryCategory();
        $salary_category->title = 'Regular';
        $salary_category->created_by = 1;
        $salary_category->status = 1;
        $salary_category->save();

        $salary_category = new SalaryCategory();
        $salary_category->title = 'Due';
        $salary_category->created_by = 1;
        $salary_category->status = 1;
        $salary_category->save();

        $salary_category = new SalaryCategory();
        $salary_category->title = 'Overtime';
        $salary_category->created_by = 1;
        $salary_category->status = 1;
        $salary_category->save();

        $salary_category = new SalaryCategory();
        $salary_category->title = 'Bonus';
        $salary_category->created_by = 1;
        $salary_category->status = 1;
        $salary_category->save();

        $salary_category = new SalaryCategory();
        $salary_category->title = 'Special';
        $salary_category->created_by = 1;
        $salary_category->status = 1;
        $salary_category->save();
    }
}
