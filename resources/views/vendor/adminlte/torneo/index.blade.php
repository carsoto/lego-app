@extends('adminlte::layouts.allpublic')

@section('htmlheader_title')
    Torneos
@endsection

@section('content')
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="box box-danger">
                    <div class="box-body">
						@section('title-content')
							¡LEGO BEACH VOLLEY!
						@endsection
						@include('adminlte::layouts.principal')
						<div class="text-center">
							<img src="{{ asset('public/images/en_construccion.png') }}">
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
@stop

