<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('cedula', 'Cédula', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

    {!! Form::hidden('representante[id]',  $representante->id, array('class' => 'form-control input-sm', 'id' => 'representante-id')) !!}

    {!! Form::text('representante[cedula]', $representante->cedula, array('class' => 'form-control input-sm', 'onKeyPress'=>"return soloNumeros(event)", 'id' => 'representante-cedula')) !!}

</div>

<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('nombres', 'Nombres', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

    {!! Form::text('representante[nombres]', $representante->nombres, array('class' => 'form-control input-sm', 'id' => 'representante-nombre')) !!}

</div>


<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('apellidos', 'Apellidos', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

    {!! Form::text('representante[apellidos]', $representante->apellidos, array('class' => 'form-control input-sm', 'id' => 'representante-apellido')) !!}

</div>


<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('telf_contacto', 'Teléfono de contacto', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

    {!! Form::text('representante[telf_contacto]', $representante->telf_contacto, array('class' => 'form-control input-sm', 'onKeyPress'=>"return soloNumeros(event)", 'id' => 'representante-telefono')) !!}

</div>

<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('email', 'Correo electrónico', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

    {!! Form::text('representante[email]', $representante->email, array('class' => 'form-control input-sm', 'id' => 'representante-email')) !!}

</div>

<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('red_social', 'Instagram/Facebook', array('class' => 'control-label')) !!}<strong><span id="red-social-representante" style='color: red;'>*</span></strong>

    {!! Form::text('representante[red_social]', $representante->red_social, array('class' => 'form-control input-sm', 'id' => 'representante-red-social')) !!}

</div>

<div class="col-lg-12 col-md-12 col-sm-12" style="padding: 5px;">
    <div class="table-responsive">
        <table class="table table-striped table-bordered" style="font-size: 11px;">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th><i class="fa fa-gears"></i></th>
                </tr>
            </thead>    
            <tbody>
                @foreach($representante->atletas AS $key => $atleta)
                    <tr>
                        <td>{{ $atleta->nombre }}</td>
                        <td>{{ $atleta->apellido }}</td>
                        <td><a href="#"><i class="fa fa-trash"></i></a></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<!--"id" => 55
"cedula" => null
"nombre" => "NATALIA"
"apellido" => "FLORES"
"fecha_nacimiento" => "2005-08-06"
"red_social" => null
"telf_contacto" => null
"talla_top" => null
"talla_camiseta" => null
"instituto" => "COPOL"
"email" => null-->
<div class="clearfix"></div>

