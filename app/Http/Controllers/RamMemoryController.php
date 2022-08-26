<?php

namespace App\Http\Controllers;

use App\Http\Resources\RamMemoryResource;
use App\Models\RamMemory;
use Illuminate\Http\Request;

class RamMemoryController extends Controller
{
    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return RamMemoryResource::collection(RamMemory::offset($page * $pageSize)->limit($pageSize)->get());
    }
}
