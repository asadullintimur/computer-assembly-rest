<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProcessorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "name" => $this->name,
            "image_url" => $this->imageUrl,
            "brand" => $this->brand->name,
            "socket_type" => $this->socketType->name,
            "cores" => $this->cores,
            "base_frequency" => $this->baseFrequency,
            "max_frequency" => $this->maxFrequency,
            "cache_memory" => $this->cacheMemory,
            "tdp" => $this->tdp,
        ];
    }
}
