<?php

namespace App\Http\Controllers;

use App\Http\Resources\PowerSupplyResource;
use App\Models\PowerSupply;
use Illuminate\Http\Request;

class PowerSupplyController extends Controller
{
    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return PowerSupplyResource::collection(PowerSupply::offset($page * $pageSize)->limit($pageSize)->get());
    }
}
