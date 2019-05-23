<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 16 May 2019 21:22:23 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class CampeonatoDupla
 * 
 * @property int $id
 * @property int $campeonato_categorias_id
 * @property int $representantes_id
 * @property int $atleta_id_jugador1
 * @property string $jugador_1
 * @property int $atleta_id_jugador2
 * @property string $jugador_2
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\CampeonatoCategoria $campeonato_categoria
 * @property \App\Representante $representante
 * @property \Illuminate\Database\Eloquent\Collection $campeonato_facturas
 * @property \Illuminate\Database\Eloquent\Collection $inscripciones_campeonatos
 *
 * @package App
 */
class CampeonatoDupla extends Eloquent
{
	protected $casts = [
		'campeonato_categorias_id' => 'int',
		'representantes_id' => 'int',
		'atleta_id_jugador1' => 'int',
		'atleta_id_jugador2' => 'int'
	];

	protected $fillable = [
		'campeonato_categorias_id',
		'representantes_id',
		'atleta_id_jugador1',
		'jugador_1',
		'atleta_id_jugador2',
		'jugador_2'
	];

	public function campeonato_categoria()
	{
		return $this->belongsTo(\App\CampeonatoCategoria::class, 'campeonato_categorias_id');
	}

	public function representante()
	{
		return $this->belongsTo(\App\Representante::class, 'representantes_id');
	}

	public function campeonato_facturas()
	{
		return $this->hasMany(\App\CampeonatoFactura::class, 'campeonatos_id');
	}

	public function inscripciones_campeonatos()
	{
		return $this->hasMany(\App\InscripcionesCampeonato::class, 'campeonato_duplas_id');
	}
}
