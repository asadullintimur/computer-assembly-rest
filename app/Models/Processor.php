<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Processor extends Model
{
    use HasFactory;

    public $table = "processor";
    public $guarded = [];

    public function brand() {
        return $this->belongsTo(Brand::class, "brandId");
    }

    public function socketType() {
        return $this->belongsTo(SocketType::class, "socketTypeId");
    }
}
