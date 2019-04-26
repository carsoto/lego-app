<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Locacion;
use App\InformacionAdicional;
use App\Representante;
use App\Atleta;
use App\Workshop;
use App\WorkshopFecha;
use App\WorkshopHorario;
use App\WorkshopFactura;
use App\InscripcionesWorkshop;
use Funciones;
use Carbon\Carbon;
use Response;

class WorkshopController extends Controller
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
        return view('adminlte::workshop.index', array('locaciones' => $locaciones, 'preguntas' => $preguntas, 'tallas' => $tallas, 'datos_tarifas' => $datos_tarifas, 'servicio' => 'Workshop'));
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
        try {

            $cantidad_alumnos = count($request->form_atleta);

            $atletas_registrados = array();

            $locaciones = Locacion::where('activo', '=', 1)->get();
            
            $count = 0;

            foreach($locaciones AS $key => $locacion){

                if(count($locacion->workshop()->where('activo', '=', 1)->get()) > 0){

                    foreach($locacion->workshop()->where('activo', '=', 1)->get() AS $key => $workshop){
                        $h["fecha_limite"] = $workshop->fecha_limite;
                        $h["porcentaje_individual"] = $workshop->porcentaje_individual;
                        $h["id"] = $workshop->id;
                        foreach($workshop->workshop_horarios()->where('activo', '=', 1)->get() AS $key => $horario){
                            $h["horario_id"] = $horario->id;
                            $tarifa = number_format($horario->tarifa_ins, 2, '.', '');
                            $h["tarifa"] = $tarifa;
                        }
                    }
                }
            }

            if($request->representante["id"] == null){
                if($request->representante["cedula"] != null){
                    $representante = Representante::firstOrCreate(['cedula' => $request->representante["cedula"]], [ 

                        'cedula' => $request->representante["cedula"],

                        'nombres' => $request->representante["nombres"],

                        'apellidos' => $request->representante["apellidos"],

                        'telf_contacto' => $request->representante["telf_contacto"],

                        'email' => $request->representante["email"],

                        'red_social' => $request->representante["red_social"],

                    ]);    
                }
            }else{
                $representante = Representante::updateOrCreate(['cedula' => $request->representante["cedula"]], [ 

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

                    $ins_workshop = InscripcionesWorkshop::firstOrCreate(['atletas_id' => $atleta_reg->id, 'workshop_horarios_id' => $h['horario_id']], [
                        'atletas_id' => $atleta_reg->id,
                        'workshop_horarios_id' => $h['horario_id'],
                        'tarifa' => $h['tarifa'],
                        'descuento' => $request->factura["dcto_individual"],
                        'pago' => $request->factura["valor_individual"],
                        'estatus_pago' => 'Pendiente',
                        'fecha_inscripcion' => date('Y-m-d'),
                        'activo' => 1,
                    ]);
                }
            }

            if($request->factura["ids"] != null){
                $ids_reg = explode(',', $request->factura["ids"]);
                foreach ($ids_reg as $key => $value) {
                    $ins_workshop = InscripcionesWorkshop::firstOrCreate(['atletas_id' => $value, 'workshop_horarios_id' => $h['horario_id']], [
                        'atletas_id' => $value,
                        'workshop_horarios_id' => $h['horario_id'],
                        'tarifa' => $h['tarifa'],
                        'descuento' => $request->factura["dcto_individual"],
                        'pago' => $request->factura["valor_individual"],
                        'estatus_pago' => 'Pendiente',
                        'fecha_inscripcion' => date('Y-m-d'),
                        'activo' => 1,
                    ]);
                }
            }

            WorkshopFactura::firstOrCreate([
                'workshop_id' => $h['id'],
                'representantes_id' => $representante->id,
                'fecha' => date('Y-m-d'),
                'subtotal' => $request->factura["subtotal"],
                'descuento' => $request->factura["descuento"],
                'total' => $request->factura["total"],
                'status' => 'Pendiente',
                'tipo_pago' => 'Efectivo',
            ]);

            $msg = 'Proceso finalizado con éxito, te esperamos en la academia.';

            $status = true;
            

        } catch (Exception $e) {

            $msg = $e;

            $status = false;

        }

        return view('adminlte::workshop.inscripcion_finalizada', array('message' => $msg, 'status' => $status));
    }

    public function dashboard(){

        $inscritos = Funciones::inscritos_workshop();

        return view('adminlte::workshop.dashboard', array('inscritos' => $inscritos));

    }

    public function deshabilitar_inscripcion($id){

        $workshop = InscripcionesWorkshop::where('id', $id)->first();

        $workshop->activo = 0;

        if($workshop->save()){

            $status = 'success';

            $msg = 'Alumno inhabilitado exitosamente!';

        } else {

            $status = 'failed';

            $msg = 'Disculpe, ocurrió un error y no pudo ser inhabilitado!';

        }    

        return Response::json(array('status' => $status, 'msg' => $msg));

    }

    public function registrarpago(Request $request){

        $workshop = InscripcionesWorkshop::where('id', $request->id)->first();

        $workshop->pago = $request->monto;

        $workshop->estatus_pago = 'Pagado';

        if($workshop->save()){

            $status = 'success';

            $msg = 'Pago registrado exitosamente!';

        } else {

            $status = 'failed';

            $msg = 'Disculpe, ocurrió un error y no pudo ser cancelado!';

        }    

        return Response::json(array('status' => $status, 'msg' => $msg));
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
