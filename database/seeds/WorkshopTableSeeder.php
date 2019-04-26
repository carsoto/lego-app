<?php

use Illuminate\Database\Seeder;

class WorkshopTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        set_time_limit(0);

        $array_records = array (
            array('locaciones_id' => 2, 'descripcion' => 'Workshop internacional de beach volley', 'edad_inicio' => 9, 'edad_fin' => 14, 'h_inicio' => '15:30', 'h_fin' => '19:30', 'porcentaje_individual' => 5, 'porcentaje_grupal' => NULL, 'fecha_limite' => '2019-05-27', 'activo' => 1, 'created_at' => date('Y-m-d')),
        );

        foreach (array_chunk($array_records, 100) as $records) {
			\DB::table('workshop')->insert($records);
        }
    }
}
