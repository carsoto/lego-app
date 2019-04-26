<?php



/*

|--------------------------------------------------------------------------

| Web Routes

|--------------------------------------------------------------------------

|

| Here is where you can register web routes for your application. These

| routes are loaded by the RouteServiceProvider within a group which

| contains the "web" middleware group. Now create something great!

|

*/



/*Route::get('/', function () {

    return view('welcome');

});*/


Route::get('/', 'HomeController@home')->name('home');

Route::get('/admin', function () {

    return view('adminlte::auth.login');

});

/*Route::get('/', function () {

    return view('adminlte::auth.login');

});*/

Route::get('validar/datos/{cedula}', 'AcademiaController@validardatos')->name('validar.datos.atletas');

//Route::resource('academia', 'AcademiaController');

Route::group(['prefix' => 'academia'], function () {

	Route::get('/', 'AcademiaController@index')->name('academia.index');

	Route::get('inscripcion/prueba', 'AcademiaController@inscripcionprueba')->name('academia.inscripcion_prueba');

	Route::get('inscripcion', 'AcademiaController@inscripcionacademia')->name('academia.inscripcion');

	Route::post('inscripcion', 'AcademiaController@store')->name('academia.store');

	Route::post('miembro', 'AcademiaController@update')->name('academia.update');

	Route::get('asistencia', 'AcademiaController@asistencia')->name('academia.asistencia');

	Route::post('cargar/asistencia', 'AcademiaController@cargar_asistencia')->name('academia.cargar.asistencia');

	Route::post('guardar/asistencia', 'AcademiaController@guardar_asistencia')->name('academia.guardar.asistencia');

	Route::get('registrado/', 'AcademiaController@miembro')->name('academia.miembro');

	Route::get('validar/datos/{cedula}', 'AcademiaController@validardatos')->name('academia.validar.datos');

	Route::post('validar/inscripcion', 'AcademiaController@validar_inscripcion')->name('academia.validar.inscripcion');

	/*Route::get('datos/atletas/{atletas}', 'AcademiaController@datosatletas')->name('academia.cargar.datos');*/



	Route::post('inscripcion/prueba', 'AcademiaController@registrarprueba')->name('academia.inscripcion.prueba');

	//Route::post('inscripcion/academia', 'AcademiaController@registrarinscripcion')->name('academia.inscripcion');

});



Route::resource('servicios', 'ServiciosController');



Route::resource('atleta', 'AtletaController');



Route::resource('vacacional', 'VacacionalController');



Route::resource('campamento', 'CampamentoController');

Route::group(['prefix' => 'campamento'], function () {

	Route::get('registro/{campamento_id}', 'CampamentoController@registro')->name('campamento.registro');

});

Route::resource('workshop', 'WorkshopController');

Route::resource('campeonato', 'CampeonatoController');



Route::resource('alquiler', 'AlquilerController');

Route::group(['prefix' => 'alquiler'], function () {

	Route::get('reserva/buscar-disponibilidad', 'AlquilerController@buscardisponibilidad')->name('alquiler.disponibilidad');

});



Route::group(['prefix' => 'registro'], function () {

	Route::get('/', 'RegistroController@index')->name('registro.index');

	Route::post('/', 'RegistroController@store')->name('registro.store');

	Route::get('{tipo}', 'RegistroController@registroatleta')->name('registro.atleta');

});



Route::group(['middleware' => 'auth'], function () {



    Route::resource('usuarios', 'UserController');

	

	Route::group(['prefix' => 'admin'], function () {

		Route::group(['prefix' => 'usuarios'], function () {

			Route::get('eliminar/{usuario}', 'UserController@destroy')->name('usuarios.borrar');

			Route::get('table/listado', 'UserController@list')->name('usuarios.listado');

		});



		Route::get('academia/resumen-prueba', 'AcademiaController@dashboardprueba')->name('academia.prueba.dashboard');

		Route::get('academia/resumen', 'AcademiaController@dashboard')->name('academia.dashboard');



		Route::get('vacacional/resumen', 'VacacionalController@dashboard')->name('vacacional.dashboard');

		Route::get('vacacional/registrar/pago/{id}', 'VacacionalController@registrarpago')->name('vacacional.registrar.pago');

		Route::get('vacacional/deshabilitar/inscripcion/{id}', 'VacacionalController@deshabilitar_inscripcion')->name('vacacional.deshabilitar.inscripcion');


		Route::get('alquiler/resumen', 'AlquilerController@dashboard')->name('alquiler.dashboard');

		Route::get('alquiler/registrar/pago/{id}', 'AlquilerController@registrarpago')->name('alquiler.registrar.pago');

		Route::get('alquiler/detalles/jugadores/{id}', 'AlquilerController@detallesalquiler')->name('alquiler.detalles');

		

		Route::get('campamento/resumen', 'CampamentoController@dashboard')->name('campamento.dashboard');

		Route::get('campamento/registrar/pago/{id}', 'CampamentoController@registrarpago')->name('campamento.registrar.pago');

		Route::get('campamento/deshabilitar/inscripcion/{id}', 'CampamentoController@deshabilitar_inscripcion')->name('campamento.deshabilitar.inscripcion');


		Route::get('workshop/resumen', 'WorkshopController@dashboard')->name('workshop.dashboard');

		Route::get('workshop/deshabilitar/inscripcion/{id}', 'WorkshopController@deshabilitar_inscripcion')->name('workshop.deshabilitar.inscripcion');

		Route::get('workshop/registrar/pago', 'WorkshopController@registrarpago')->name('workshop.deshabilitar.registrar.pago');
		
		

	});

});