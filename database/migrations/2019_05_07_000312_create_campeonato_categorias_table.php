<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampeonatoCategoriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campeonato_categorias', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('campeonato_horarios_id')->unsigned();
            $table->integer('edad_minima');
            $table->string('anyo_inicio');
            $table->string('anyo_fin');
        
            $table->index('campeonato_horarios_id','fk_campeonato_fechas_campeonato_horarios1_idx');
        
            $table->foreign('campeonato_horarios_id')
                ->references('id')->on('campeonato_horarios');
        
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
        Schema::dropIfExists('campeonato_categorias');
    }
}
