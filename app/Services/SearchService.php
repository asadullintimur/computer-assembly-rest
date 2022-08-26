<?php

namespace App\Services;

use Illuminate\Support\Str;

class SearchService
{
    function getResource($category)
    {
        return Str::replace("-", "", Str::singular($category));
    }

    function getModel($resource)
    {
        return 'App\Models\\' . $resource;
    }

    function getApiResource($resource)
    {
        return 'App\Http\Resources\\' . $resource . "resource";
    }
}
