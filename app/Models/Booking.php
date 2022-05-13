<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use HasFactory, SoftDeletes;
    #status
    #1 diajukan
    #2 approved
    #3 aborted by admin
    protected $fillable = [
        'order_code',
        'user_id',
        'room_id',
        'start_at',
        'end_at',
        'price',
        'bukti_tf',
        'status_id',
        'admin_id',
    ];

    protected $casts = [
        'start_at' => 'date:d M Y',
        'end_at' => 'date:d M Y',
        'created_at' => 'date:d M Y',
    ];

    protected $with = ['room', 'user', 'admin'];

    protected $appends = ['statusSpan'];

    public function GetStatusSpanAttribute()
    {
        switch ($this->status_id) {
            case 1:
                # code...
                return '<span class="badge badge-light-info fs-8 fw-bolder">Diajukan</span>';
                break;
            case 2:
                # code...
                return '<span class="badge badge-light-success fs-8 fw-bolder">Approved</span>';
                break;
            case 1:
                # code...
                return '<span class="badge badge-light-danger fs-8 fw-bolder">Cancelled by Admin</span>';
                break;
            default:
                # code...
                return '?';
                break;
        }
    }

    public function Room()
    {
        return $this->belongsTo(\App\Models\Room::class)->withTrashed();
    }

    public function User()
    {
        return $this->belongsTo(\App\Models\User::class)->withTrashed();
    }

    public function Admin()
    {
        return $this->belongsTo(\App\Models\Admin::class)->withTrashed();
    }
}
