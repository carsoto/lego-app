<?php

/**
 * Created by Reliese Model.
 * Date: Mon, 27 May 2019 21:55:54 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class InscripcionesCampeonato
 * 
 * @property int $id
 * @property int $campeonato_horarios_id
 * @property int $campeonato_duplas_id
 * @property float $tarifa
 * @property float $descuento
 * @property float $pago
 * @property string $estatus_pago
 * @property \Carbon\Carbon $fecha_inscripcion
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\CampeonatoDupla $campeonato_dupla
 * @property \App\CampeonatoHorario $campeonato_horario
 *
 * @package App
 */
class InscripcionesCampeonato extends Eloquent
{
	protected $table = 'inscripciones_campeonato';

	protected $casts = [
		'campeonato_horarios_id' => 'int',
		'campeonato_duplas_id' => 'int',
		'tarifa' => 'float',
		'descuento' => 'float',
		'pago' => 'float',
		'activo' => 'int'
	];

	protected $dates = [
		'fecha_inscripcion'
	];

	protected $fillable = [
		'campeonato_horarios_id',
		'campeonato_duplas_id',
		'tarifa',
		'descuento',
		'pago',
		'estatus_pago',
		'fecha_inscripcion',
		'activo'
	];

	public function campeonato_dupla()
	{
		return $this->belongsTo(\App\CampeonatoDupla::class, 'campeonato_duplas_id');
	}

	public function campeonato_horario()
	{
		return $this->belongsTo(\App\CampeonatoHorario::class, 'campeonato_horarios_id');
	}
}
