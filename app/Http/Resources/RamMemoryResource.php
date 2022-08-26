<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RamMemoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "name" => $this->name,
            "image_url" => $this->imageUrl,
            "brand" => $this->brand->name,
            "size" => $this->size,
            "ram_memory_type" => $this->ramMemoryType->name,
            "frequency" => $this->frequency,
        ];
    }
}
