@extends('adminlte::layouts.app')

@section('htmlheader_title')
    Base de datos
@endsection

@section('contentheader_title')
    Base de datos
@endsection

@section('main-content')
<div class="container-fluid spark-screen">
    <div class="row"> 
        <div class="col-lg-12">
            <div class="box box-danger">
                <div class="box-body">
                    <div class="table-responsive" style="padding-top: 15px;">
                        <table id='tabla_base_datos' class="table table-hover table-bordered table-striped datatable" style="width:100%; font-size: 11px;">
                            <thead>
                                <tr>
                                    <th class="text-center" colspan='6'>REPRESENTANTES</th>
                                </tr>
                                <tr>
                                    <th>Cédula</th>
                                    <th>Nombre</th>
                                    <th>Teléfono</th>
                                    <th>Correo</th>
                                    <th>Red social</th>
                                    <th><i class="fa fa-gears"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($representantes AS $key => $representante)
                                    <tr>
                                        <td>{{ $representante->cedula }}</td>
                                        <td>{{ $representante->nombres }} {{ $representante->apellidos }}</td>
                                        <td>{{ $representante->telf_contacto }}</td>
                                        <td>{{ $representante->email }}</td>
                                        <td>{{ $representante->red_social }}</td>
                                        <td><a href="#" onclick="detalles_representante('{{ encrypt($representante->id) }}');"><i class="fa fa-pencil"></i></a> <a href="#"><i class="fa fa-trash"></i></a></td>
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

<div class="modal fade" id="detalles-representante" tabindex="-1" role="dialog" aria-labelledby="detalles-representante-label">
    <div class="modal-lg modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Información</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-m btn-flat btn-primary" data-dismiss="modal">Actualizar</button>
                <button type="button" class="btn btn-m btn-flat btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>

@stop
