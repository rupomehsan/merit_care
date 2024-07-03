<?php

namespace App\Http\Controllers;

use App\Models\Division;
use Illuminate\Http\Request;

class DivisionController extends Controller
{
    public function get_all() {
        $divisions = Division::select('*')->get();
        return response()->json($divisions);
    }
}
