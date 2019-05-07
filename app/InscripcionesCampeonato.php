<?php

/**
 * Created by Reliese Model.
 * Date: Tue, 07 May 2019 01:48:52 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class InscripcionesCampeonato
 * 
 * @property int $id
 * @property int $atletas_id
 * @property int $campeonato_horarios_id
 * @property float $tarifa
 * @property float $descuento
 * @property float $pago
 * @property string $estatus_pago
 * @property \Carbon\Carbon $fecha_inscripcion
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Atleta $atleta
 * @property \App\CampeonatoHorario $campeonato_horario
 *
 * @package App
 */
class InscripcionesCampeonato extends Eloquent
{
	protected $table = 'inscripciones_campeonato';

	protected $casts = [
		'atletas_id' => 'int',
		'campeonato_horarios_id' => 'int',
		'tarifa' => 'float',
		'descuento' => 'float',
		'pago' => 'float',
		'activo' => 'int'
	];

	protected $dates = [
		'fecha_inscripcion'
	];

	protected $fillable = [
		'atletas_id',
		'campeonato_horarios_id',
		'tarifa',
		'descuento',
		'pago',
		'estatus_pago',
		'fecha_inscripcion',
		'activo'
	];

	public function atleta()
	{
		return $this->belongsTo(\App\Atleta::class, 'atletas_id');
	}

	public function campeonato_horario()
	{
		return $this->belongsTo(\App\CampeonatoHorario::class, 'campeonato_horarios_id');
	}
}
