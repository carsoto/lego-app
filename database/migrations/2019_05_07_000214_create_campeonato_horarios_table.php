modified:   app/AcademiaAsistencia.php
        modified:   app/AcademiaAsistenciaPrueba.php
        modified:   app/AcademiaConfiguracion.php
        modified:   app/AcademiaDetallesFactura.php
        modified:   app/AcademiaFactura.php
        modified:   app/AcademiaFacturaAbono.php
        modified:   app/AcademiaHorario.php
        modified:   app/AcademiaHorariosDisponible.php
        modified:   app/AcademiaMatricula.php
        modified:   app/AcademiaTarifa.php
        modified:   app/AcademiaUniforme.php
        modified:   app/Alquiler.php
        modified:   app/AlquilerInvitado.php
        modified:   app/Atleta.php
        modified:   app/AtletasInformacionAdicional.php
        modified:   app/AtletasUniforme.php
        modified:   app/Campamento.php
        modified:   app/CampamentosFecha.php
        modified:   app/CampamentosHorario.php
        modified:   app/Deporte.php
        modified:   app/Horario.php
        modified:   app/Http/Controllers/CampeonatoController.php
        modified:   app/InformacionAdicional.php
        modified:   app/InscripcionesCampamento.php
        modified:   app/InscripcionesVacacional.php
        modified:   app/InscripcionesWorkshop.php
        modified:   app/Invitado.php
        modified:   app/Periodo.php
        modified:   app/Representante.php
        modified:   app/RepresentantesAtleta.php
        modified:   app/ReservaConfiguracion.php
        modified:   app/Servicio.php
        modified:   app/Talla.php
        modified:   app/Tarifa.php
        modified:   app/Uniforme.php
        modified:   app/Vacacional.php
        modified:   app/VacacionalHorario.php
        modified:   app/Workshop.php
        modified:   app/WorkshopFactura.php
        modified:   app/WorkshopFecha.php
        modified:   app/WorkshopHorario.php
        modified:   database/seeds/DatabaseSeeder.php
        modified:   database/seeds/WorkshopTableSeeder.php
<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampeonatoHorariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campeonato_horarios', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('campeonato_id')->unsigned();
            $table->string('descripcion', 191);
            $table->decimal('tarifa_ins', 9, 2);
            $table->integer('activo')->default('1');

            $table->index('campeonato_id','fk_campeonatos_horarios_campeonatos1_idx');

            $table->foreign('campeonato_id')
                ->references('id')->on('campeonatos');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('campeonato_horarios');
    }
}
