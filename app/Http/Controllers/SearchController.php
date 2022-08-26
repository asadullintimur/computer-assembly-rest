<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Services\SearchService;

class SearchController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */

    protected $searchService;

    public function __construct(SearchService $searchService)
    {
        $this->searchService = $searchService;
    }

    public function __invoke(Request $request)
    {
        if ($request->missing("q")) {
            return response(null, 404);
        }

        $resource = $this->searchService->getResource($request->category);
        $model = $this->searchService->getModel($resource);
        $apiResource = $this->searchService->getApiResource($resource);

        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;


        return $apiResource::collection($model::where("name", "like", "%$request->q%")
            ->offset($page * $pageSize)->limit($pageSize)->get());
    }
}
