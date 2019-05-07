<?php

/**
 * Created by Reliese Model.
 * Date: Tue, 07 May 2019 01:46:54 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class CampeonatoFactura
 * 
 * @property int $id
 * @property int $campeonatos_id
 * @property int $representantes_id
 * @property \Carbon\Carbon $fecha
 * @property float $subtotal
 * @property float $descuento
 * @property float $total
 * @property string $status
 * @property string $tipo_pago
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * 
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
		'subtotal' => 'float',
		'descuento' => 'float',
		'total' => 'float'
	];

	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'campeonatos_id',
		'representantes_id',
		'fecha',
		'subtotal',
		'descuento',
		'total',
		'status',
		'tipo_pago'
	];

	public function campeonato()
	{
		return $this->belongsTo(\App\Campeonato::class, 'campeonatos_id');
	}

	public function representante()
	{
		return $this->belongsTo(\App\Representante::class, 'representantes_id');
	}
}
