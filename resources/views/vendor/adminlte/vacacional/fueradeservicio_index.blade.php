@extends('adminlte::layouts.allpublic')



@section('htmlheader_title')

    Vacacional

@endsection



@section('content')



<!-- Your Page Content Here -->

<div class="container-fluid">

    <div class="row">

        <div class="col-lg-10 col-lg-offset-1">

            <div class="box box-danger">

                <div class="box-body">

                    <div class="text-center">

						@section('title-content')
							¡LEGO BEACH VOLLEY!
						@endsection
						@include('adminlte::layouts.principal')
						<div style="text-align: center;">
                            <img src="{{ asset('public/images/en_construccion.png') }}">

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>



@stop

