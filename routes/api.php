<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    AuthController,
    MotherboardController,
    ProcessorController,
    RamMemoryController,
    StorageDeviceController,
    GraphicCardController,
    PowerSupplyController,
    BrandController,
    MachineController,
    SearchController,
};

Route::post("/login", [AuthController::class, "login"]);


Route::middleware("check.token")->group(function () {
    Route::delete("/logout", [AuthController::class, "logout"]);

    Route::get("/motherboards", [MotherboardController::class, "index"]);
    Route::get("/processors", [ProcessorController::class, "index"]);
    Route::get("/ram-memories", [RamMemoryController::class, "index"]);
    Route::get("/storage-devices", [StorageDeviceController::class, "index"]);
    Route::get("/graphic-cards", [GraphicCardController::class, "index"]);
    Route::get("/power-supplies", [PowerSupplyController::class, "index"]);
    Route::get("/brands", [BrandController::class, "index"]);
    Route::get("/machines", [MachineController::class, "index"]);

    Route::get("/search/{category}", SearchController::class);

    Route::apiResource("machines", MachineController::class)
        ->except(["show"]);
});




