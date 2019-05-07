<?php

/**
 * Created by Reliese Model.
 * Date: Tue, 07 May 2019 01:44:02 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Campeonato
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
 * @property \Illuminate\Database\Eloquent\Collection $campeonato_facturas
 * @property \Illuminate\Database\Eloquent\Collection $campeonato_horarios
 *
 * @package App
 */
class Campeonato extends Eloquent
{
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

	public function campeonato_facturas()
	{
		return $this->hasMany(\App\CampeonatoFactura::class, 'campeonatos_id');
	}

	public function campeonato_horarios()
	{
		return $this->hasMany(\App\CampeonatoHorario::class);
	}
}
