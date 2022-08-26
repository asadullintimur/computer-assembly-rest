<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RamMemory extends Model
{
    use HasFactory;

    public $table = "rammemory";
    public $guarded = [];

    public function brand() {
        return $this->belongsTo(Brand::class, "brandId");
    }

    public function ramMemoryType() {
        return $this->belongsTo(RamMemoryType::class, "ramMemoryTypeId");
    }
}
