@if($servicio == 'Academia')

	<div class="col-lg-12" id="t-inscripcion">

		{!! Form::label('t_inscripcion', 'Inscripción para: ') !!}

		<input type="radio" name="t_inscripcion" value="1"> Adultos

		<input type="radio" name="t_inscripcion" value="2"> Menores de edad

	</div>



	<div class="col-lg-12" id="ficha-representante" style="display: none;">

@else

	<div class="col-lg-12" id="ficha-representante">

@endif

		@include('adminlte::representante.form', ['tallas' => $tallas, 'preguntas' => $preguntas, 'datos_tarifas' => $datos_tarifas, 'servicio' => $servicio])

	</div>



@if($servicio == 'Academia')

	<div class="col-lg-12" id="ficha-atleta" style="padding-top: 15px; display: none;">

@elseif($servicio == 'Workshop' || $servicio == 'Campeonato')

	<div class="col-lg-12 collapse" id="ficha-atleta" style="padding-top: 15px;">

@else

	<div class="col-lg-12" id="ficha-atleta" style="padding-top: 15px;">

@endif

	@if($servicio != 'Workshop')

		<div class="text-center"><h3> Información del atleta </h3></div>



	    <hr>

		@include('adminlte::atleta.nino', ['tallas' => $tallas, 'servicio' => $servicio])

		

		@if($servicio == 'Academia')

			<div class="col-lg-12">

				@include('adminlte::academia.datos_prueba', ['locaciones' => $locaciones, 'dias_deshabilitados' => $dias_deshabilitados])

			</div>

		@endif



		@if(($servicio != 'Academia') && ($servicio != 'Workshop') && ($servicio != 'Torneo'))

			<div class="col-lg-12" id="informacion-adicional" style="padding-top: 15px;">

				@include('adminlte::atleta.informacion-adicional', ['preguntas' => $preguntas])	

			</div>

		@endif



		<div class="col-lg-12" style="padding-top: 20px;">

			<div class="text-right">

				<button type="button" class="btn btn-sm btn-flat btn-success" onclick="agregar_nino({{ $preguntas }}, {{ json_encode($datos_tarifas) }}, '{{ $servicio }}');"><i class="fa fa-plus"></i> Agregar nuevo atleta</button>

			</div>

		</div>

		<div class="col-lg-12" style="padding-top: 20px;">

			@include('adminlte::atleta.atletas-registrados')

		</div>

	@endif

</div>