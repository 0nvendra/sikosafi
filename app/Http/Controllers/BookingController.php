<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Room;
use App\Models\User;
use Barryvdh\DomPDF\Facade as PDF;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Twilio\Rest\Client;

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
        $book->start_at = null;
        $book->end_at = null;
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
        #jam 10
        $raw7 = Booking::where('end_at', '<', Carbon::now()->addDays(7))->get();
        $raw3 = Booking::where('end_at', '<', Carbon::now()->addDays(3));
        $raw = Booking::where('end_at', '<', Carbon::now()->addDays(1));
        #send Notif twilio
        foreach ($raw7 as $key => $value) {
            $this->sendNotif($value->user, 7);
        }
        foreach ($raw3 as $key => $value) {
            $this->sendNotif($value->user, 3);
        }
        foreach ($raw as $key => $value) {
            $this->sendNotif($value->user, 1);
        }
        return 'ok';
    }

    public function sendNotif(User $recipient, $hari)
    {
        $sid    = getenv("TWILIO_AUTH_SID");
        $token  = getenv("TWILIO_AUTH_TOKEN");
        $wa_from = getenv("TWILIO_WHATSAPP_FROM");
        $twilio = new Client($sid, $token);

        $body = "Hai " . $recipient->nama . ' sewa kamu akan berakhir dalam: ' . $hari . ' lagi, harap segera memperbarui sewa ya :)';

        $msg = $twilio->messages->create(
            "whatsapp:" . $recipient->telp,
            ["from" => "whatsapp:" . $wa_from, "body" => $body]
        );
    }

    public function test()
    {
        $sid    = getenv("TWILIO_AUTH_SID");
        $token  = getenv("TWILIO_AUTH_TOKEN");
        $wa_from = getenv("TWILIO_WHATSAPP_FROM");
        $twilio = new Client($sid, $token);

        $body = "Hai  sewa kamu akan berakhir dalam:  lagi, harap segera memperbarui sewa ya :)";

        $msg = $twilio->messages->create(
            "whatsapp:" . "6282299825920",
            ["from" => "whatsapp:" . $wa_from, "body" => $body]
        );
        print($msg);
    }

    public function reportPage()
    {
        return Inertia::render('report/index', [
            'name' => 'Generate Report'
        ]);
    }

    public function reportGenerate(Request $request)
    {
        // $data = $request->all();
        // return $data;
        // $room = Room::all();
        // return $room;
        $bookings = Booking::where('start_at', '>', $request->start_at)
            ->where('end_at', '>', $request->end_at); //->get();
        $tgl = [
            'start' => $request->start_at,
            'end' => $request->end_at,
        ];
        $gt = $bookings->sum('price');
        $bookings = $bookings->get();
        // return $bookings;
        $pdf = PDF::loadview('report.sewa', compact('bookings', 'tgl', 'gt'));
        // $pdf->setPaper(array(0, 0, 700.00, 793.7), $this->layout);
        // return $pdf->download('report-bulanan.pdf');
        return $pdf->stream('report-bulanan.pdf');
    }
}
