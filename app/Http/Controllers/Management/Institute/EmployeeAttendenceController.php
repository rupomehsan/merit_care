<?php

namespace App\Http\Controllers\Management\Institute;

use App\Http\Controllers\Controller;
use App\Models\Attendence;
use App\Models\Institute\InstituteBranch;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class EmployeeAttendenceController extends Controller
{
    // get the branch admin details from auth
    private function getBranchID() {
        $branch_admin = auth()->user()->load('branch_admin');
        
        if(count($branch_admin->branch_admin) > 0) {
            return $branch_admin->branch_admin[0]->branch_details->id;
        }else {
            return 0;
        }
    }
    public function all()
    {
        $query = User::where('status', 1);
        $students = $query->whereExists(function($query) {  
            $query->from('user_user_role')
            ->whereIn('user_user_role.user_role_id', [4,7])
                ->whereColumn('user_user_role.user_id', 'users.id');
        })
        ->whereExists(function($query) {  
            $query->from('institute_branch_institute_teacher')
                ->where('institute_branch_institute_teacher.institute_branch_id', $this->getBranchID());
        })
        ->leftJoin('attendences', function ($join) {
            $join->on('attendences.table_id', '=', 'users.id')
                ->where('attendences.table', '=', 'employee')
                ->where('attendences.date', request()->attendence_date);
        })
        ->select('users.*', 'attendences.present', 'attendences.date', 'attendences.start_time', 'attendences.end_time')
        ->get(); 

        return response()->json($students);
    }

    public function admin_all()
    {
        // dd('jere', request()->all());
        $query = User::where('status', 1);
        $central_branch = InstituteBranch::where('name', 'Central')->first();
        $students = $query->whereExists(function($query) use ($central_branch) {  
            $query->from('user_user_role')
            ->whereIn('user_user_role.user_role_id', [4,7])
                ->whereColumn('user_user_role.user_id', 'users.id');
        })
        ->whereExists(function($query) use ($central_branch) {  
            $query->from('institute_branch_user')
                ->where('institute_branch_user.institute_branch_id', $central_branch->id)
                ->whereColumn('institute_branch_user.user_id', 'users.id');
        })
        ->leftJoin('attendences', function ($join) {
            $join->on('attendences.table_id', '=', 'users.id')
                ->where('attendences.table', '=', 'employee')
                ->where('attendences.date', request()->attendence_date);
        })
        ->select('users.*', 'attendences.present', 'attendences.date', 'attendences.start_time', 'attendences.end_time')
        ->get(); 

        return response()->json($students);
    }

    public function single_teacher_attendence()
    {
        // dd(auth()->user()->id);
        $attendence = Attendence::where('table_id', auth()->user()->id)
        ->where('table', "employee")->with(['user'])
        ->get();
        return response()->json($attendence);
    }

    public function teacher_monthly_attendence()
    {
        // dd(request()->all());
        $attendence = Attendence::where('table_id', auth()->user()->id)
        ->where('table', "employee")->whereMonth('date', request()->month)->whereYear('date', request()->year)
        ->get();
        return response()->json($attendence);
    }

    public function employee_attendence()
    {
        // dd(request()->all());
        $attendence = Attendence::where('table_id', request()->employee_id)->where('date', request()->attendence_date)->first();
        // dd(request()->all());
        if($attendence == null) {
            $attendence = new Attendence();

            $user_details = User::where('id', request()->employee_id)->with('roles')->first();

            $user_type = '';
            $user_roles = $user_details->roles()->pluck('user_roles.role_serial')->toArray();
            
            if (in_array(4, $user_roles)) {
                $user_type = 'teacher';
            } else {
                $user_type = 'employee';
            }
            
            $attendence->table = 'employee';
            $attendence->type = $user_type;
            $attendence->branch_id = $this->getBranchID();
            $attendence->table_id = request()->employee_id;
            $attendence->date = request()->attendence_date;
            $attendence->start_time = request()->start_time;
            $attendence->end_time = request()->end_time;
            $attendence->present = request()->present;
            $attendence->save();
        }else{
            Attendence::where('table_id', request()->employee_id)
            ->where('table', 'employee')
            ->where('date', request()->attendence_date)
            ->delete();
        }
        return response()->json("Attendence updated!", 200);
    }

    

    public function employee_attendence_udpate() : object {
        $attendence = Attendence::where('table_id', request()->employee_id)->where('date', request()->attendence_date)->first();
        if($attendence != null) {
            $attendence->table = 'employee';
            $attendence->end_time = request()->end_time;
            $attendence->update();
        }
        return response()->json("Attendence updated!", 200);
    }

    public function show($id)
    {
        # code...
    }
}
