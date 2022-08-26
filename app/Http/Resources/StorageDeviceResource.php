<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StorageDeviceResource extends JsonResource
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
            "storage_device_type" => $this->storageDeviceType,
            "size" => $this->size,
            "storage_device_interface" => $this->storageDeviceInterface,
        ];
    }
}
