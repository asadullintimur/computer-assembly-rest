<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MachineResource extends JsonResource
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
            "motherboard" => $this->motherboard->name,
            "processor" => $this->processor->name,
            "ram_memory" => $this->ramMemory->name,
            "ram_memory_amount" => $this->ramMemoryAmount,
            "graphic_card" => $this->graphicCard->name,
            "graphic_card_amount" => $this->graphicCardAmount,
            "power_supply" => $this->powerSupply->name,
        ];
    }
}
