<div class="table-responsive">
	<table id="lista-atletas" class="table table-bordered" style="font-size: 11px;">
		<thead>
			<th colspan="6" class="text-center"> ATLETAS AGREGADOS </th>
		</thead>
		<tbody>
			<tr>
				<th class="hidden-xs">Fecha de nac.</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th class="hidden-xs">Cédula</th>
				<th class="hidden-xs">Colegio</th>
				<th><i class="fa fa-gears"></i></th>
			</tr>
		</tbody>
	</table>
</div>

<!--<table id="lista-atletas" class="table" style="font-size: 11px;">
	<thead>
		<th colspan="6" class="text-center"> ATLETAS AGREGADOS </th>
	</thead>
	<tbody>
		<tr>
			<th>Nombre</th>
			<th>Apellido</th>
			<th><i class="fa fa-gears"></i></th>
		</tr>
	</tbody>
</table>
<div class="clearfix"></div>


<div class="collapse" id="ficha-atleta" style="padding-top: 15px;">
	<div class="text-center"><h3> Información del atleta </h3></div>

	<hr>
	@//include('adminlte::atleta.nino', ['tallas' => $tallas, 'servicio' => $servicio])
	<div style="padding-top: 20px; padding-left: 5px; padding-right: 5px; padding-bottom: 20px;">
		<div class="text-right">
			<button type="button" class="btn btn-sm btn-flat btn-success" onclick="agregar_nino({{ $preguntas }}, {{ json_encode($datos_tarifas) }}, '{{ $servicio }}');"><i class="fa fa-plus"></i> Agregar nuevo atleta</button>
		</div>
	</div>
</div>-->