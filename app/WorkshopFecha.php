<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 18 Apr 2019 20:47:26 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class WorkshopFecha
 * 
 * @property int $id
 * @property int $workshop_horarios_id
 * @property \Carbon\Carbon $fecha_inicio
 * @property \Carbon\Carbon $fecha_fin
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\WorkshopHorario $workshop_horario
 *
 * @package App
 */
class WorkshopFecha extends Eloquent
{
	protected $table = 'workshop_fechas';

	protected $casts = [
		'workshop_horarios_id' => 'int'
	];

	protected $dates = [
		'fecha_inicio',
		'fecha_fin'
	];

	protected $fillable = [
		'workshop_horarios_id',
		'fecha_inicio',
		'fecha_fin'
	];

	public function workshop_horario()
	{
		return $this->belongsTo(\App\WorkshopHorario::class, 'workshop_horarios_id');
	}
}
