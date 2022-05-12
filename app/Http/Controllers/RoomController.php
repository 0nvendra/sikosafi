<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use App\Models\Room;
use App\Models\TipeRoom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Rooms';
    public function index(Request $request)
    {
        return Inertia::render('room/index', [
            'rooms' => Room::when($request->nomor_room, function ($query, $q) {
                $query->where('nomor_room', 'like', '%' . $q . '%');
            })
                ->orderBy("id", "asc")
                ->paginate(10)
                ->withQueryString(),
            'name' => $this->name
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tRooms = TipeRoom::all();
        $fasilitases = Fasilitas::all();
        return Inertia::render('room/create', [
            'name' => $this->name,
            // relation
            'trooms' => $tRooms,
            'fasilitases' => $fasilitases,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'nomor_room' => ['required'],
                'lantai' => ['required'],
                'tipe_room_id' => ['required'],
                'fasilitas_id' => ['required'],
                'price' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nomor_room' => 'NO ROOM',
                'lantai' => 'LANTAI',
                'tipe_room_id' => 'TIPE ROOM',
                'fasilitas_id' => 'FASILITAS',
                'price' => 'HARGA SEWA',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            Room::create($validator);
            DB::commit();
            return redirect()->route('room.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function show(Room $room)
    {
        $tRooms = TipeRoom::all();
        $fasilitases = Fasilitas::all();
        return Inertia::render('room/show', [
            'name' => $this->name,
            'room' => $room,
            // relation
            'trooms' => $tRooms,
            'fasilitases' => $fasilitases,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function edit(Room $room)
    {
        $tRooms = TipeRoom::all();
        $fasilitases = Fasilitas::all();
        return Inertia::render('room/edit', [
            'name' => $this->name,
            'room' => $room,
            // relation
            'trooms' => $tRooms,
            'fasilitases' => $fasilitases,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Room $room)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'nomor_room' => ['required'],
                'lantai' => ['required'],
                'tipe_room_id' => ['required'],
                'fasilitas_id' => ['required'],
                'price' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nomor_room' => 'NO ROOM',
                'lantai' => 'LANTAI',
                'tipe_room_id' => 'TIPE ROOM',
                'fasilitas_id' => 'FASILITAS',
                'price' => 'HARGA SEWA',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $room->update($validator);
            DB::commit();
            return redirect()->route('room.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function destroy(Room $room)
    {
        try {
            DB::beginTransaction();
            $room->delete();
            DB::commit();
            return redirect()->route('room.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
}
