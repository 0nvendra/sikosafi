<?php

namespace App\Models;

use Carbon\Carbon;
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
        'fasilitas_id',
        'price',
    ];

    protected $with = ['tipeRoom', 'fasilitas'];

    protected $appends = ['tersedia'];

    public function GetTersediaAttribute()
    {
        $booking = Booking::where('room_id', $this->id)->orderByDesc('id')->first();
        $now = Carbon::now();
        $r = [];
        if (
            $booking &&
            Carbon::parse($booking->end_at) >= $now == true
        ) {
            $r = [
                'status' => false,
                'span' => '<span class="badge badge-light-danger fs-8 fw-bolder">Booked</span>',
                'end_contract' => $booking->end_atF,
            ];
        } else {
            $r = [
                'status' => true,
                'span' => '<span class="badge badge-light-success fs-8 fw-bolder">Available</span>',
                'end_contract' => null,
            ];
        }
        return $r;
    }

    public function TipeRoom()
    {
        return $this->belongsTo(\App\Models\TipeRoom::class)->withTrashed();
    }

    public function Fasilitas()
    {
        return $this->belongsTo(\App\Models\Fasilitas::class)->withTrashed();
    }
}
