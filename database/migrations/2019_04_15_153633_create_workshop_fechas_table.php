<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkshopFechasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workshop_fechas', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('workshop_horarios_id')->unsigned();
            $table->date('fecha_inicio');
            $table->date('fecha_fin');
        
            $table->index('workshop_horarios_id','fk_workshop_fechas_workshop_horarios1_idx');
        
            $table->foreign('workshop_horarios_id')
                ->references('id')->on('workshop_horarios');
        
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
        Schema::dropIfExists('workshop_fechas');
    }
}
