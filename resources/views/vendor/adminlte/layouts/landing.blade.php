<!DOCTYPE html>

<!--

Landing page based on Pratt: http://blacktie.co/demo/pratt/

-->

<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="LEGO - academia de beach volley en Guayaquil - Ecuador">

    <meta name="author" content="Carmen María Soto">

    <meta property="og:title" content="LEO" />

    <meta property="og:type" content="website" />

    <meta property="og:description" content="{{ env('APP_NAME') }}" />

    <meta property="og:url" content="http://legovolley.com/app/" />

    <meta property="og:image" content="" />

    <meta property="og:sitename" content="lego.volley" />

    <meta property="og:url" content="http://legovolley.com/app/" />

    <meta name="twitter:card" content="summary_large_image" />

    <meta name="twitter:site" content="@CarmenSotoO" />

    <meta name="twitter:creator" content="@CarmenSotoO" />

    <title>LEGO - academia de beach volley</title>

    <title>{{ env('APP_NAME') }}</title>

    <!-- Custom styles for this template -->

    <link href="{{ asset('/public/css/all-landing.css') }}" rel="stylesheet">
    <link href="{{ asset('/public/css/all-public.css') }}" rel="stylesheet">

    <link rel="icon" href='{{ asset('/public/images/logo-lego.ico') }}' type="image/x-icon">
    <link rel="shortcut icon" href='{{ asset('/public/images/logo-lego.ico') }}' type="image/x-icon"> 

    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>

</head>

<body data-spy="scroll" data-offset="0" data-target="#navigation">

<div id="app">

	@section('title-content')
		¡Bienvenidos a nuestra academia!
	@endsection

	@include('adminlte::layouts.principal')
   
    <div style="text-align: center;">    
        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-info" href="{{ route('academia.index') }}">ACADEMIA</a></div>
        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-warning" href="{{ route('alquiler.index') }}">ALQUILER</a></div>
        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-success" href="{{ route('campeonato.index') }}">CAMPEONATO</a></div>
        @if($campamentos)
            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-primary" href="{{ route('campamento.index') }}">CAMPAMENTOS</a></div>
        @else
            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-primary" href="{{ route('workshop.index') }}">WORKSHOP</a></div>
        @endif
        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block btn-danger" href="{{ route('vacacional.index') }}">VACACIONALES</a></div>
        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-bottom: 10px;"><a class="btn btn-flat btn-block bg-purple" href="{{ route('campeonato.index') }}">UNIFORMES</a></div>
    </div>
</div>

<!-- Bootstrap core JavaScript

================================================== -->

<!-- Placed at the end of the document so the pages load faster -->

<script src="{{ asset('/public/js/app.js') }}"></script>

<script src="{{ asset('/public/js/smoothscroll.js') }}"></script>

<script>

    $('.carousel').carousel({

        interval: 3500

    })

</script>

</body>

</html>

