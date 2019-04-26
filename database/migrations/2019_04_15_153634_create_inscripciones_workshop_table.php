<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInscripcionesWorkshopTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscripciones_workshop', function (Blueprint $table) {
            $table->engine = 'InnoDB';
        
            $table->increments('id')->unsigned();
            $table->integer('atletas_id')->unsigned();
            $table->integer('workshop_horarios_id')->unsigned();
            $table->decimal('tarifa', 9, 2);
            $table->decimal('descuento', 9, 2)->nullable();
            $table->decimal('pago', 9, 2);
            $table->string('estatus_pago')->default('Pendiente');
            $table->date('fecha_inscripcion');
            $table->integer('activo')->default(1);
        
            $table->index('atletas_id','fk_workshop_horarios_has_atletas_atletas1_idx');
            $table->index('workshop_horarios_id','fk_workshop_horarios_has_atletas_workshop_horarios1_idx');
        
            $table->foreign('workshop_horarios_id')
                ->references('id')->on('workshop_horarios');
        
            $table->foreign('atletas_id')
                ->references('id')->on('atletas');
        
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
        Schema::dropIfExists('inscripciones_workshop');
    }
}
