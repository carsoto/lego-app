@extends('adminlte::layouts.app')

@section('htmlheader_title')
    Workshop
@endsection

@section('contentheader_title')
    Workshop
@endsection

@section('main-content')
<div class="container-fluid spark-screen">
    <div class="row"> 
        <div class="col-lg-12">
            <div class="box box-danger">
                <div class="box-body">
                    <div class="table-responsive" style="padding-top: 15px;">
                        <table id='tabla_workshop' class="table table-hover table-bordered table-striped datatable" style="width:100%; font-size: 11px;">
                            <thead>
                                <tr>
                                    <th class="text-center" colspan='10'>INSCRITOS</th>
                                </tr>
                                <tr>
                                    <th>Representante</th>
                                    <th>Alumno</th>
                                    <th>Edad</th>
                                    <th>Inscripción</th>
                                    <th>Colegio</th>
                                    <th>Fecha</th>
                                    <th>Locación</th>
                                    <th>Pago</th>
                                    <th>Estatus</th>
                                    <th><i class="fa fa-gears"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($inscritos AS $key => $inscrito)
                                    <tr>
                                        <td>{{ ucwords($inscrito->representante) }}</td>
                                        <td>{{ ucwords($inscrito->alumno) }}</td>
                                        <td>{{ $inscrito->edad }} años</td>
                                        <td>{{ Carbon\Carbon::parse($inscrito->fecha_inscripcion)->format('d-m-Y') }}</td>
                                        <td>{{ ucwords($inscrito->colegio) }}</td>
                                        <td>{{ $inscrito->horario }}</td>
                                        <td>{{ $inscrito->locacion }}</td>
                                        <td><span id="pago_{{ $inscrito->ins_id }}">{{ $inscrito->pago }}</span></td>
                                        <td>
                                            @if($inscrito->status == 'Pendiente')
                                                <span id="status_{{ $inscrito->ins_id }}" class="label label-warning">{{ $inscrito->status }}</span>
                                            @elseif($inscrito->status == 'Pagado')
                                                <span id="status_{{ $inscrito->ins_id }}" class="label label-success">{{ $inscrito->status }}</span>
                                            @endif
                                        </td>

                                        <td>
                                            @if($inscrito->status == 'Pendiente')
                                                <span id="link_{{ $inscrito->ins_id }}"><a href="#" onclick="registrar_pago_workshop('{{ $inscrito->ins_id }}');"><i class="fa fa-dollar"></i></a> <a href="#" onclick="deshabilitar_inscripcion_workshop('{{ $inscrito->ins_id }}');"><i class="fa fa-trash"></i></a></span>
                                            @else
                                                <span id="link_{{ $inscrito->ins_id }}"><a href="#" onclick="deshabilitar_inscripcion_workshop('{{ $inscrito->ins_id }}');"><i class="fa fa-trash"></i></a></span>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop