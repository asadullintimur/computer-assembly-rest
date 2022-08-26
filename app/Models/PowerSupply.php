<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PowerSupply extends Model
{
    use HasFactory;

    public $table = "powersupply";
    public $guarded = [];

    public function brand() {
        return $this->belongsTo(Brand::class, "brandId");
    }
}
