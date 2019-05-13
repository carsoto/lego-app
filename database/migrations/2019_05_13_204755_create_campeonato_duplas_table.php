<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampeonatoDuplasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campeonato_duplas', function(Blueprint $table) {
            $table->engine = 'InnoDB';
        
            $table->increments('id')->unsigned();
            $table->integer('campeonato_categorias_id')->unsigned();
            $table->integer('representantes_id')->unsigned();
            $table->integer('atleta_id_jugador1')->nullable();
            $table->string('jugador_1', 100)->nullable();
            $table->integer('atleta_id_jugador2')->nullable();
            $table->string('jugador_2', 100)->nullable();
        
            $table->index('campeonato_categorias_id','fk_campeonato_duplas_campeonato_categorias1_idx');
            $table->index('representantes_id','fk_campeonato_duplas_representantes1_idx');
        
            $table->foreign('campeonato_categorias_id')
                ->references('id')->on('campeonato_categorias');
        
            $table->foreign('representantes_id')
                ->references('id')->on('representantes');
        
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
        Schema::dropIfExists('campeonato_duplas');
    }
}
