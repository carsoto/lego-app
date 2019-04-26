<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 18 Apr 2019 20:47:34 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class WorkshopHorario
 * 
 * @property int $id
 * @property int $workshop_id
 * @property string $descripcion
 * @property float $tarifa_ins
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\Workshop $workshop
 * @property \Illuminate\Database\Eloquent\Collection $inscripciones_workshops
 * @property \Illuminate\Database\Eloquent\Collection $workshop_fechas
 *
 * @package App
 */
class WorkshopHorario extends Eloquent
{
	protected $table = 'workshop_horarios';

	protected $casts = [
		'workshop_id' => 'int',
		'tarifa_ins' => 'float',
		'activo' => 'int'
	];

	protected $fillable = [
		'workshop_id',
		'descripcion',
		'tarifa_ins',
		'activo'
	];

	public function workshop()
	{
		return $this->belongsTo(\App\Workshop::class);
	}

	public function inscripciones_workshop()
	{
		return $this->hasMany(\App\InscripcionesWorkshop::class, 'workshop_horarios_id');
	}

	public function workshop_fechas()
	{
		return $this->hasMany(\App\WorkshopFecha::class, 'workshop_horarios_id');
	}
}
