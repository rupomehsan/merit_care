<?php

namespace App\Http\Controllers\Management;

use App\Http\Controllers\Controller;
use App\Models\Institute\InstituteBranchContacts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BranchContactController extends Controller
{
    public function all()
    {

        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $query = InstituteBranchContacts::orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('first_name', $key)
                    ->orWhere('phone_number', $key)
                    ->orWhere('phone_number', 'LIKE', '%' . $key . '%')
                    ->orWhere('first_name', 'LIKE', '%' . $key . '%');
            });
        }

        $InstituteBranchContactss = $query->with(['branch'])->paginate($paginate);
        return response()->json($InstituteBranchContactss);
    }

    public function show($id)
    {
        $data = InstituteBranchContacts::where('id',$id)->first();
        if(!$data){
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['role'=>['data not found']],
            ], 422);
        }
        return response()->json($data,200);
    }


    public function store()
    {
        $validator = Validator::make(request()->all(), [
            'phone_number' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteBranchContacts();
        $data->intstitue_branch_id = request()->branch_id;
        $data->first_name = request()->first_name;
        $data->last_name = request()->last_name;
        $data->email = request()->email;
        $data->phone_number = request()->phone_number;
        $data->save();

        return response()->json($data, 200);
    }



    public function update()
    {
        $data = InstituteBranchContacts::find(request()->id);
        if(!$data){
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name'=>['InstituteBranchContacts not found by given id '.(request()->id?request()->id:'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'phone_number' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }
        
        $data->intstitue_branch_id = request()->branch_id;
        $data->first_name = request()->first_name;
        $data->last_name = request()->last_name;
        $data->email = request()->email;
        $data->phone_number = request()->phone_number;
        $data->save();

        return response()->json($data, 200);
    }


    public function destroy()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required','exists:institute_branch_contacts,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteBranchContacts::where('id', request()->id)->delete();

        return response()->json([
            'result' => 'deleted',
        ], 200);
    }

    
}
