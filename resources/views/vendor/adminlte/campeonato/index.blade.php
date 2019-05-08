@extends('adminlte::layouts.allpublic')

@section('htmlheader_title')
    Campeonato
@endsection

@section('content')
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="box box-danger">
                    @if(!empty($datos_tarifas))
                        <div class="box-body">
                            @section('title-content')
                                ¡LEGO BEACH VOLLEY campeonato!
                            @endsection
                            @include('adminlte::layouts.principal')

                            <div class="stepwizard">
                                <div class="stepwizard-row setup-panel">
                                    <div class="stepwizard-step">
                                        <a href="#step-1" type="button" class="btn nextBtn btn-danger btn-circle">1</a>
                                        <p>Registro</p>
                                    </div>
                                    <div class="stepwizard-step">
                                        <a href="#step-2" type="button" class="btn nextBtn btn-default btn-circle" disabled="disabled">2</a>
                                        <p>Finalizar</p>
                                    </div>
                                </div>
                            </div>

                            {!! Form::open(['route' => 'campeonato.store', 'role' => 'form', 'id' => 'form-inscripcion-campeonato']) !!}
                                <div class="row setup-content" id="step-1">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        @include('adminlte::atleta.registro-ninos', ['tallas' => $tallas, 'preguntas' => $preguntas, 'datos_tarifas' => $datos_tarifas, 'servicio' => $servicio])
                                        <button class="btn btn-danger btn-md pull-right" type="button" style="display: none;" id="button-datos-sig" onclick="proceso_campeonato(this, 1)">Siguiente <i class="fa fa-angle-double-right"></i></button>
                                    </div>
                                </div>
                                <div class="row setup-content" id="step-2">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        @include('adminlte::campeonato.resumen_pago')
                                        <div class="pull-right">

                                            <button class="btn btn-danger btn-flat btn-md" type="submit" onclick="deshabilitarclick(this)">Inscribir</button>    

                                        </div>
                                    </div>
                                </div>
                            {!! Form::close() !!}

                        </div>
                    @else
                        @include('adminlte::layouts.servicio_inactivo')
                    @endif
                </div>
            </div>
        </div>
    </div>
</body>
@stop