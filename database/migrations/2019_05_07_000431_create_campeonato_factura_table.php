<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampeonatoFacturaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campeonato_factura', function (Blueprint $table) {
            $table->engine = 'InnoDB';
        
            $table->increments('id')->unsigned();
            $table->integer('campeonatos_id')->unsigned();
            $table->integer('representantes_id')->unsigned();
            $table->date('fecha');
            $table->decimal('subtotal', 9, 2);
            $table->decimal('descuento', 9, 2);
            $table->decimal('total', 9, 2);
            $table->string('status', 45);
            $table->string('tipo_pago', 100);
        
            $table->index('representantes_id','fk_campeonato_factura_representantes1_idx');
            $table->index('campeonatos_id','fk_campeonato_factura_campeonatos1_idx');
        
            $table->foreign('representantes_id')
                ->references('id')->on('representantes');
        
            $table->foreign('campeonatos_id')
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
        Schema::dropIfExists('campeonato_factura');
    }
}
