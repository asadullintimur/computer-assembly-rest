<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Machine extends Model
{
    use HasFactory;

    public $table = "machine";
    public $guarded = [];
    public $timestamps = false;

    public function motherboard()
    {
        return $this->belongsTo(Motherboard::class, "motherboardId");
    }

    public function processor()
    {
        return $this->belongsTo(Processor::class, "processorId");
    }

    public function ramMemory()
    {
        return $this->belongsTo(RamMemory::class, "ramMemoryId");
    }

    public function graphicCard()
    {
        return $this->belongsTo(GraphicCard::class, "graphicCardId");
    }

    public function powerSupply()
    {
        return $this->belongsTo(PowerSupply::class, "powerSupplyId");
    }

    public function storageDevices()
    {
        return $this->belongsToMany(StorageDevice::class, "machinehasstoragedevice",
            "machineId", "storageDeviceId");
    }

    public function attachStorageDevices($storageDevices)
    {
        collect($storageDevices)->each(function ($storageDevice) {
            $this->storageDevices()
                ->attach($storageDevice["storageDeviceId"], ["amount" => $storageDevice["amount"]]);
        });
    }

    public function updateStorageDevices($storageDevices)
    {
        $this->storageDevices()->detach();
        $this->attachStorageDevices($storageDevices);
    }

    public function mergeWithAttributes($data)
    {
        return collect($this->attributesToArray())->merge($data)->all();
    }


}
