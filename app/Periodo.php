<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 14 Mar 2019 16:02:26 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class Periodo
 * 
 * @property int $id
 * @property string $descripcion
 * @property int $activo
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \Illuminate\Database\Eloquent\Collection $tarifas
 *
 * @package App
 */
class Periodo extends Eloquent
{
	protected $casts = [
		'activo' => 'int'
	];

	protected $fillable = [
		'descripcion',
		'activo'
	];

	public function tarifas()
	{
		return $this->hasMany(\App\Tarifa::class, 'periodos_id');
	}
}
