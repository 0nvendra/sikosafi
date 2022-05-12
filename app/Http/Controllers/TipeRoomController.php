<?php

namespace App\Http\Controllers;

use App\Models\TipeRoom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class TipeRoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Tipe Room';
    public function index(Request $request)
    {
        // return view('coba');
        return Inertia::render('tipeRoom/index', [
            'trooms' => TipeRoom::when($request->nik, function ($query, $q) {
                $query->where('nik', 'like', '%' . $q . '%');
            })
                ->orderByDesc("id")
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
        return Inertia::render('tipeRoom/create', [
            'name' => $this->name,
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
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'desc' => 'Tipe Room',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            TipeRoom::create($validator);
            DB::commit();
            return redirect()->route('tipeRoom.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipeRoom  $tipeRoom
     * @return \Illuminate\Http\Response
     */
    public function show(TipeRoom $tipeRoom)
    {
        return Inertia::render('tipeRoom/show', [
            'name' => $this->name,
            'troom' => $tipeRoom,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TipeRoom  $tipeRoom
     * @return \Illuminate\Http\Response
     */
    public function edit(TipeRoom $tipeRoom)
    {
        return Inertia::render('tipeRoom/edit', [
            'name' => $this->name,
            'troom' => $tipeRoom,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipeRoom  $tipeRoom
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipeRoom $tipeRoom)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'desc' => 'Tipe Room',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $tipeRoom->update($validator);
            DB::commit();
            return redirect()->route('tipeRoom.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipeRoom  $tipeRoom
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipeRoom $tipeRoom)
    {
        try {
            DB::beginTransaction();
            $tipeRoom->delete();
            DB::commit();
            return redirect()->route('tipeRoom.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
}
