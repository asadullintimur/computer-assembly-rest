<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Motherboard extends Model
{
    use HasFactory;

    public $table = "motherboard";

    public $guarded = [];

    public function brand()
    {
        return $this->belongsTo(Brand::class, "brandId");
    }

    public function socketType()
    {
        return $this->belongsTo(SocketType::class, "socketTypeId");
    }

    public function ramMemoryType()
    {
        return $this->belongsTo(RamMemoryType::class, "ramMemoryTypeId");
    }
}
