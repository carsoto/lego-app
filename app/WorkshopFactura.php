<?php

/**
 * Created by Reliese Model.
 * Date: Thu, 25 Apr 2019 17:25:11 +0000.
 */

namespace App;

use Reliese\Database\Eloquent\Model as Eloquent;

/**
 * Class WorkshopFactura
 * 
 * @property int $id
 * @property int $workshop_id
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
 * @property \App\Representante $representante
 * @property \App\Workshop $workshop
 *
 * @package App
 */
class WorkshopFactura extends Eloquent
{
	protected $table = 'workshop_factura';

	protected $casts = [
		'workshop_id' => 'int',
		'representantes_id' => 'int',
		'subtotal' => 'float',
		'descuento' => 'float',
		'total' => 'float'
	];

	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'workshop_id',
		'representantes_id',
		'fecha',
		'subtotal',
		'descuento',
		'total',
		'status',
		'tipo_pago'
	];

	public function representante()
	{
		return $this->belongsTo(\App\Representante::class, 'representantes_id');
	}

	public function workshop()
	{
		return $this->belongsTo(\App\Workshop::class);
	}
}
