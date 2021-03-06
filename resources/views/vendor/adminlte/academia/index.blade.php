@extends('adminlte::layouts.allpublic')

@section('htmlheader_title')
    Academia
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
							Te invitamos a recibir una clase totalmente <span class="label label-danger">GRATUITA</span> antes de inscribirte en nuestra ACADEMIA
						@endsection
						@include('adminlte::layouts.principal')
                    </div>
                    <div class="text-center">
                        <!--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-bottom: 20px;"><a href="{{ route('academia.inscripcion_prueba') }}" class="btn btn-flat btn-success">Tomar clase de prueba</a></div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-bottom: 20px;"><a href="{{ route('academia.inscripcion') }}" class="btn btn-flat btn-primary">¿Primera vez en la academia?</a></div>-->

                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-bottom: 20px;"><a href="{{ route('academia.inscripcion') }}" class="btn btn-block btn-flat btn-success">Tomar clase de prueba</a></div>

                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-bottom: 20px;"><a href="{{ route('academia.miembro') }}" class="btn btn-block btn-flat btn-danger">Academia</a></div>
                        
                        <!--<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-bottom: 20px;"><a onclick="buscarRegistros();" class="btn btn-flat btn-success">Ingresar a la academia</a></div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@stop
