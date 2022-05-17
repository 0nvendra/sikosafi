<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Report SIKOSAFI Sewa Per {{$tgl['start']}} - {{$tgl['end']}}
    </title>
    <style>
        html * {
            font-family: helvetica !important;
        }

        .td-10 {
            width: 80px;
            min-width: 80px;
            max-width: 10%;
        }

        .td-20 {
            width: 160px;
            min-width: 160px;
            max-width: 20%;
        }

        .td-25 {
            width: 200px;
            min-width: 200px;
            max-width: 25%;
        }

        .td-50 {
            min-width: 400px;
            max-width: 50%;
        }

        .td-100 {
            min-width: 800px;
            max-width: 100%;
        }

        .table1 {
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            border: none;
            background-color: white;
        }

        table,
        tr,
        th {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-left: 1px solid black;
            border-right: 1px solid black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        html {
            margin: 0px font
        }

        @page {
            margin: 0px;
        }

        body {
            margin: 0px;
        }

        .column-left {
            float: left;
            width: 50%;
            padding: 10px;
            /* height: 300px; */
            /* Should be removed. Only for demonstration */
        }

        .column-right {
            float: left;
            width: 50%;
            padding: 10px;
            /* height: 300px; */
            /* Should be removed. Only for demonstration */
        }


        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
</head>

<body style="padding: 24px;">
    <div class="container" style="border: 1px">
        <table class="table">
            <thead>
                <tr style="background-color: grey;">
                    <th>NO Kamar</th>
                    <th>Penyewa</th>
                    <th>Fasilitas</th>
                    <th>Tgl mulai sewa</th>
                    <th>Tgl akhir sewa</th>
                    <th>Harga</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($bookings as $i => $booking)
                <tr>
                    <td><center>{{ $booking->room->nomor_room }}</center></td>
                    <td>{{ $booking->User->nama }}</td>
                    <td>
                    {{$booking->room->fasilitas->descF[1]}}
                    </td>
                    <td>{{ date('j F, Y', strtotime($booking->start_at)) }}</td>
                    <td>{{date('j F, Y', strtotime($booking->end_at)) }}</td>
                    <td>Rp. {{ @currency($booking->price) }}</td>
                </tr>
                @endforeach
                <tr>
                    <td colspan="6"><hr></td>
                </tr>
                <tr style="background-color: silver;">
                    <td colspan="5"><center><b>GrandTotal</b></center></td>
                    <td>Rp. {{ @currency($gt) }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>