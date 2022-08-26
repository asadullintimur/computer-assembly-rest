<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MotherboardResource extends JsonResource
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
            "ram_memory_type" => $this->ramMemoryType->name,
            "ram_memory_slots" => $this->ramMemorySlots,
            "max_tdp" => $this->maxTdp,
            "sata_slots" => $this->sataSlots,
            "m2_slots" => $this->m2Slots,
            "pci_slots" => $this->pciSlots,
        ];
    }
}
