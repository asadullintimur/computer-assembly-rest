<?php

namespace App\Http\Controllers;

use App\Http\Resources\MotherboardResource;
use App\Models\Motherboard;
use Illuminate\Http\Request;

class MotherboardController extends Controller
{
    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return MotherboardResource::collection(Motherboard::offset($page * $pageSize)->limit($pageSize)->get());
    }
}

