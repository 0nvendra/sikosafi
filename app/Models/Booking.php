<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'order_code',
        'room_id',
        'start_at',
        'end_at',
    ];
    protected $casts = [
        // 'start_at' => 'date:d M Y',
        // 'end_at' => 'date:d M Y',
    ];
}
