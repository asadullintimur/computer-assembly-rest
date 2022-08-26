<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMachineRequest;
use App\Http\Requests\UpdateMachineRequest;
use App\Http\Resources\MachineResource;
use App\Models\GraphicCard;
use App\Models\Machine;
use App\Models\Motherboard;
use App\Models\PowerSupply;
use App\Models\Processor;
use App\Models\RamMemory;
use App\Models\StorageDevice;
use App\Services\MachineService;
use Illuminate\Http\Request;

class MachineController extends Controller
{
    protected $machineService;

    public function __construct(MachineService $machineService)
    {
        $this->machineService = $machineService;
    }

    public function index(Request $request)
    {
        $pageSize = $request->input("pageSize", 10);
        $page = $request->input("page", 1) - 1;

        return MachineResource::collection(Machine::offset($page * $pageSize)->limit($pageSize)->get());
    }

    public function store(StoreMachineRequest $request)
    {
        $errors = $this->machineService->getIncompatibilities($request->validated());

        if (!empty($errors)) {
            return $errors;
        }

        $machine = Machine::create($request->safe()->except(["storageDevices"]))
            ->attachStorageDevices($request->storageDevices);

        return response()->json(["id" => $machine->id], 201);
    }


    public function update(UpdateMachineRequest $request, Machine $machine)
    {
        $details = $machine->mergeWithAttributes($request->all());
        $errors = $this->machineService->getIncompatibilities($details);

        if (!empty($errors)) {
            return $errors;
        }

        $machine->update($request->except("storageDevices"));
        $machine->updateStorageDevices($request->input("storageDevices", []));
    }


    public function destroy($id)
    {
        $machine = Machine::find($id);

        if (!$machine) {
            return response()->json(["message" => "Модель машины не найдена"], 404);
        }

        $machine->storageDevices()->detach();
        $machine->delete();
    }
}
