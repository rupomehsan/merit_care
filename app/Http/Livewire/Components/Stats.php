<?php

namespace App\Http\Livewire\Components;

use App\Models\Institute\InstituteBranch;
use App\Models\Institute\InstituteClassBatchExam;
use App\Models\Institute\InstituteStudent;
use App\Models\Institute\InstituteTeacher;
use Livewire\Component;

class Stats extends Component
{
    public $stats;
    public function render()
    {
        $student_count = InstituteStudent::where('status', 1)->count();
        $teacher_count = InstituteTeacher::where('status', 1)->count();
        $branch_count = InstituteBranch::where('status', 1)->count();
        $exam_count = InstituteClassBatchExam::count();

        $this->stats = [
            'student' => $student_count,
            'teacher' => $teacher_count,
            'branch' => $branch_count,
            'exam' => $exam_count,
        ];
        return view('livewire.components.stats');
    }
}
