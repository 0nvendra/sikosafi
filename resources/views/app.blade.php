<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title inertia>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('metronic/css/style.bundle.css') }}">
    <link rel="stylesheet" href="{{ asset('metronic/css/plugins.bundle.css') }}">


    <!-- Scripts -->
    @routes
    <script src="{{ mix('js/app.js') }}" defer></script>
    @inertiaHead
</head>

<body class="font-sans antialiased">
    @include('sweetalert::alert')
    @inertia

    @env ('local')
    <script src="http://localhost:8080/js/bundle.js"></script>
    <script src="{{ asset('metronic/plugins/global/plugins.bundle.js') }}"></script>
    <script src="{{ asset('metronic/js/scripts.bundle.js') }}"></script>
    <script src="{{ asset('metronic/js/plugins.bundle.js') }}"></script>
    @endenv
</body>

</html>