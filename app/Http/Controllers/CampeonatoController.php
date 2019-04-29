<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Locacion;

use App\InformacionAdicional;

use Funciones;

use Carbon\Carbon;

class CampeonatoController extends Controller

{

    /**

     * Display a listing of the resource.

     *

     * @return \Illuminate\Http\Response

     */

    public function index()
    {

        $locaciones = Locacion::where('activo', '=', 1)->get();

        $preguntas = InformacionAdicional::all();

        $tallas = Funciones::tallas();

        $datos_tarifas = array();

        $tarifa = 0;

        foreach($locaciones AS $key => $locacion){

            if(count($locacion->workshop()->where('activo', '=', 1)->get()) > 0){

                foreach($locacion->workshop()->where('activo', '=', 1)->get() AS $key => $workshop){

                    foreach($workshop->workshop_horarios()->where('activo', '=', 1)->get() AS $key => $horario){

                        $datos_tarifas['workshop'][$locacion->id][$workshop->id][$horario->id] = number_format($horario->tarifa_ins, 2, '.', '');
                        $tarifa = number_format($horario->tarifa_ins, 2, '.', '');

                    }

                }

                $datos_tarifas['tarifa'] = $tarifa;

                $datos_tarifas['edad_inicio'] = $workshop->edad_inicio;

                $datos_tarifas['edad_fin'] = $workshop->edad_fin;

                $datos_tarifas['porc_individual'] = $workshop->porcentaje_individual;

                $datos_tarifas['porc_grupal'] = $workshop->porcentaje_grupal;

                $datos_tarifas['fecha_limite'] = Carbon::parse($workshop->fecha_limite)->format('Y-m-d');

            }
        }
        //dd($datos_tarifas);
        return view('adminlte::campeonato.index', array('locaciones' => $locaciones, 'preguntas' => $preguntas, 'tallas' => $tallas, 'datos_tarifas' => $datos_tarifas, 'servicio' => 'Campeonato'));

        //return view('adminlte::campeonato.index', array('locaciones' => $locaciones, 'datos_tarifas' => $datos_tarifas));

        //return view('adminlte::campeonato.index');
    }



    /**

     * Show the form for creating a new resource.

     *

     * @return \Illuminate\Http\Response

     */

    public function create()

    {

        //

    }



    /**

     * Store a newly created resource in storage.

     *

     * @param  \Illuminate\Http\Request  $request

     * @return \Illuminate\Http\Response

     */

    public function store(Request $request)

    {

        //

    }



    /**

     * Display the specified resource.

     *

     * @param  int  $id

     * @return \Illuminate\Http\Response

     */

    public function show($id)

    {

        //

    }



    /**

     * Show the form for editing the specified resource.

     *

     * @param  int  $id

     * @return \Illuminate\Http\Response

     */

    public function edit($id)

    {

        //

    }



    /**

     * Update the specified resource in storage.

     *

     * @param  \Illuminate\Http\Request  $request

     * @param  int  $id

     * @return \Illuminate\Http\Response

     */

    public function update(Request $request, $id)

    {

        //

    }



    /**

     * Remove the specified resource from storage.

     *

     * @param  int  $id

     * @return \Illuminate\Http\Response

     */

    public function destroy($id)

    {

        //

    }

}

