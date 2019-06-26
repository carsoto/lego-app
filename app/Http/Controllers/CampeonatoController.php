<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Locacion;

use App\InformacionAdicional;

use App\Representante;

use App\Atleta;

use App\InscripcionesCampeonato;

use App\CampeonatoFactura;

use App\CampeonatoDupla;

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

            if(count($locacion->campeonatos()->where('activo', '=', 1)->get()) > 0){

                foreach($locacion->campeonatos()->where('activo', '=', 1)->get() AS $key => $campeonato){

                    foreach($campeonato->campeonato_horarios()->where('activo', '=', 1)->get() AS $key => $horario){

                        $datos_tarifas['campeonato'][$locacion->id][$campeonato->id][$horario->id] = number_format($horario->tarifa_ins, 2, '.', '');
                        $tarifa = number_format($horario->tarifa_ins, 2, '.', '');

                        $datos_tarifas['categorias'] = $horario->campeonato_categorias;
                    }

                }

                $datos_tarifas['tarifa'] = $tarifa;

                $datos_tarifas['edad_inicio'] = $campeonato->edad_inicio;

                $datos_tarifas['edad_fin'] = $campeonato->edad_fin;

                $datos_tarifas['porc_individual'] = $campeonato->porcentaje_individual;

                $datos_tarifas['porc_grupal'] = $campeonato->porcentaje_grupal;

                $datos_tarifas['fecha_limite'] = Carbon::parse($campeonato->fecha_limite)->format('Y-m-d');
            }
        }

        //dd($datos_tarifas);
        return view('adminlte::campeonato.index', array('locaciones' => $locaciones, 'preguntas' => $preguntas, 'tallas' => $tallas, 'datos_tarifas' => $datos_tarifas, 'servicio' => 'Campeonato'));
    }

    public function dashboard(){

        $inscritos = Funciones::inscritos_campeonato();

        return view('adminlte::campeonato.dashboard', array('inscritos' => $inscritos));

    }

    public function deshabilitar_inscripcion($id){
        dd(decrypt($id));
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
        //dd($request);
        try {
            $cantidad_alumnos = count($request->form_atleta);
            $atletas_registrados = array();
            $locaciones = Locacion::where('activo', '=', 1)->get();
            $count = 0;
            $atletas_regs = array();

            foreach($locaciones AS $key => $locacion){
                if(count($locacion->campeonatos()->where('activo', '=', 1)->get()) > 0){
                    foreach($locacion->campeonatos()->where('activo', '=', 1)->get() AS $key => $campeonato){
                        $h["fecha_limite"] = $campeonato->fecha_limite;
                        $h["porcentaje_individual"] = $campeonato->porcentaje_individual;
                        $h["id"] = $campeonato->id;

                        foreach($campeonato->campeonato_horarios()->where('activo', '=', 1)->get() AS $key => $horario){
                            $h["horario_id"] = $horario->id;
                            $tarifa = number_format($horario->tarifa_ins, 2, '.', '');
                            $h["tarifa"] = $tarifa;
                        }
                    }
                }
            }

            if($request->representante["id"] == null){
                if($request->representante["cedula"] != null){
                    $representante = Representante::firstOrCreate(['cedula' => $request->cedula], [ 
                        'cedula' => $request->representante["cedula"],
                        'nombres' => $request->representante["nombres"],
                        'apellidos' => $request->representante["apellidos"],
                        'telf_contacto' => $request->representante["telf_contacto"],
                        'email' => $request->representante["email"],
                        'red_social' => $request->representante["red_social"],
                    ]);    
                }
            }else{
                $representante = Representante::updateOrCreate(['cedula' => $request->cedula], [ 
                    'cedula' => $request->representante["cedula"],
                    'nombres' => $request->representante["nombres"],
                    'apellidos' => $request->representante["apellidos"],
                    'telf_contacto' => $request->representante["telf_contacto"],
                    'email' => $request->representante["email"],
                    'red_social' => $request->representante["red_social"],
                ]);  
            }

            foreach($request->form_atleta AS $key => $atleta){
                if($atleta["id"] == null){
                    if($atleta["cedula"] != ""){
                        $atleta_reg = Atleta::firstOrCreate(['cedula' => $atleta["cedula"]], [ 
                            'cedula' => $atleta["cedula"],
                            'nombre' => $atleta["nombre"],
                            'apellido' => $atleta["apellido"],
                            'genero' => $atleta["genero"],
                            'fecha_nacimiento' => $atleta["fecha_nacimiento"],
                            'red_social' => $atleta["red_social"],
                            'instituto' => $atleta["instituto"],
                            'talla_top' => $atleta["talla_top"],
                            'talla_camiseta' => $atleta["talla_camiseta"]
                        ]);    

                    }else{

                        $atleta_reg = Atleta::create([ 
                            'cedula' => $atleta["cedula"],
                            'nombre' => $atleta["nombre"],
                            'apellido' => $atleta["apellido"],
                            'genero' => $atleta["genero"],
                            'fecha_nacimiento' => $atleta["fecha_nacimiento"],
                            'red_social' => $atleta["red_social"],
                            'instituto' => $atleta["instituto"],
                            'talla_top' => $atleta["talla_top"],
                            'talla_camiseta' => $atleta["talla_camiseta"]
                        ]);
                    }
                    
                    $representante->atletas()->sync($atleta_reg->id, false);
                    $count++;

                    $atletas_regs[$atleta["nombre"].' '.$atleta["apellido"]] = $atleta_reg->id;
                }
            }

            if($request->duplas["categoria"] > 0){
                for ($dd=0; $dd < count($request->duplas["categoria"]); $dd++) { 
                    
                    $dupla = new CampeonatoDupla();
                    $dupla->campeonato_categorias_id = $request->duplas["categoria"][$dd];
                    $dupla->representantes_id = $representante->id;
                    $dupla->atleta_id_jugador1 = ($request->duplas["id_jugador1"][$dd] != '') ? $request->duplas["id_jugador1"][$dd] : $atletas_regs[$request->duplas["jugador1"][$dd]];
                    $dupla->jugador_1 = $request->duplas["jugador1"][$dd];
                    $dupla->atleta_id_jugador2 = ($request->duplas["id_jugador2"][$dd] != '') ? $request->duplas["id_jugador2"][$dd] : $atletas_regs[$request->duplas["jugador2"][$dd]];
                    $dupla->jugador_2 = $request->duplas["jugador2"][$dd];
                    $dupla->save();

                    $ins_campeonato = InscripcionesCampeonato::create([
                        'campeonato_horarios_id' => $h['horario_id'],
                        'campeonato_duplas_id' => $dupla->id,
                        'tarifa' => $h['tarifa'],
                        'descuento' => $request->factura["dcto_individual"],
                        'pago' => $request->factura["valor_individual"],
                        'estatus_pago' => 'Pendiente',
                        'fecha_inscripcion' => date('Y-m-d'),
                        'activo' => 1,
                    ]);

                    CampeonatoFactura::firstOrCreate([
                        'campeonatos_id' => $h['id'],
                        'representantes_id' => $representante->id,
                        'campeonato_duplas_id' => $dupla->id,
                        'fecha' => date('Y-m-d'),
                        'subtotal' => $request->factura["subtotal"],
                        'descuento' => $request->factura["descuento"],
                        'total' => $request->factura["total"],
                        'status' => 'Pendiente',
                        'tipo_pago' => 'Efectivo',
                        'activo' => 1
                    ]);
                }
            }

            /*if($request->factura["ids"] != null){
                $ids_reg = explode(',', $request->factura["ids"]);
                foreach ($ids_reg as $key => $value) {
                    $ins_campeonato = InscripcionesCampeonato::firstOrCreate(['atletas_id' => $value, 'campeonato_horarios_id' => $h['horario_id']], [
                        'atletas_id' => $value,
                        'campeonato_horarios_id' => $h['horario_id'],
                        'tarifa' => $h['tarifa'],
                        'descuento' => $request->factura["dcto_individual"],
                        'pago' => $request->factura["valor_individual"],
                        'estatus_pago' => 'Pendiente',
                        'fecha_inscripcion' => date('Y-m-d'),
                        'activo' => 1,
                    ]);
                }
            }*/

            $msg = 'Proceso finalizado con éxito, te esperamos en la academia.';

            $status = true;
            

        } catch (Exception $e) {
            $msg = $e;
            $status = false;
        }

        return view('adminlte::campeonato.inscripcion_finalizada', array('message' => $msg, 'status' => $status));
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

