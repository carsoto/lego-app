<?php

use Illuminate\Database\Seeder;

class WorkshopFechasTableSeeder extends Seeder
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
            array('workshop_horarios_id' => 1, 'fecha_inicio' => '2019-06-03', 'fecha_fin' => NULL, 'created_at' => date('Y-m-d')),
            array('workshop_horarios_id' => 1, 'fecha_inicio' => '2019-06-04', 'fecha_fin' => NULL, 'created_at' => date('Y-m-d')),
            array('workshop_horarios_id' => 1, 'fecha_inicio' => '2019-06-05', 'fecha_fin' => NULL, 'created_at' => date('Y-m-d')),
        );

        foreach (array_chunk($array_records, 100) as $records) {
            \DB::table('workshop_fechas')->insert($records);
        }
    }
}
