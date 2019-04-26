<div class="col-lg-offset-3 col-md-offset-3 row" style="padding: 5px;">	
	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	    {!! Form::label('cedula', 'Cedula') !!}<strong><span style='color: red;'>*</span></strong>
	    {!! Form::text('cedula', null, array('class' => 'form-control input-sm', 'id' => 'cedula_rep_registrado')) !!}
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="padding-top: 4px;">
	    <br>
	    <button class="btn btn-sm btn-flat btn-block btn-danger" type="button" onclick="buscarRegistros('{{ $servicio }}', {{ json_encode($datos_tarifas) }});"><i class="fa fa-refresh"></i> CARGAR DATOS</button>
	</div>
</div>

<hr>
<div class="text-center"><h3> Información del representante </h3></div>
<hr>
<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

	{!! Form::label('cedula', 'Cédula', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

	{!! Form::hidden('representante[id]', null, array('class' => 'form-control input-sm', 'id' => 'representante-id')) !!}
	{!! Form::text('representante[cedula]', null, array('class' => 'form-control input-sm', 'onKeyPress'=>"return soloNumeros(event)", 'id' => 'representante-cedula')) !!}

</div>

<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

	{!! Form::label('nombres', 'Nombres', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

	{!! Form::text('representante[nombres]', null, array('class' => 'form-control input-sm', 'id' => 'representante-nombre')) !!}

</div>



<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

	{!! Form::label('apellidos', 'Apellidos', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

	{!! Form::text('representante[apellidos]', null, array('class' => 'form-control input-sm', 'id' => 'representante-apellido')) !!}

</div>



<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

	{!! Form::label('telf_contacto', 'Teléfono de contacto', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

	{!! Form::text('representante[telf_contacto]', null, array('class' => 'form-control input-sm', 'onKeyPress'=>"return soloNumeros(event)", 'id' => 'representante-telefono')) !!}

</div>



<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

	{!! Form::label('email', 'Correo electrónico', array('class' => 'control-label')) !!}<strong><span style='color: red;'>*</span></strong>

	{!! Form::text('representante[email]', null, array('class' => 'form-control input-sm', 'id' => 'representante-email')) !!}

</div>

<div class="col-lg-4 col-md-4 col-sm-4" style="padding: 5px;">

    {!! Form::label('red_social', 'Instagram/Facebook', array('class' => 'control-label')) !!}<strong><span id="red-social-representante" style='color: red;'>*</span></strong>

    {!! Form::text('representante[red_social]', null, array('class' => 'form-control input-sm', 'id' => 'representante-red-social')) !!}

</div>

@if($servicio != 'Academia')
	<a href="#ficha-atleta" data-toggle="collapse">¿Desea agregar un nuevo atleta?</a>
	
	<div class="collapse" id="ficha-atleta" style="padding-top: 15px;">
		<div class="text-center"><h3> Información del atleta </h3></div>

		<hr>
		@include('adminlte::atleta.nino', ['tallas' => $tallas, 'servicio' => $servicio])
		<div style="padding-top: 20px;">
			<div class="text-right">
				<button type="button" class="btn btn-sm btn-flat btn-primary" onclick="agregar_nino({{ $preguntas }}, {{ json_encode($datos_tarifas) }}, '{{ $servicio }}');"><i class="fa fa-plus"></i> Agregar nuevo atleta</button>
			</div>
		</div>
	</div>

	<div id="div-lista-atletas-registrados" class="col-lg-12" style="padding-top: 20px;">
		@include('adminlte::atleta.atletas-registrados')
	</div>
@endif