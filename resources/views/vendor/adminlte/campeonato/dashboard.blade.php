@extends('adminlte::layouts.app')

@section('htmlheader_title')
    Campeonato
@endsection

@section('contentheader_title')
    Campeonato
@endsection

@section('main-content')
<div class="container-fluid spark-screen">
    <div class="row"> 
        <div class="col-lg-12">
            <div class="box box-danger">
                <div class="box-body">
                    <div class="table-responsive" style="padding-top: 15px;">
                        <table id='tabla_workshop' class="table table-hover table-bordered table-striped datatable" style="width:100%;">
                            <thead style="font-size: 9px;">
                                <tr>
                                    <th class="text-center" colspan='11'>INSCRITOS</th>
                                </tr>
                                <tr>
                                	<th>C. representante</th>
                                    <th>Representante</th>
                                    <th>Jugador 1</th>
                                    <th>Jugador 2</th>
                                    <th>F. de Inscripción</th>
                                    <th>Campeonato</th>
                                    <th>Categoría</th>
                                    <th>Locación</th>
                                    <th>Pago</th>
                                    <th>Estatus</th>
                                    <th><i class="fa fa-gears"></i></th>
                                </tr>
                            </thead>
                            <tbody style="font-size: 11px;">
                                @foreach($inscritos AS $key => $inscrito)
                                    <tr>
	                            		<td>{{ $inscrito->cedula }}</td>
	                                    <td>{{ ucwords($inscrito->representante) }}</td>
	                                    <td>{{ ucwords($inscrito->jugador_1) }}</td>
	                                    <td>{{ ucwords($inscrito->jugador_2) }}</td>
	                                    <td>{{ Carbon\Carbon::parse($inscrito->fecha)->format('d-m-Y') }}</td>
	                                    <td>{{ $inscrito->categoria }}</td>
	                                    <td>{{ ucwords($inscrito->descripcion) }}</td>
	                                    <td>{{ ucwords($inscrito->ubicacion) }}</td>
	                                    <td><span id="pago_{{ $inscrito->id_dupla }}">{{ $inscrito->total }}</span></td>
	                                    <td>
	                                        @if($inscrito->status == 'Pendiente')
	                                            <span id="status_{{ $inscrito->id_dupla }}" class="label label-warning">{{ $inscrito->status }}</span>
	                                        @elseif($inscrito->status == 'Pagado')
	                                            <span id="status_{{ $inscrito->id_dupla }}" class="label label-success">{{ $inscrito->status }}</span>
	                                        @endif
	                                    </td>

	                                    <td>
	                                        @if($inscrito->status == 'Pendiente')
	                                            <span id="link_{{ $inscrito->id_dupla }}"><a href="#" onclick="registrar_pago_campeonato('{{ $inscrito->id_dupla }}');"><i class="fa fa-dollar"></i></a> <a href="#" onclick="deshabilitar_inscripcion_campeonato('{{ $inscrito->id_dupla }}');"><i class="fa fa-trash"></i></a></span>
	                                        @else
	                                            <span id="link_{{ $inscrito->id_dupla }}"><a href="#" onclick="deshabilitar_inscripcion_campeonato('{{ $inscrito->id_dupla }}');"><i class="fa fa-trash"></i></a></span>
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