<?php

namespace App\Http\Controllers\Management\Institute;

use App\Http\Controllers\Controller;
use App\Models\Attendence;
use App\Models\Institute\InstituteBranch;
use App\Models\Institute\InstituteClassBatchExam;
use App\Models\Institute\InstituteClassBatchExamMark;
use App\Models\Institute\InstituteClassBatchTimeSchedule;
use App\Models\Institute\InstituteStudent;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class InstituteStudentController extends Controller
{
    // get the branch admin details from auth
    private function getBranchID()
    {
        $branch_admin = User::where('id', auth()->user()->id)
            ->with([
                'branch_admin' => function ($q) {
                    $q->with('branch_details');
                }
            ])->first();

        $branch_details = $branch_admin->branch_admin[0]->branch_details;
        if ($branch_details) {
            return $branch_details->id;
        }
        return 0;
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

        $query = InstituteStudent::orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('admission_date', 'LIKE', '%' . $key . '%')
                    ->orWhereHas('user', function ($q) use ($key) {
                        $q->where('first_name', 'LIKE', '%' . $key . '%')
                            ->orWhere('branch_code', 'LIKE', '%' . $key . '%')
                            ->orWhere('mobile_number', 'LIKE', '%' . $key . '%')
                            ->orWhere('last_name', 'LIKE', '%' . $key . '%')
                            ->orWhere('email', 'LIKE', '%' . $key . '%')
                            ->orWhere('first_name', $key)
                            ->orWhere('first_name', $key)
                            ->orWhere('mobile_number', $key);
                    });
            });
        }

        if (request()->has('status')) {
            $query->where('status', $status);
        }


        $InstituteStudents = $query->whereExists(
            function ($query) {
                $query->from('institute_branch_institute_student')
                    ->where('institute_branch_institute_student.institute_branch_id', $this->getBranchID())
                    ->whereColumn('institute_branch_institute_student.institute_student_id', 'institute_students.id');
            }
        )
        ->with([
            'user',
            // 'payments',
            'branch:branch_code,coaching_name,name',
            'institute_class_batches' => function ($q) {
                $q->with('class');
            }
        ])
        ->withSum('payments','amount')
        ->paginate($paginate);

        return response()->json($InstituteStudents);
    }

    public function admin_students()
    {

        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $status = 1;
        if (request()->has('status')) {
            $status = request()->status;
        }

        $query = InstituteStudent::orderBy($orderBy, $orderByType)->with(['user' => function ($quser) {
            $quser->with('branch_user');
        }, 'payments', 'institute_class_batches' => function ($q) {
            $q->with('class');
        }]);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('admission_date', 'LIKE', '%' . $key . '%')
                    ->orWhereHas('user', function ($q) use ($key) {
                        $q->where('first_name', 'LIKE', '%' . $key . '%')
                            ->orWhere('last_name', 'LIKE', '%' . $key . '%')
                            ->orWhere('mobile_number', 'LIKE', '%' . $key . '%')
                            // ->orWhere('email', 'LIKE', '%' . $key . '%')
                            ->orWhere('branch_code', 'LIKE', '%' . $key . '%')
                            ->orWhere('first_name', $key)
                            ->orWhere('first_name', $key)
                            ->orWhere('mobile_number', $key);
                    });
            });
        }

        if (request()->has('status')) {
            $query->where('status', $status);
        }

        if (request()->has('gender') && request()->gender) {
            $query->where('gender', request()->gender);
        }

        if (request()->has('user_id') && request()->user_id ) {
            $query->where('user_id', request()->user_id);
        }

        if (request()->has('branch_id') && request()->branch_id) {
            $query->whereHas('user.branch_user', function ($subQuery) {
                $subQuery->where('institute_branch_id', request()->branch_id);
            });
        }
        $InstituteStudents = $query->paginate($paginate);

        return response()->json($InstituteStudents);
    }

    public function get_all_students()
    {
        $students = InstituteStudent::whereExists(
            function ($query) {
                $query->from('institute_branch_institute_student')
                    ->where('institute_branch_institute_student.institute_branch_id', $this->getBranchID())
                    ->whereColumn('institute_branch_institute_student.institute_student_id', 'institute_students.id');
            }
        )->with(['user'])->get();

        return response()->json($students);
    }

    public function show($id)
    {
        $data = InstituteStudent::where('id', $id)->with(['user' => function ($user_q) {
            $user_q->with('branch_user');
        }, 'payments', 'institute_class_batches' => function ($q) {
            $q->with('class');
        }])->first();
        if (!$data) {
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['role' => ['data not found']],
            ], 422);
        }


        $stats = [];
        $student_batchs = $data->institute_class_batches;

        foreach ($student_batchs as $key => $value) {
            $stats['total_class'] = InstituteClassBatchTimeSchedule::where('institute_class_batch_id', $value->id)->count();
            $stats['total_exam'] = InstituteClassBatchExam::where('institute_class_batch_id', $value->id)->count();
        }
        $stats['total_batch'] = $student_batchs->count();

        $stats['total_attendences'] = Attendence::where('table', 'users')->where('table_id', $data->user_id)->count();

        $stats['avg_mark'] = InstituteClassBatchExamMark::where('user_id', $data->user_id)->avg('mark');

        $stats = (object) $stats;

        return response()->json(['student' => $data, 'stats' => $stats], 200);
    }

    public function admin_show($id)
    {
        $data = InstituteStudent::where('id', $id)->with(['user', 'payments', 'institute_class_batches' => function ($q) {
            $q->with('class');
        }])->first();
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
        $validator = Validator::make(request()->all(), [
            'user_first_name' => ['required'],
            // 'user_last_name' => ['required'],
            'user_email' => ['sometimes', 'unique:users,email'],
            'admission_date' => ['required'],
            'fee_start_from' => ['required'],
            'user_password' => ['required', 'min:8', 'confirmed'],
            'user_password_confirmation' => ['required'],
            'mobile_number' => ['required', 'unique:users'],
            'photo' => ['nullable', 'image', 'mimes:jpg,png,webp', 'max:3072'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = new User();
        $user->first_name = request()->user_first_name;
        $user->last_name = request()->user_last_name;
        $user->user_name = request()->user_first_name . request()->user_last_name . rand(0, 9999);
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->address = request()->user_address;
        $user->email = request()->user_email;

        $user->password = Hash::make(request()->user_password);
        $user->save();

        $user->roles()->attach(6);
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
                // $user->photo = Storage::put("uploads/users/student", $file);
            }
        } catch (\Throwable $th) {
            //throw $th;
            // return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        // $user->save();

        $branch = InstituteBranch::where('id', $this->getBranchID())->first();
        $user->branch_code = Str::slug("$branch->name $user->id", '-');
        $user->save();

        $data = new InstituteStudent();
        $data->user_id = $user->id;
        $data->gender = request()->gender ? request()->gender : 'male';
        $data->admission_date = Carbon::parse(request()->admission_date)->toDateString();
        $data->slug = Str::random(8);
        $data->monthly_fee = request()->monthly_fee;
        $data->fee_start_from = request()->fee_start_from;
        $data->creator = auth()->user()->id;
        $data->save();
        $data->institute_class_batches()->attach(request()->batch_id);
        $data->branch()->attach([$branch->id]);


        return response()->json($data, 200);
    }

    public function admin_store()
    {
        $validator = Validator::make(request()->all(), [
            'user_first_name' => ['required'],
            'user_last_name' => ['required'],
            'batch_id' => ['required', 'numeric'],
            'admission_date' => ['required'],
            'user_email' => ['unique:users,email'],
            'branch_id' => ['required'],
            'user_password' => ['required', 'min:8', 'confirmed'],
            'user_password_confirmation' => ['required'],
            'mobile_number' => ['required', 'unique:users'],
            'photo' => ['nullable', 'image', 'mimes:jpg,png,webp', 'max:3072'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = new User();
        $user->first_name = request()->user_first_name;
        $user->last_name = request()->user_last_name;
        $user->user_name = request()->user_first_name . request()->user_last_name . rand(0, 9999);
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->address = request()->user_address;
        $user->email = request()->user_email;
        $user->password = Hash::make(request()->user_password);
        $user->save();

        $user->roles()->attach(6);
        $user->branch_user()->attach([request()->branch_id]);

        try {
            if (request()->hasFile('photo')) {
                $file = request()->file('photo');
                // $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                // $height = 200;
                // $width = 200;

                // $path .= $file->getClientOriginalExtension();
                // Image::make($file)->fit($height, $width)->save(public_path($path));
                // $user->photo = $path;
                $user->photo = Storage::put(public_path("uploads/users/student"), $file);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        // $user->save();

        $branch = InstituteBranch::where('id', request()->branch_id)->first();
        $user->branch_code = Str::slug("$branch->name $user->id", '-');
        $user->save();

        $data = new InstituteStudent();
        $data->user_id = $user->id;
        $data->gender = request()->gender;
        $data->admission_date = Carbon::parse(request()->admission_date)->toDateString();
        $data->monthly_fee = request()->monthly_fee;
        $data->slug = Str::random(8);
        $data->creator = auth()->user()->id;
        $data->save();
        $data->institute_class_batches()->attach(request()->batch_id);
        $data->branch()->attach([$branch->id]);


        return response()->json($data, 200);
    }

    public function canvas_store()
    {
        $validator = Validator::make(request()->all(), [
            'user_first_name' => ['required'],
            'user_last_name' => ['required'],
            'admission_date' => ['required'],
            'user_password' => ['required', 'min:8', 'confirmed'],
            'user_password_confirmation' => ['required'],
            'user_mobile_number' => ['required', 'unique:users'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteStudent();
        $data->user_id = request()->user_id;
        $data->admission_date = Carbon::parse(request()->admission_date)->toDateString();
        $data->slug = Str::random(8);
        $data->creator = auth()->user()->id;
        $data->save();

        return response()->json($data, 200);
    }

    public function update()
    {
        $data = InstituteStudent::find(request()->student_id);

        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['InstituteStudent not found by given id ' . (request()->student_id ? request()->student_id : 'null')]],
            ], 422);
        }
        $user = User::find($data->user_id);
        $validator = Validator::make(request()->all(), [
            'user_first_name' => ['required'],
            'user_last_name' => ['required'],
            'admission_date' => ['required'],
            'admission_date' => ['required'],
            'photo' => ['nullable', 'image', 'mimes:jpg,png,webp', 'max:3072'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        if (request()->has('password') && request()->password) {
            $validator['password'] = ['required', 'min:8', 'confirmed'];
            $validator['password_confirmation'] = ['required'];
        }
        if (request()->user_email != $user->user_email) {
            $rules['user_email'][] = 'unique:users';
        }
        if (request()->mobile_number != $user->mobile_number) {
            $rules['mobile_number'][] = 'unique:users';
        }

        $user->first_name = request()->user_first_name;
        $user->last_name = request()->user_last_name;
        $user->user_name = request()->user_first_name . request()->user_last_name . rand(0, 9999);
        $user->mobile_number = request()->mobile_number;
        $user->total_monthly_attendance = request()->total_monthly_attendance;
        $user->email = request()->user_email;
        $user->address = request()->user_address;
        $user->save();
        $user->roles()->sync(6);
        $user->branch_user()->sync([$this->getBranchID()]);
        try {
            if (request()->hasFile('photo')) {
                if (file_exists(public_path() . '/' . $user->photo)) {
                    unlink(public_path() . '/' . $user->photo);
                }
                $file = request()->file('photo');
                // $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
                // $height = 200;
                // $width = 200;

                // $path .= $file->getClientOriginalExtension();
                // Image::make($file)->fit($height, $width)->save(public_path($path));
                // $user->photo = $path;

                $user->photo = Storage::put(public_path("uploads/users/student"), $file);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        }

        // $user->save();


        $branch = InstituteBranch::where('id', $this->getBranchID())->first();
        $user->branch_code = Str::slug("$branch->name $user->id", '-');
        $user->save();

        $data->gender = request()->gender ? request()->gender : 'male';
        $data->user_id = $user->id;
        $data->admission_date = Carbon::parse(request()->admission_date)->toDateString();
        $data->slug = Str::random(8);
        $data->monthly_fee = request()->monthly_fee;
        $data->creator = auth()->user()->id;
        $data->save();
        // $data->institute_class_batches()->sync(request()->batch_id);

        $data->branch()->syncWithoutDetaching([$branch->id]);

        return response()->json($data, 200);
    }

    public function canvas_update()
    {
        $data = InstituteStudent::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['InstituteStudent not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'admission_date' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->user_id = request()->user_id;
        $data->admission_date = Carbon::parse(request()->admission_date)->toDateString();
        $data->slug = Str::random(8);
        $data->creator = auth()->user()->id;
        $data->save();

        return response()->json($data, 200);
    }

    public function destroy()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_students,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }
        $student_data = InstituteStudent::where('id', request()->id)->first();
        $data = InstituteStudent::where('id', request()->id)->delete();
        $user = User::where('id', $student_data->user_id)->delete();
        return response()->json([
            'result' => 'deleted',
        ], 200);
    }

    public function soft_delete()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_students,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteStudent::find(request()->id);
        $data->status = 0;
        $data->save();

        return response()->json([
            'result' => 'deactivated',
        ], 200);
    }

    public function restore()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_students,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteStudent::find(request()->id);
        $data->status = 1;
        $data->save();

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
            $item['created_at'] = $item['created_at'] ? Carbon::parse($item['created_at']) : Carbon::now()->toDateTimeString();
            $item['updated_at'] = $item['updated_at'] ? Carbon::parse($item['updated_at']) : Carbon::now()->toDateTimeString();
            $item = (object) $item;
            $check = InstituteStudent::where('id', $item->id)->first();
            if (!$check) {
                try {
                    InstituteStudent::create((array) $item);
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
