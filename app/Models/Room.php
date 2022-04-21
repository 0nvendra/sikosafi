<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Room extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'nomor_room',
        'lantai',
        'tipe_room_id',
        'fasilitas_id'
    ];
}
