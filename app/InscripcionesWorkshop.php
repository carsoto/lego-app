<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 18 Apr 2019 20:48:00 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class InscripcionesWorkshop
 * 
 * @property int $id
 * @property int $atletas_id
 * @property int $workshop_horarios_id
 * @property float $tarifa
 * @property int $descuento
 * @property float $pago
 * @property string $estatus_pago
 * @property \Carbon\Carbon $fecha_inscripcion
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Atleta $atleta
 * @property \App\WorkshopHorario $workshop_horario
 *
 * @package App
 */
class InscripcionesWorkshop extends Eloquent
{
	protected $table = 'inscripciones_workshop';

	protected $casts = [
		'atletas_id' => 'int',
		'workshop_horarios_id' => 'int',
		'tarifa' => 'float',
		'descuento' => 'int',
		'pago' => 'float',
		'activo' => 'int'
	];

	protected $dates = [
		'fecha_inscripcion'
	];

	protected $fillable = [
		'atletas_id',
		'workshop_horarios_id',
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

	public function workshop_horario()
	{
		return $this->belongsTo(\App\WorkshopHorario::class, 'workshop_horarios_id');
	}
}
