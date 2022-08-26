<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GraphicCardResource extends JsonResource
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
            "memory_size" => $this->memorySize,
            "memory_type" => $this->memoryType,
            "minimum_power_supply" => $this->minimumPowerSupply,
            "support_multi_gpu" => $this->supportMultiGpu,
        ];
    }
}
