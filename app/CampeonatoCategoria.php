<?php

/**
 * Created by Reliese Model.
 * Date: Tue, 07 May 2019 01:46:21 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class CampeonatoCategoria
 * 
 * @property int $id
 * @property int $campeonato_horarios_id
 * @property string $anyo_inicio
 * @property string $anyo_fin
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\CampeonatoHorario $campeonato_horario
 *
 * @package App
 */
class CampeonatoCategoria extends Eloquent
{
	protected $casts = [
		'campeonato_horarios_id' => 'int', 'edad_maxima' => 'int'
	];

	protected $fillable = [
		'campeonato_horarios_id',
		'edad_maxima',
		'anyo_inicio',
		'anyo_fin'
	];

	public function campeonato_horario()
	{
		return $this->belongsTo(\App\CampeonatoHorario::class, 'campeonato_horarios_id');
	}
}
