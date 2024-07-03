<?php

namespace App\Http\Controllers;

use App\Models\Upozila;
use Illuminate\Http\Request;

class UpozilaController extends Controller
{
    public function get_all() {
        $upozilas = Upozila::select('*')->get();
        return response()->json($upozilas);
    }

    public function upozila_by_district($id)  {
        if($id) {
            $upozilas = Upozila::select('*')->where('district_id', $id)->get();
            return response()->json($upozilas);
        } else {
            return response()->json([]);
        }
    }
}
