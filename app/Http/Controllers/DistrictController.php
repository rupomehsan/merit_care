<?php

namespace App\Http\Controllers;

use App\Models\District;
use Illuminate\Http\Request;

class DistrictController extends Controller
{
    public function all()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;


        $query = District::orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('name', $key)
                    ->orWhere('bn_name', 'LIKE', '%' . $key . '%');
            });
        }

        $users = $query->paginate($paginate);
        return response()->json($users);
    }

    function district_by_division($id) {
        if($id) {
            $districts = District::select('*')->where('division_id', $id)->get();
            return response()->json($districts);
        } else {
            return response()->json([]);
        }
    }

    public function get_all() {
        $districts = District::select('*')->get();
        return response()->json($districts);
    }
}
