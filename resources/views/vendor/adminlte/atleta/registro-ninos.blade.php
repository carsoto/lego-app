@if($servicio == 'Academia')

<div class="col-lg-12" id="t-inscripcion">

	{!! Form::label('t_inscripcion', 'Inscripción para: ') !!}

	<input type="radio" name="t_inscripcion" value="1"> Adultos

	<input type="radio" name="t_inscripcion" value="2"> Menores de edad

</div>



<div class="col-lg-12" id="ficha-representante" style="display: none;">



	<div class="text-center"><h3> Información del representante </h3></div>



    <hr>



	@include('adminlte::representante.form')



</div>





<div class="col-lg-12" id="ficha-atleta" style="padding-top: 15px; display: none;">



	<div class="text-center"><h3> Información del atleta </h3></div>



    <hr>



	@include('adminlte::atleta.nino', ['tallas' => $tallas, 'preguntas' => $preguntas, 'servicio' => $servicio])



	@if($servicio == 'Prueba Academia')

		<div class="col-lg-12">

			@include('adminlte::academia.datos_prueba', ['locaciones' => $locaciones, 'dias_deshabilitados' => $dias_deshabilitados])	

		</div>

	@endif



	@if($servicio == 'Academia')

		<div class="col-lg-12" id="academia-horario" style="padding-top: 15px;">



			@include('adminlte::academia.horarios')	



		</div>

	@endif



	@if($servicio != 'Prueba Academia')

		<div class="col-lg-12" id="informacion-adicional" style="padding-top: 15px;">



			@include('adminlte::atleta.informacion-adicional', ['preguntas' => $preguntas])	



		</div>

	@endif

	<div class="col-lg-12">



		<div class="text-right">



			<button type="button" class="btn btn-sm btn-flat btn-primary" onclick="agregar_nino({{ $preguntas }}, {{ json_encode($datos_tarifas) }}, '{{ $servicio }}');"><i class="fa fa-plus"></i> Agregar nuevo atleta</button>



		</div>	



	</div>





	<div class="col-lg-12" style="padding-top: 20px;">



		<div class="table-responsive">



			<table id="lista-atletas" class="table table-bordered" style="font-size: 11px;">



				<thead>



					<th colspan="6" class="text-center"> ATLETAS AGREGADOS </th>



				</thead>



				<tbody>



					<tr>



						<th>Fecha de nac.</th>



						<th>Nombre</th>



						<th>Apellido</th>



						<th>Cédula</th>



						<th>Colegio</th>

						

						<th><i class="fa fa-gears"></i></th>



					</tr>



				</tbody>



			</table>	



		</div>



	</div>



</div>



@else

	<div class="col-lg-12" id="ficha-representante">



		<div class="text-center"><h3> Información del representante </h3></div>



	    <hr>



		@include('adminlte::representante.form')



	</div>





	<div class="col-lg-12" id="ficha-atleta" style="padding-top: 15px;">



		<div class="text-center"><h3> Información del atleta </h3></div>



	    <hr>



		@include('adminlte::atleta.nino', ['tallas' => $tallas, 'preguntas' => $preguntas, 'servicio' => $servicio])



		@if($servicio == 'Prueba Academia')

			<div class="col-lg-12">

				@include('adminlte::academia.datos_prueba', ['locaciones' => $locaciones, 'dias_deshabilitados' => $dias_deshabilitados])	

			</div>

		@endif



		@if($servicio == 'Academia')

			<div class="col-lg-12" id="academia-horario" style="padding-top: 15px;">



				@include('adminlte::academia.horarios')	



			</div>

		@endif



		@if($servicio != 'Prueba Academia')

			<div class="col-lg-12" id="informacion-adicional" style="padding-top: 15px;">



				@include('adminlte::atleta.informacion-adicional', ['preguntas' => $preguntas])	



			</div>

		@endif

		<div class="col-lg-12">



			<div class="text-right">



				<button type="button" class="btn btn-sm btn-flat btn-primary" onclick="agregar_nino({{ $preguntas }}, {{ json_encode($datos_tarifas) }}, '{{ $servicio }}');"><i class="fa fa-plus"></i> Agregar atleta</button>



			</div>	



		</div>





		<div class="col-lg-12" style="padding-top: 20px;">



			<div class="table-responsive">



				<table id="lista-atletas" class="table table-bordered" style="font-size: 11px;">



					<thead>



						<th colspan="6" class="text-center"> ATLETAS AGREGADOS </th>



					</thead>



					<tbody>



						<tr>



							<th>Fecha de nac.</th>



							<th>Nombre</th>



							<th>Apellido</th>



							<th>Cédula</th>



							<th>Colegio</th>

							

							<th><i class="fa fa-gears"></i></th>



						</tr>



					</tbody>



				</table>	



			</div>



		</div>



	</div>

@endif