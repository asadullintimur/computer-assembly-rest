<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PowerSupplyResource extends JsonResource
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
            "potency" => $this->potency,
            "badge80_plus" => $this->badge80Plus,
        ];
    }
}
