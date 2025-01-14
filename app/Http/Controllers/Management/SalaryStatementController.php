<?php

namespace App\Http\Controllers\Management;

use App\Http\Controllers\Controller;
use App\Models\Accounts\AccountCategory;
use App\Models\Accounts\BranchAccount;
use App\Models\Accounts\BranchAccountLog;
use App\Models\Attendence;
use App\Models\SalaryCategory;
use App\Models\User;
use App\Models\UserManagement\UserSalaryStatement;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SalaryStatementController extends Controller
{
    public function all()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;


        $query = UserSalaryStatement::where('branch_id', $this->getBranchID())->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('date', $key)
                    ->orWhere('salary_amount', 'LIKE', '%' . $key . '%')
                    ->orWhere('date', 'LIKE', '%' . $key . '%');
            });
        }

        $users = $query->with(['user', 'category'])->paginate($paginate);
        return response()->json($users);
    }

    public function salary_categories()
    {
        $salary_categories = SalaryCategory::get();
        return response()->json($salary_categories);
    }

    public function admin_salary()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;


        $query = UserSalaryStatement::orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('date', $key)
                    ->orWhere('salary_amount', 'LIKE', '%' . $key . '%')
                    ->orWhere('date', 'LIKE', '%' . $key . '%');
            });
        }

        if (request()->has('branch_id')) {
            $query = $query->where('branch_id', request()->branch_id);
        }

        $users = $query->with(['user', 'branch', 'category'])->paginate($paginate);
        return response()->json($users);
    }

    public function teacher_salary_statements()
    {

        $query = UserSalaryStatement::where('user_id', auth()->user()->id);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('date', $key)
                    ->orWhere('salary_amount', 'LIKE', '%' . $key . '%')
                    ->orWhere('date', 'LIKE', '%' . $key . '%');
            });
        }

        $users = $query->with(['user', 'category'])->paginate(15);
        return response()->json($users);
    }

    // get the branch admin details from auth
    private function getBranchID()
    {
        $branch_admin = auth()->user()->load('branch_admin');

        return $branch_admin->branch_admin[0]->branch_details->id;
    }

    public function get_all_employees()
    {
        $query = User::where('status', 1);

        $query->whereExists(
            function ($query) {
                $query->from('user_user_role')
                    ->whereIn('user_user_role.user_role_id', [4, 7])
                    ->whereColumn('user_user_role.user_id', 'users.id');
            }
        )
            ->whereExists(function ($query) {
                $query->from('institute_branch_user')
                    ->where('institute_branch_user.institute_branch_id', $this->getBranchID())
                    ->whereColumn('institute_branch_user.user_id', 'users.id');
            });


        $query->withSum(['salary_statements' => function ($q) {
            $q->where('branch_id', $this->getBranchID());
        }], 'salary_amount');

        $users = $query->with(['salary_statements', 'user_salary'])->get();

        return response()->json($users);
    }

    public function get_all_employees_by_month($month)
    {
        // dd(request()->all());
        $query = User::where('status', 1);

        $query->whereExists(
            function ($query) {
                $query->from('user_user_role')
                    ->whereIn('user_user_role.user_role_id', [4, 7])
                    ->whereColumn('user_user_role.user_id', 'users.id');
            }
        )
            ->whereExists(function ($query) {
                $query->from('institute_branch_user')
                    ->where('institute_branch_user.institute_branch_id', $this->getBranchID())
                    ->whereColumn('institute_branch_user.user_id', 'users.id');
            });


        $query->withSum(['salary_statements' => function ($q) use ($month) {
            $q->where('branch_id', $this->getBranchID())->where('month', $month);
        }], 'salary_amount');

        $users = $query->with(['salary_statements', 'user_salary'])->get();

        foreach ($users as $key => $user) {
            $month_filter = Carbon::parse($month)->toDate();

            $employee_attendence_data = Attendence::where('table', 'employee')
                ->whereMonth('date', $month_filter)
                ->where('table_id', $user->id)->where('present', 1)->get();

            if ($employee_attendence_data !== null) {
                foreach ($employee_attendence_data as $att_data) {

                    $start_time = Carbon::parse($att_data->start_time);
                    $end_time = Carbon::parse($att_data->end_time);
                    //
                    $hour = $start_time->diffInHours($end_time);
                    $user['total_working_hour'] += $hour;
                }
                $user['monthly_hourly_calculated_salary'] = 0;
                if (isset($user->user_salary->hourly_salary)) {
                    $user['monthly_hourly_calculated_salary'] = $user->user_salary->hourly_salary * $user['total_working_hour'];
                }
            } else {
                $user['total_working_hour'] = 0;
            }
            $total_monthly_present_day = Attendence::where('table', 'employee')
                ->whereMonth('date', $month_filter)
                ->where('table_id', $user->id)->where('present', 1)->count();


            // total present day of the employee of the current month
            $user['total_monthly_present_day'] = $total_monthly_present_day;

            // if total_monthly_attendance is not set, set it to 24
            if (is_null($user->total_monthly_attendance)) {
                $user_fixed_attendence = 24;
                $user['total_monthly_attendance'] = 24;
            } else {
                $user_fixed_attendence = $user->total_monthly_attendance;
            }


            // daily fixed salary
            if ($user->user_salary !== null) {
                $daily_fixed_salary = $user->user_salary->salary / $user_fixed_attendence;
            }
            // calculate daily salary according to attendence


            $monthly_calculated_salary = $daily_fixed_salary * $total_monthly_present_day;

            $user['daily_fixed_salary'] = $daily_fixed_salary;
            // $user['daily_calculated_salary'] = $daily_calculated_salary;

            $user['monthly_calculated_salary'] = $monthly_calculated_salary;
        }

        return response()->json($users);
    }

    public function show($id)
    {
        $data = UserSalaryStatement::where('id', $id)->where('branch_id', $this->getBranchID())->with('user')->first();
        if (!$data) {
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['role' => ['data not found']],
            ], 422);
        }
        return response()->json($data, 200);
    }

    public function admin_show($id)
    {
        $data = UserSalaryStatement::where('id', $id)->with(['user', 'category'])->first();
        if (!$data) {
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['role' => ['data not found']],
            ], 422);
        }
        return response()->json($data, 200);
    }

    public function store()
    {
        // dd(request()->all());
        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'salary_amount' => ['required'],
            'date' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new UserSalaryStatement();
        $data->user_id = request()->user_id;
        $data->branch_id = $this->getBranchID();
        $data->salary_amount = request()->salary_amount;
        $data->date = Carbon::parse(request()->date);
        $data->month = Carbon::parse(request()->date)->format('F');
        $data->salary_category_id = request()->salary_category_id;
        $data->save();

        $account_category_id = AccountCategory::where('title', 'Salaries and Wages')->pluck('id')->first();
        $account_id = BranchAccount::where('title', 'cash')->where('branch_id', $this->getBranchID())->where('is_cash', 1)->pluck('id')->first();

        if ($account_category_id == null) {
            $account_category = new AccountCategory();
            $account_category->title = "Salaries and Wages";
            $account_category->description = "Salaries and Wages of the employees";
            $account_category->is_visible = 1;
            $account_category->save();
            $account_category_id = $account_category->id;
        }

        $branch_account_log = new BranchAccountLog();
        $branch_account_log->branch_id = $this->getBranchID();
        $branch_account_log->account_category_id = $account_category_id;
        $branch_account_log->description = "Salary of the employees";
        $branch_account_log->account_id = $account_id;
        $branch_account_log->amount = $data->salary_amount;
        $branch_account_log->type = 'debit';
        $branch_account_log->is_expense = 1;
        $branch_account_log->save();

        return response()->json($data, 200);
    }

    public function submit_employee_salary()
    {

        // dd(request()->all());
        foreach (request()->employee_data as $key => $employee) {
            $salary_check = UserSalaryStatement::where('user_id', $employee['id'])
                ->where('month', $employee['month'])->first();
            if ($salary_check != null && $salary_check->salary_amount != $employee['user_salary']['salary']) {
                $data = new UserSalaryStatement();
                $data->user_id = $employee['id'];
                $data->branch_id = $this->getBranchID();
                $data->salary_amount = $employee['salary_amount'];
                $data->date = Carbon::now()->format('y-m-d');
                $data->month = $employee['month'];
                $data->salary_type = "Monthly Salary";
                $data->save();

                $account_category_id = AccountCategory::where('title', 'Salaries and Wages')->pluck('id')->first();
                $account_id = BranchAccount::where('title', 'cash')->where('branch_id', $this->getBranchID())->where('is_cash', 1)->pluck('id')->first();

                if ($account_category_id == null) {
                    $account_category = new AccountCategory();
                    $account_category->title = "Salaries and Wages";
                    $account_category->description = "Salaries and Wages of the employees";
                    $account_category->is_visible = 1;
                    $account_category->save();
                    $account_category_id = $account_category->id;
                }

                $branch_account_log = new BranchAccountLog();
                $branch_account_log->branch_id = $this->getBranchID();
                $branch_account_log->account_category_id = $account_category_id;
                $branch_account_log->description = "Salary of the employees";
                $branch_account_log->account_id = $account_id;
                $branch_account_log->amount = $data->salary_amount;
                $branch_account_log->type = 'debit';
                $branch_account_log->is_expense = 1;
                $branch_account_log->save();
            } else if ($salary_check == null) {
                $data = new UserSalaryStatement();
                $data->user_id = $employee['id'];
                $data->branch_id = $this->getBranchID();
                $data->salary_amount = $employee['salary_amount'];
                $data->date = Carbon::now()->format('y-m-d');
                $data->month = $employee['month'];
                $data->salary_type = "Monthly Salary";
                $data->save();

                $account_category_id = AccountCategory::where('title', 'Salaries and Wages')->pluck('id')->first();
                $account_id = BranchAccount::where('title', 'cash')->where('branch_id', $this->getBranchID())->where('is_cash', 1)->pluck('id')->first();

                if ($account_category_id == null) {
                    $account_category = new AccountCategory();
                    $account_category->title = "Salaries and Wages";
                    $account_category->description = "Salaries and Wages of the employees";
                    $account_category->is_visible = 1;
                    $account_category->save();
                    $account_category_id = $account_category->id;
                }

                $branch_account_log = new BranchAccountLog();
                $branch_account_log->branch_id = $this->getBranchID();
                $branch_account_log->account_category_id = $account_category_id;
                $branch_account_log->description = "Salary of the employees";
                $branch_account_log->account_id = $account_id;
                $branch_account_log->amount = $data->salary_amount;
                $branch_account_log->type = 'debit';
                $branch_account_log->is_expense = 1;
                $branch_account_log->save();
            }
        }


        return response()->json("Salary submitted successfully", 200);
    }

    public function update()
    {
        $data = UserSalaryStatement::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['category not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'salary_amount' => ['required'],
            'date' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->user_id = request()->user_id;
        $data->branch_id = $this->getBranchID();
        $data->salary_amount = request()->salary_amount;
        $data->date = Carbon::parse(request()->date);
        $data->save();

        return response()->json($data, 200);
    }


    public function destroy()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:user_salary_statements,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = UserSalaryStatement::where('id', request()->id)->delete();

        return response()->json([
            'result' => 'Deleted successfully',
        ], 200);
    }

    public function bulk_import()
    {
        $validator = Validator::make(request()->all(), [
            'data' => ['required', 'array'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        foreach (request()->data as $item) {
            $item['created_at'] = $item['created_at'] ? Carbon::parse($item['created_at']) : Carbon::now()->toDateTimeString();
            $item['updated_at'] = $item['updated_at'] ? Carbon::parse($item['updated_at']) : Carbon::now()->toDateTimeString();
            $item = (object) $item;
            $check = UserSalaryStatement::where('id', $item->id)->first();
            if (!$check) {
                try {
                    UserSalaryStatement::create((array) $item);
                } catch (\Throwable $th) {
                    return response()->json([
                        'err_message' => 'validation error',
                        'errors' => $th->getMessage(),
                    ], 400);
                }
            }
        }

        return response()->json('success', 200);
    }
}
