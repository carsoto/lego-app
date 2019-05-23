<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 16 May 2019 17:48:24 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class CampeonatoFactura
 * 
 * @property int $id
 * @property int $campeonatos_id
 * @property int $representantes_id
 * @property int $campeonato_duplas_id
 * @property \Carbon\Carbon $fecha
 * @property float $subtotal
 * @property float $descuento
 * @property float $total
 * @property string $status
 * @property string $tipo_pago
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
 * @property \App\CampeonatoDupla $campeonato_dupla
 * @property \App\Campeonato $campeonato
 * @property \App\Representante $representante
 *
 * @package App
 */
class CampeonatoFactura extends Eloquent
{
	protected $table = 'campeonato_factura';

	protected $casts = [
		'campeonatos_id' => 'int',
		'representantes_id' => 'int',
		'campeonato_duplas_id' => 'int',
		'subtotal' => 'float',
		'descuento' => 'float',
		'total' => 'float',
		'activo' => 'int'
	];

	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'campeonatos_id',
		'representantes_id',
		'campeonato_duplas_id',
		'fecha',
		'subtotal',
		'descuento',
		'total',
		'status',
		'tipo_pago',
		'activo'
	];

	public function campeonato_dupla()
	{
		return $this->belongsTo(\App\CampeonatoDupla::class, 'campeonatos_id');
	}

	public function campeonato()
	{
		return $this->belongsTo(\App\Campeonato::class, 'campeonatos_id');
	}

	public function representante()
	{
		return $this->belongsTo(\App\Representante::class, 'representantes_id');
	}
}
