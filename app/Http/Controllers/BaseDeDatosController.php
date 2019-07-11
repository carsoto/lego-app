<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Representante;

class BaseDeDatosController extends Controller
{
	public function informacion_detallada(){
		$representantes = Representante::all();
		return view('adminlte::base-de-datos.dashboard', ['representantes' => $representantes]);
	}

	public function informacion_representante($idrepresentante){
        $representante = Representante::findOrFail(decrypt($idrepresentante));
        return view('adminlte::base-de-datos.representante',['representante' => $representante]);
    }
}
