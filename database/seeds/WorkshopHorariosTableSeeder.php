<?php

use Illuminate\Database\Seeder;

class WorkshopHorariosTableSeeder extends Seeder
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
            array('workshop_id' => 1, 'descripcion' => 'Tarifa única', 'tarifa_ins' => 45, 'activo' => 1, 'created_at' => date('Y-m-d')),

        );

        foreach (array_chunk($array_records, 100) as $records) {
              \DB::table('workshop_horarios')->insert($records);
        }
    }
}
