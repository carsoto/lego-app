<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 18 Apr 2019 20:47:14 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Workshop
 * 
 * @property int $id
 * @property int $locaciones_id
 * @property string $descripcion
 * @property int $edad_inicio
 * @property int $edad_fin
 * @property string $h_inicio
 * @property string $h_fin
 * @property int $porcentaje_individual
 * @property int $porcentaje_grupal
 * @property \Carbon\Carbon $fecha_limite
 * @property int $activo
 * @property string $imagen
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Locacione $locacione
 * @property \Illuminate\Database\Eloquent\Collection $workshop_horarios
 *
 * @package App
 */
class Workshop extends Eloquent
{
	protected $table = 'workshop';

	protected $casts = [
		'locaciones_id' => 'int',
		'edad_inicio' => 'int',
		'edad_fin' => 'int',
		'porcentaje_individual' => 'int',
		'porcentaje_grupal' => 'int',
		'activo' => 'int'
	];

	protected $dates = [
		'fecha_limite'
	];

	protected $fillable = [
		'locaciones_id',
		'descripcion',
		'edad_inicio',
		'edad_fin',
		'h_inicio',
		'h_fin',
		'porcentaje_individual',
		'porcentaje_grupal',
		'fecha_limite',
		'activo',
		'imagen'
	];

	public function locaciones()
	{
		return $this->belongsTo(\App\Locacion::class, 'locaciones_id');
	}

	public function workshop_horarios()
	{
		return $this->hasMany(\App\WorkshopHorario::class);
	}
}
