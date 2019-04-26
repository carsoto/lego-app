<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkshopHorariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workshop_horarios', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('workshop_id')->unsigned();
            $table->string('descripcion', 191);
            $table->decimal('tarifa_ins', 9, 2);
            $table->integer('activo')->default('1');

            $table->index('workshop_id','fk_workshop_horarios_workshop1_idx');

            $table->foreign('workshop_id')
                ->references('id')->on('workshop');

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
        Schema::dropIfExists('workshop_horarios');
    }
}
