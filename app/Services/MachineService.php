<?php

namespace App\Services;

use App\Models\GraphicCard;
use App\Models\Motherboard;
use App\Models\PowerSupply;
use App\Models\Processor;
use App\Models\RamMemory;
use App\Models\StorageDevice;

class MachineService
{
    protected function getSataDevices($storageDevices)
    {
        return $storageDevices
            ->filter(function ($storageDevice) {
                return StorageDevice::find($storageDevice["storageDeviceId"])->storageDeviceInterface === "sata";
            })
            ->reduce(function ($prev, $cur) {
                return $prev + $cur["amount"];
            }, 0);
    }

    protected function getM2Devices($storageDevices)
    {
        return $storageDevices
            ->filter(function ($storageDevice) {
                return StorageDevice::find($storageDevice["storageDeviceId"])->storageDeviceInterface === "m2";
            })
            ->reduce(function ($prev, $cur) {
                return $prev + $cur["amount"];
            }, 0);
    }

    public function getIncompatibilities($details)
    {
        $motherboard = Motherboard::find($details["motherboardId"]);
        $powerSupply = PowerSupply::find($details["powerSupplyId"]);
        $processor = Processor::find($details["processorId"]);
        $ramMemory = RamMemory::find($details["ramMemoryId"]);
        $ramMemoryAmount = $details["ramMemoryAmount"];
        $graphicCard = GraphicCard::find($details["graphicCardId"]);
        $graphicCardAmount = $details["graphicCardAmount"];
        $storageDevices = collect($details["storageDevices"]);
        $sataDevicesAmount = $this->getSataDevices($storageDevices);
        $m2DevicesAmount = $this->getM2Devices($storageDevices);

        $errors = [];

        if ($motherboard->socketType->id !== $processor->socketType->id) {
            $errors["motherboardId"][] = "Тип сокета материнской платы отличается от типа сокета процессора";
        }

        if ($processor->tdp > $motherboard->maxTdp) {
            $errors["processorId"] = "TDP процессора превышает максимальный TDP, поддерживаемый материнской платой";
        }

        if ($motherboard->ramMemoryTypeId !== $ramMemory->ramMemoryTypeId) {
            $errors["motherboardId"][] = "Тип ОЗУ на материнской плате отличается от типа ОЗУ";
        }

        if ($ramMemoryAmount > $motherboard->ramMemorySlots || $ramMemoryAmount < 1) {
            $errors["ramMemoryAmount"] = "Количество RAM - памяти больше, чем количество слотов на материнской плате(на машине всегда должно быть, как минимум 1 RAM)";
        }

        if ($graphicCardAmount > $motherboard->pciSlots || $graphicCardAmount < 1) {
            $errors["graphicCardAmount"] = "Количество видеокарт больше, чем количество слотов PCI Express на материнской плате(на машине всегда должна быть как минимум 1 видеокарта)";
        }

        if ($sataDevicesAmount > $motherboard->sataSlots) {
            $errors["storageDevices"][] = "Количество запоминающих устройств типа SATA больше, чем количество слотов SATA на материнской плате";
        }

        if ($m2DevicesAmount > $motherboard->m2Slots) {
            $errors["storageDevices"][] = "Количество запоминающих устройств типа M2 больше, чем количество слотов M2 на материнской плате";
        }

        if ($m2DevicesAmount + $sataDevicesAmount === 0) {
            $errors["storageDevices"][] = "Общая сумма устройств хранения равна нулю(то есть должно быть, как минимум 1 устройство SATA или 1 устройство M2)";
        }

        if ($graphicCardAmount < 1 && !$graphicCard->supportMultiGpu) {
            $errors["graphicCardId"] = "Количество видеокарт меньше 1, и модель видеокарты не поддерживает SLI / Crossfire";
        }

        if ($powerSupply->potency < ($graphicCard->minimumPowerSupply * $graphicCardAmount)) {
            $errors["powerSupplyId"] = "Мощность блока питания меньше минимального значения мощности видеокарты, умноженного на количество видеокарт";
        }

        return $errors;
    }
}
