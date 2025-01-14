<?php

namespace App\Http\Controllers\Management\Institute;

use App\Http\Controllers\Controller;
use App\Models\Institute\InstituteBranch;
use App\Models\User;
use App\Models\UserSalary;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class EmployeeController extends Controller
{
    // get the branch admin details from auth
    private function getBranchID() {
        $branch_admin = auth()->user()->load('branch_admin');
        
        return $branch_admin->branch_admin[0]->branch_details->id;
    }
    
    public function all()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $status = 1;
        if (request()->has('status')) {
            $status = request()->status;
        }

        $query = User::where('status', $status)->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('first_name', $key)
                    ->orWhere('last_name', $key)
                    ->orWhere('user_name', $key)
                    ->orWhere('email', $key)
                    ->orWhere('mobile_number', $key)
                    ->orWhere('status', $key)
                    ->orWhere('first_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('last_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('user_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('email', 'LIKE', '%' . $key . '%')
                    ->orWhere('mobile_number', 'LIKE', '%' . $key . '%')
                    ->orWhere('status', 'LIKE', '%' . $key . '%');
            });
        }

        $users = $query->whereExists(
            function($query) {  
                $query->from('user_user_role')
                    ->whereIn('user_user_role.user_role_id', [7,4])
                    ->whereColumn('user_user_role.user_id', 'users.id');
            })
            ->whereExists(function($query) {  
                $query->from('institute_branch_user')
                    ->where('institute_branch_user.institute_branch_id', $this->getBranchID())
                    ->whereColumn('institute_branch_user.user_id', 'users.id');
            })
            ->with(['user_salary'])->paginate($paginate);
        return response()->json($users);
    }



    public function admin_employee() : object {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $status = 1;
        if (request()->has('status')) {
            $status = request()->status;
        }

        $query = User::where('status', $status)->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('first_name', $key)
                    ->orWhere('last_name', $key)
                    ->orWhere('user_name', $key)
                    ->orWhere('email', $key)
                    ->orWhere('mobile_number', $key)
                    ->orWhere('status', $key)
                    ->orWhere('first_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('last_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('user_name', 'LIKE', '%' . $key . '%')
                    ->orWhere('email', 'LIKE', '%' . $key . '%')
                    ->orWhere('mobile_number', 'LIKE', '%' . $key . '%')
                    ->orWhere('status', 'LIKE', '%' . $key . '%');
            });
        }

        $central_branch = InstituteBranch::where('name', 'Central')->first();
        $query = $query->whereExists(
            function($query) use ($central_branch) {  
                $query->from('institute_branch_user')
                    ->where('institute_branch_user.institute_branch_id', $central_branch->id)
                    ->whereColumn('institute_branch_user.user_id', 'users.id');
            });
        

        

        $users = $query->whereExists(
            function($query) {  
                $query->from('user_user_role')
                    ->whereIn('user_user_role.user_role_id', [7,4])
                    ->whereColumn('user_user_role.user_id', 'users.id');
            })
            ->whereExists(function($query) {  
                $query->from('institute_branch_user')
                    ->whereColumn('institute_branch_user.user_id', 'users.id');
            })
            ->with(['branch_user'])->paginate($paginate);
        return response()->json($users);
    }

    public function admin_show($id)
    {
        $select = [
            'id',
            'first_name',
            'last_name',
            'user_name',
            'email',
            'mobile_number',
            'photo',
            'designation',
            'salary',
            'created_at',
            'updated_at'
        ];
        if (request()->has('select_all') && request()->select_all) {
            $select = "*";
        }
        $user = User::where('id', $id)
            ->select($select)
            ->with(['roles' => function ($q) {
                $q->whereIn('role_serial', [7,4]);
            }])->first();
        if ($user) {
            return response()->json($user, 200);
        } else {
            return response()->json([
                'err_message' => 'data not found',
                'errors' => [
                    'user' => [],
                ],
            ], 404);
        }
    }

    public function show($id)
    {
        $select = [
            'id',
            'first_name',
            'last_name',
            'user_name',
            'email',
            'mobile_number',
            'branch_code',
            'address',
            'designation',
            'salary',
            'total_monthly_attendance',
            'photo',
            'created_at',
            'updated_at'
        ];
        if (request()->has('select_all') && request()->select_all) {
            $select = "*";
        }
        $user = User::where('id', $id)
            ->select($select)
            ->with(['user_salary','roles' => function ($q) {
                $q->where('role_serial', 7);
            }])->first();
        if ($user) {
            return response()->json($user, 200);
        } else {
            return response()->json([
                'err_message' => 'data not found',
                'errors' => [
                    'user' => [],
                ],
            ], 404);
        }
    }

    public function store()
    {
        $validator = Validator::make(request()->all(), [
            'first_name' => ['required'],
            'last_name' => ['required'],
            'email' => ['required', 'unique:users'],
            'mobile_number' => ['required', 'unique:users'],
            'password' => ['required', 'min:8', 'confirmed'],
            'password_confirmation' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        
        $user = new User();
        $user->first_name = request()->first_name;
        $user->last_name = request()->last_name;
        $user->user_name = request()->first_name . request()->last_name . rand(0, 9999);
        $user->email = request()->email;
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->designation = request()->designation;
        $user->salary = request()->salary;
        $user->address = request()->address;
        $user->password = Hash::make(request()->password);
        $user->save();

        // if (count(request()->user_role_id))
        $user->roles()->attach([7]);

        $user->branch_user()->attach([$this->getBranchID()]);

        try {
            if (request()->hasFile('photo')) {
                $file = request()->file('photo');
                $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                $height = 200;
                $width = 200;
                
                $path .= $file->getClientOriginalExtension();
                Image::make($file)->fit($height, $width)->save(public_path($path));
                $user->photo = $path;
                
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        $branch = InstituteBranch::where('id', $this->getBranchID())->first();
        $user->branch_code = Str::slug("$branch->name $user->id", '-'); 
        $user->save();

        $user_salary = new UserSalary();
        $user_salary->user_id = $user->id;
        $user_salary->branch_id = $this->getBranchID();
        $salary =  request()->salary;
        $hourly_salary = request()->hourly_salary;
        $user_salary->salary =  floatval($salary);
        $user_salary->hourly_salary =  floatval($hourly_salary);
        $user_salary->save();

        return response()->json([
            'message' => 'success',
            'result' => $user->id,
        ], 200);
    }

    public function admin_store() {
        $validator = Validator::make(request()->all(), [
            'first_name' => ['required'],
            'last_name' => ['required'],
            'email' => ['required', 'unique:users'],
            'mobile_number' => ['required', 'unique:users'],
            'password' => ['required', 'min:8', 'confirmed'],
            'password_confirmation' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        
        $user = new User();
        $user->first_name = request()->first_name;
        $user->last_name = request()->last_name;
        $user->user_name = request()->first_name . request()->last_name . rand(0, 9999);
        $user->email = request()->email;
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->designation = request()->designation;
        $user->salary = request()->salary;
        $user->address = request()->address;
        $user->password = Hash::make(request()->password);
        $user->save();

        // if (count(request()->user_role_id))
        $user->roles()->attach([7]);
        $central_branch = InstituteBranch::where('name', 'Central')->first();
        $user->branch_user()->attach([$central_branch->id]);

        try {
            if (request()->hasFile('photo')) {
                $file = request()->file('photo');
                $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                $height = 200;
                $width = 200;
                
                $path .= $file->getClientOriginalExtension();
                Image::make($file)->fit($height, $width)->save(public_path($path));
                $user->photo = $path;
                
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        // $branch = InstituteBranch::where('id', $this->getBranchID())->first();
        $user->branch_code = Str::slug("$central_branch->name $user->id", '-'); 
        $user->save();

        $user_salary = new UserSalary();
        $user_salary->user_id = $user->id;
        $user_salary->branch_id = $central_branch->id;
        $salary =  request()->salary;
        $hourly_salary = request()->hourly_salary;
        $user_salary->salary =  floatval($salary);
        $user_salary->hourly_salary =  floatval($hourly_salary);
        $user_salary->save();

        return response()->json([
            'message' => 'success',
            'result' => $user->id,
        ], 200);
    }

    public function canvas_store()
    {
        $validator = Validator::make(request()->all(), [
            'first_name' => ['required'],
            'last_name' => ['required'],
            'user_role_id' => ['required', 'array'],
            'email' => ['required', 'unique:users'],
            'password' => ['required', 'min:8', 'confirmed'],
            'password_confirmation' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new User();
        $data->first_name = request()->first_name;
        $data->last_name = request()->last_name;
        $data->user_name = request()->first_name . request()->last_name . rand(0, 9999);
        $data->email = request()->email;
        $data->mobile_number = request()->mobile_number;
        $data->designation = request()->designation;
        $data->salary = request()->salary;
        $data->total_monthly_attendance = request()->total_monthly_attendance;
        $data->address = request()->address;
        $data->password = Hash::make(request()->password);
        $data->save();

        try {
            if (request()->hasFile('photo')) {
                $file = request()->file('photo');
                $path = 'uploads/users/pp-' . $data->id . rand(1000, 9999) . '.';
                $height = 200;
                $width = 200;
                
                $path .= $file->getClientOriginalExtension();
                Image::make($file)->fit($height, $width)->save(public_path($path));
                $data->photo = $path;
                
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        $branch = InstituteBranch::where('id', $this->getBranchID())->first();
        $data->branch_code = Str::slug("$branch->name $data->id", '-'); 
        $data->save();

        return response()->json([
            'message' => 'success',
            'result' => $data->id,
        ], 200);
    }

    public function update()
    {
        $rules = [
            'id' => ['required'],
            'first_name' => ['required'],
            'last_name' => ['required'],
            'email' => ['required'],
            'mobile_number' => ['required'],
        ];

        $user = User::find(request()->id);

        if (request()->has('password') && request()->password) {
            $rules['password'] = ['required', 'min:8', 'confirmed'];
            $rules['password_confirmation'] = ['required'];
        }
        if (request()->email != $user->email) {
            $rules['email'][] = 'unique:users';
        }
        if (request()->mobile_number != $user->mobile_number) {
            $rules['mobile_number'][] = 'unique:users';
        }
        if (request()->user_name != $user->user_name) {
            $rules['user_name'][] = 'unique:users';
        }

        $validator = Validator::make(request()->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user->first_name = request()->first_name;
        $user->last_name = request()->last_name;
        $user->user_name = request()->first_name . request()->last_name . rand(0, 9999);
        $user->email = request()->email;
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->designation = request()->designation;
        $user->salary = request()->salary;
        $user->address = request()->address;
        $user->password = Hash::make(request()->password);
        $user->save();

        
        $user->roles()->sync([7]);

        $user->branch_user()->sync([$this->getBranchID()]);


        try {
            if (request()->hasFile('photo')) {
                if(file_exists(public_path() . '/' .$user->photo)){
                    unlink(public_path() . '/' .$user->photo);
                }
                $file = request()->file('photo');
                $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                $height = 200;
                $width = 200;
                
                $path .= $file->getClientOriginalExtension();
                Image::make($file)->fit($height, $width)->save(public_path($path));
                $user->photo = $path;
                
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        $user->save();

        $user_salary = UserSalary::where('id', request()->id)->first();
        $user_salary->user_id = $user->id;
        $user_salary->branch_id = $this->getBranchID();
        $salary =  request()->salary;
        $hourly_salary = request()->hourly_salary;
        $user_salary->salary =  floatval($salary);
        $user_salary->hourly_salary =  floatval($hourly_salary);
        $user_salary->save();

        return response()->json([
            'message' => 'success',
            'result' => $user,
        ], 200);
    }


    public function canvas_update()
    {
        $rules = [
            'id' => ['required'],
            'first_name' => ['required'],
            'last_name' => ['required'],
            'email' => ['required'],
            'mobile_number' => ['required'],
        ];

        $user = User::find(request()->id);

        if (request()->has('password') && request()->password) {
            $rules['password'] = ['required', 'min:8', 'confirmed'];
            $rules['password_confirmation'] = ['required'];
        }
        if (request()->email != $user->email) {
            $rules['email'][] = 'unique:users';
        }
        if (request()->mobile_number != $user->mobile_number) {
            $rules['mobile_number'][] = 'unique:users';
        }
        if (request()->user_name != $user->user_name) {
            $rules['user_name'][] = 'unique:users';
        }

        $validator = Validator::make(request()->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user->first_name = request()->first_name;
        $user->last_name = request()->last_name;
        $user->user_name = request()->first_name . request()->last_name . rand(0, 9999);
        $user->email = request()->email;
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->address = request()->address;
        $user->password = Hash::make(request()->password);
        $user->save();

        
        $user->roles()->sync(7);
        $user->branch()->sync([$this->getBranchID()]);


        try {
            if (request()->hasFile('photo')) {
                $file = request()->file('photo');
                $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                $height = 200;
                $width = 200;
                
                $path .= $file->getClientOriginalExtension();
                Image::make($file)->fit($height, $width)->save(public_path($path));
                $user->photo = $path;
                
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        $user->save();

        return response()->json([
            'message' => 'success',
            'result' => $user,
        ], 200);
    }

    public function soft_delete()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:users,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::find(request()->id);
        $user->status = 0;
        $user->save();

        return response()->json([
            'result' => 'deactivated',
        ], 200);
    }

    public function destroy()
    {
    }

    public function restore()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:users,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::find(request()->id);
        $user->status = 1;
        $user->save();

        return response()->json([
            'result' => 'activated',
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
            if (isset($item['photo_url']))
                unset($item['photo_url']);

            if (!isset($item['password']))
                $item['password'] = Hash::make('12345678');

            $item['created_at'] = $item['created_at'] ? Carbon::parse($item['created_at']) : Carbon::now()->toDateTimeString();
            $item['updated_at'] = $item['updated_at'] ? Carbon::parse($item['updated_at']) : Carbon::now()->toDateTimeString();
            $item = (object) $item;

            $check = User::where('id', $item->id)->first();
            if (!$check) {
                try {
                    User::create((array) $item);
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
