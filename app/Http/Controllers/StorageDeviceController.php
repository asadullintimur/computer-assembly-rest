<?php

namespace App\Http\Controllers;

use App\Http\Resources\StorageDeviceResource;
use App\Models\StorageDevice;
use Illuminate\Http\Request;

class StorageDeviceController extends Controller
{


    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return StorageDeviceResource::collection(StorageDevice::offset($page * $pageSize)->limit($pageSize)->get());
    }
}
