<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Fasilitas;
use App\Models\Room;
use App\Models\Rule;
use App\Models\TipeRoom;
use App\Models\Visitor;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;
use RealRashid\SweetAlert\Facades\Alert;

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
        $v = Visitor::create([
            'ip' => request()->ip(),
        ]);
        // Alert::success('Congrats', 'You\'ve Successfully Registered');
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
        // return $rooms;
        $param = "";
        if (session()->get('msg')) {
            // Alert::success('Berhasil', session()->get('msg'));
            $param = "Booked berhasil, harap tunggu konfirmasi admin";
        }
        return Inertia::render('front/index', [
            'msg' => $param
        ]);
    }

    public function tataCara()
    {
        return Inertia::render('front/tataCara');
    }

    public function room(Request $request)
    {
        $searchString = $request->fasilitas;
        $rooms = Room::whereHas('fasilitas', function ($query) use ($searchString) {
            $query->where('desc', 'like', '%' . $searchString . '%');
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

    public function newOrder(Request $request)
    {
        try {
            DB::beginTransaction();
            $image_path = '';
            if ($request->hasFile('image')) {
                $image_path = $request->file('image')->store('image', 'public');
            }
            $rules = [
                'order_code' => [''],
                'user_id' => ['required'],
                'room_id' => ['required'],
                'start_at' => [''],
                'end_at' => [''],
                'price' => ['required'],
                'bukti_tf' => ['required'],
                'status_id' => [''],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'order_code' => 'Faktur',
                'user_id' => 'Pengguna',
                'room_id' => 'Room',
                'start_at' => 'Awal sewa invalid',
                'end_at' => 'Akhir sewa invalid',
                'price' => 'Harga',
                'bukti_tf' => 'Bukti Transfer',
            ];
            $room = Room::find($request['id']);
            $user = Auth::id();
            $booking = [
                'order_code' => $this->genFaktur(),
                'user_id' => $user,
                'room_id' => $room->id,
                'start_at' => null,
                'end_at' => null,
                'price' => $room->price,
                'bukti_tf' => $image_path,
                'status_id' => 1,
            ];
            $validator = Validator::make($booking, $rules, $messages, $attributes)->validate();
            #check dlu kalaus udh di booking/belum
            // $check = Booking::where('room_id', $room->id)
            //     ->where('',)->first();

            Booking::create($validator);
            DB::commit();
            return redirect()->route('front.index')->with(['msg' => true]);
        } catch (\Throwable $th) {
            DB::rollBack();
            // return $th;
            throw $th;
        }
    }

    public function genFaktur()
    {
        $count = DB::table('bookings')->count();
        $date = Carbon::now();
        $gen  = "ORDER/" . substr($date->year, -2) . '/' . $date->month . '/';
        $x = '';
        if ($count == 0) {
            $x = $gen . '0001';
        } else {
            $last = Booking::latest()->first();
            if ($last) {
                $lastChar = substr($last->order_code, -4);
                $nr =  str_pad($lastChar + 1, 4, "0", STR_PAD_LEFT);
                $x = $gen . $nr;
            }
        }
        $faktur = $x;
        return $faktur;
    }

    public function history(Request $request)
    {
        $bookings = Booking::when($request->faktur, function ($query, $q) {
            $query->where('order_code', 'like', '%' . $q . '%');
        })->where('user_id', Auth::id())
            ->orderByDesc("id")
            ->paginate(10)
            ->withQueryString();
        // return $bookings;
        return Inertia::render('front/history', [
            'histories' => $bookings,
            'name' => 'Riwayat saya'
        ]);
    }
}
