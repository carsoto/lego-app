<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 14 Mar 2019 16:02:26 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class InformacionAdicional
 * 
 * @property int $id
 * @property string $pregunta
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \Illuminate\Database\Eloquent\Collection $atletas
 *
 * @package App
 */
class InformacionAdicional extends Eloquent
{
	protected $table = 'informacion_adicional';

	protected $fillable = [
		'pregunta'
	];

	public function atletas()
	{
		return $this->belongsToMany(\App\Atleta::class, 'atletas_informacion_adicional', 'informacion_adicional_id', 'atletas_id')
					->withPivot('id', 'respuesta')
					->withTimestamps();
	}
}
