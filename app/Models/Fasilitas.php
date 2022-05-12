<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Fasilitas extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'desc',
    ];
    protected $hidden = ['created_at', 'updated_at'];
    protected $appends = ['descF'];

    public function GetDescFAttribute()
    {
        $arr = explode('-', $this->desc);
        return $arr;
    }
}
