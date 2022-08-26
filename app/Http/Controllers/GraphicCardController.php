<?php

namespace App\Http\Controllers;

use App\Http\Resources\GraphicCardResource;
use App\Models\GraphicCard;
use Illuminate\Http\Request;

class GraphicCardController extends Controller
{
    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return GraphicCardResource::collection(GraphicCard::offset($page * $pageSize)->limit($pageSize)->get());
    }
}
