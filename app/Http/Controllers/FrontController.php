<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use App\Models\Room;
use App\Models\Rule;
use App\Models\TipeRoom;
use App\Models\Visitor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class FrontController extends Controller
{
    public function index(Request $request)
    {
        // $data = Visitor::select(
        //     DB::raw('DATE(created_at) as date'),
        //     DB::raw('count(*) as total')
        // )
        //     ->groupBy('date')
        //     ->orderBy('date', 'desc')
        //     ->get();
        // return $data;
        Visitor::create([
            'ip' => request()->ip(),
        ]);
        // $rooms = Room::when($request->nomor_room, function ($query, $q) {
        //     $query->where('nomor_room', 'like', '%' . $q . '%');
        // })
        //     ->when($request->lantai, function ($query, $q) {
        //         $query->where('lantai', 'like', '%' . $q . '%');
        //     })
        //     ->when($request->tipe, function ($query, $q) {
        //         $arr = TipeRoom::where('desc', 'like', '%' . $q . '%')->pluck('id')->toArray();
        //         $query->whereIn('id', [$arr]);
        //     })
        //     ->when($request->fasilitas, function ($query, $q) {
        //         $arr = Fasilitas::where('desc', 'like', '%' . $q . '%')->pluck('id')->toArray();
        //         // dd($arr);
        //         $query->whereIn('id', [$arr]);
        //     })
        //     ->paginate(100)
        //     ->withQueryString();
        // // return $rooms;
        return Inertia::render('front/index');
    }

    public function tataCara()
    {
        return Inertia::render('front/tataCara');
    }

    public function room(Request $request)
    {
        $rooms = Room::when($request->nomor_room, function ($query, $q) {
            $query->where('nomor_room', 'like', '%' . $q . '%');
        })
            ->when($request->lantai, function ($query, $q) {
                $query->where('lantai', 'like', '%' . $q . '%');
            })
            ->when($request->tipe, function ($query, $q) {
                $arr = TipeRoom::where('desc', 'like', '%' . $q . '%')->pluck('id')->toArray();
                $query->whereIn('id', [$arr]);
            })
            ->when($request->fasilitas, function ($query, $q) {
                $arr = Fasilitas::where('desc', 'like', '%' . $q . '%')->pluck('id')->toArray();
                // dd($arr);
                $query->whereIn('id', [$arr]);
            })
            ->paginate(100)
            ->withQueryString();
        // return $rooms;
        return Inertia::render('front/room', [
            'rooms' => $rooms,
        ]);
    }

    public function peraturan()
    {

        return Inertia::render('front/peraturan', [
            'rules' => Rule::orderBy('no', 'asc')->get()
        ]);
    }

    public function booking()
    {
        return Inertia::render('front/home');
    }

    
}
