<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class BookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Booking';
    public function index(Request $request)
    {
        return Inertia::render('booking/approval', [
            'bookings' => Booking::when($request->faktur, function ($query, $q) {
                $query->where('order_code', 'like', '%' . $q . '%');
            })
                ->where('status_id', 1)
                ->orderByDesc("id")
                ->paginate(50)
                ->withQueryString(),
            'name' => $this->name . ' Approval'
        ]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show(Booking $booking)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit(Booking $booking)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Booking $booking)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(Booking $booking)
    {
        //
    }

    public function approve(Request $request)
    {
        // return $request->id;
        $book = Booking::find($request->id);
        #crosscheck apakah sudah taken
        $check = Booking::where('room_id', $book->room_id)
            ->where('status_id', 2)
            ->where('end_at', '>=', Carbon::now())->first();
        if ($check) {
            return 'room telah di booking oleh user lain!!';
        }
        $book->start_at = Carbon::now();
        $book->end_at = Carbon::now()->addDays(30);
        $book->admin_id = Auth::id();
        $book->status_id = 2;
        $book->save();
        return redirect()->route('approval');
    }

    public function cancelOrder(Request $request)
    {
        $book = Booking::find($request->id);
        $book->admin_id = Auth::id();
        $book->status_id = 3;
        $book->save();
        return redirect()->route('approval');
    }

    public function listed(Request $request)
    {
        return Inertia::render('booking/listed', [
            'bookings' => Booking::when($request->faktur, function ($query, $q) {
                $query->where('order_code', 'like', '%' . $q . '%');
            })
                ->where('status_id', 2)
                ->orderByDesc("id")
                ->paginate(50)
                ->withQueryString(),
            'name' => 'Daftar Boking'
        ]);
    }

    public function reminder()
    {
        // $users = User::all();
    }
}
