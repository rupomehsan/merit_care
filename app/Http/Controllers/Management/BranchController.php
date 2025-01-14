<?php

namespace App\Http\Controllers\Management;

use App\Http\Controllers\Controller;
use App\Models\BranchAdmin;
use App\Models\Institute\InstituteBranch;
use App\Models\Institute\InstituteClassBatch;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class BranchController extends Controller
{
    public function all()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $status = 1;
        if (request()->has('status')) {
            $status = request()->status;
        }

        $query = InstituteBranch::where('status', $status)->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('name', $key)
                    ->orWhere('street', $key)
                    ->orWhere('city', $key)
                    ->orWhere('name', 'LIKE', '%' . $key . '%')
                    ->orWhere('street', 'LIKE', '%' . $key . '%')
                    ->orWhere('city', 'LIKE', '%' . $key . '%')
                    ->orWhere('created_at', 'LIKE', '%' . $key . '%')
                    ->orWhere('updated_at', 'LIKE', '%' . $key . '%')
                    ->orWhere('status', 'LIKE', '%' . $key . '%');
            });
        }

        $users = $query->with(['branch_admin' => function ($b) {
            $b->with(['branch_details', 'user']);
        }])->paginate($paginate);
        return response()->json($users);
    }
    public function get_institute_branches()
    {
        // dd(request()->all());


        $query = InstituteBranch::select(['id', 'name'])->where('status', 1)->get()->unique('name');
        

        return response()->json($query);
    }

    public function branch_batches($id)
    {
        $batches = InstituteClassBatch::where('branch_id', $id)->with(['class'])->get();

        return response()->json($batches, 200);
    }

    public function show($id)
    {
        $data = InstituteBranch::where('id', $id)->with(['branch_admin'])->first();
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
            'name' => ['required'],
            'street' => ['required'],
            'city' => ['required'],
            'image' => ['nullable', 'image', 'mimes:jpg,png,webp', 'max:3072'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteBranch();
        $data->name = request()->name;
        $data->coaching_name = request()->coaching_name;
        $data->street = request()->street;
        $data->city = request()->city;
        $data->division_id = request()->division_id;
        $data->district_id = request()->district_id;
        $data->upozila_id = request()->upozila_id;
        $data->branch_code = request()->branch_code;
        $data->state = request()->state;
        $data->zip_code = request()->zip_code;
        $data->country = request()->country;
        $data->invoice_name = request()->invoice_name;
        $data->invoice_address = request()->invoice_address;
        $data->invoice_email = request()->invoice_email;
        $data->invoice_mobile_number = request()->invoice_mobile_number;
        $data->creator = auth()->user()->id;
        $data->slug = Str::slug(request()->name, '-');
        $data->map_link = request()->map_link;
        $data->save();

        // try {
        if (request()->hasFile('image')) {
            $file = request()->file('image');
            // $path = 'uploads/users/branch-' . time() . rand(1000, 9999) . '.';
            // $height = 200;
            // $width = 200;

            // $path .= $file->getClientOriginalExtension();
            // Image::make($file)->fit($height, $width)->save(public_path($path));
            // $data->image = $path;

            $data->image = Storage::put(public_path("uploads/users/branch"), $file);
            $data->save();
        }
        // } catch (\Throwable $th) {
        //     throw $th;
        //     return response()->json("data created without image uploding-", 422);
        // }

        return response()->json($data, 200);
    }

    function create_branch_admin()
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
        $user->roles()->attach([5]);
        $user->permissions()->attach([1, 2, 3]);
        $branch_admin = new BranchAdmin();
        $branch_admin->user_id = $user->id;
        $branch_admin->institue_branch_id = request()->branch_id;
        $branch_admin->save();

        $user->branch_user()->attach([request()->branch_id]);
        $branch = InstituteBranch::where('id', request()->branch_id)->first();
        $user->photo = $branch->image;
        // try {
        //     if (request()->hasFile('photo')) {
        //         $file = request()->file('photo');
        //         $path = 'uploads/users/pp-' . $user->id . rand(1000, 9999) . '.';
        //         $height = 200;
        //         $width = 200;

        //         $path .= $file->getClientOriginalExtension();
        //         Image::make($file)->fit($height, $width)->save(public_path($path));
        //         $user->photo = $path;

        //     }
        // } catch (\Throwable $th) {
        //     //throw $th;
        //     return response()->json("data created without image uploding-" . $th->getMessage(), 500);
        // }


        $user->branch_code = $branch->branch_code;
        $user->save();

        return response()->json([
            'message' => 'success',
            'result' => $user->id,
        ], 200);
    }

    public function canvas_store()
    {
        $validator = Validator::make(request()->all(), [
            'name' => ['required'],
            'street' => ['required'],
            'city' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteBranch();
        $data->name = request()->name;
        $data->street = request()->street;
        $data->city = request()->city;
        $data->state = request()->state;
        $data->zip_code = request()->zip_code;
        $data->country = request()->country;
        $data->creator = 1;
        $data->slug = Str::slug(request()->name, '-');
        $data->save();

        return response()->json($data, 200);
    }

    public function update()
    {
        $data = InstituteBranch::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['branch not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'name' => ['required'],
            'street' => ['required'],
            'city' => ['required'],
            'image' => ['nullable', 'image', 'mimes:jpg,png,webp', 'max:3072']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->name = request()->name;
        $data->coaching_name = request()->coaching_name;
        $data->division_id = request()->division_id;
        $data->district_id = request()->district_id;
        $data->upozila_id = request()->upozila_id;
        $data->branch_code = request()->branch_code;
        $data->street = request()->street;
        $data->city = request()->city;
        $data->state = request()->state;
        $data->zip_code = request()->zip_code;
        $data->country = request()->country;
        $data->invoice_name = request()->invoice_name;
        $data->invoice_address = request()->invoice_address;
        $data->invoice_email = request()->invoice_email;
        $data->invoice_mobile_number = request()->invoice_mobile_number;
        $data->map_link = request()->map_link;
        $data->creator = auth()->user()->id;
        $data->slug = Str::slug(request()->name, '-');
        $data->save();

        try {
            if (request()->hasFile('image')) {
                $file = request()->file('image');
                // $path = 'uploads/users/branch-' . $data->id . rand(1000, 9999) . '.';
                // $height = 200;
                // $width = 200;

                // $path .= $file->getClientOriginalExtension();
                // Image::make($file)->fit($height, $width)->save(public_path($path));
                // $data->image = $path;
                // $data->save();

                $data->image = Storage::put(public_path("uploads/users/branch"), $file);
                $data->save();
            }
        } catch (\Throwable $th) {
            return response()->json("data created without image uploding-", 422);
        }

        return response()->json($data, 200);
    }

    public function canvas_update()
    {
        $data = InstituteBranch::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['branch not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'name' => ['required'],
            'street' => ['required'],
            'city' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->name = request()->name;
        $data->street = request()->street;
        $data->city = request()->city;
        $data->state = request()->state;
        $data->zip_code = request()->zip_code;
        $data->country = request()->country;
        $data->creator = 1;
        $data->slug = Str::slug(request()->name, '-');
        $data->save();

        return response()->json($data, 200);
    }

    public function soft_delete()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_branches,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteBranch::find(request()->id);
        $data->status = 0;
        $data->save();

        return response()->json([
            'result' => 'deactivated',
        ], 200);
    }

    public function destroy()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_branches,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteBranch::where('id', request()->id)->delete();

        return response()->json([
            'result' => 'deleted',
        ], 200);
    }

    public function restore()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_branches,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteBranch::find(request()->id);
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
            $check = InstituteBranch::where('id', $item->id)->first();
            if (!$check) {
                try {
                    InstituteBranch::create((array) $item);
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
