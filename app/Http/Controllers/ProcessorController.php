<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProcessorResource;
use App\Models\Processor;
use Illuminate\Http\Request;

class ProcessorController extends Controller
{
    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return ProcessorResource::collection(Processor::offset($page * $pageSize)->limit($pageSize)->get());
    }
}
