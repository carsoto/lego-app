<?php

/*

 * Taken from

 * https://github.com/laravel/framework/blob/5.3/src/Illuminate/Auth/Console/stubs/make/controllers/HomeController.stub

 */

namespace App\Http\Controllers;



use App\Http\Requests;

use Illuminate\Http\Request;
use App\Locacion;


/**

 * Class HomeController

 * @package App\Http\Controllers

 */

class HomeController extends Controller

{

    /**

     * Create a new controller instance.

     *

     * @return void

     */

    /*public function __construct()

    {

        $this->middleware('auth');

    }*/



    /**

     * Show the application dashboard.

     *

     * @return Response

     */

    /*public function index()

    {

        return view('adminlte::home');

    }*/


    public function home(){
        $locaciones = Locacion::where('activo', '=', 1)->get();

        foreach($locaciones AS $key => $locacion){
            if($locacion->campamentos()->where('activo', '=', 1)->count() == 0){
                $campamentos = 0;
            }else{
                $campamentos = 1;
            }
        }
        return view('welcome', array('campamentos' => $campamentos));
    }

    public function index(Request $request)

    {

        $request->user()->authorizeRoles(['admin', 'profesor']);

        return view('adminlte::home');

    }



    /*

    public function someAdminStuff(Request $request)

    {

        $request->user()->authorizeRoles(‘admin’);

        return view(‘some.view’);

    }

    */

}