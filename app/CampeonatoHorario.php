<?php

/**
 * Created by Reliese Model.
 * Date: Tue, 07 May 2019 01:47:24 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class CampeonatoHorario
 * 
 * @property int $id
 * @property int $campeonato_id
 * @property string $descripcion
 * @property float $tarifa_ins
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Campeonato $campeonato
 * @property \Illuminate\Database\Eloquent\Collection $campeonato_categorias
 * @property \Illuminate\Database\Eloquent\Collection $inscripciones_campeonatos
 *
 * @package App
 */
class CampeonatoHorario extends Eloquent
{
	protected $casts = [
		'campeonato_id' => 'int',
		'tarifa_ins' => 'float',
		'activo' => 'int'
	];

	protected $fillable = [
		'campeonato_id',
		'descripcion',
		'tarifa_ins',
		'activo'
	];

	public function campeonato()
	{
		return $this->belongsTo(\App\Campeonato::class);
	}

	public function campeonato_categorias()
	{
		return $this->hasMany(\App\CampeonatoCategoria::class, 'campeonato_horarios_id');
	}

	public function inscripciones_campeonatos()
	{
		return $this->hasMany(\App\InscripcionesCampeonato::class, 'campeonato_horarios_id');
	}
}
