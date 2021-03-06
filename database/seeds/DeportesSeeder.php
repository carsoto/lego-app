<?php

use Illuminate\Database\Seeder;

class DeportesSeeder extends Seeder
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
        	array('descripcion' => 'Beach Volley', 'activo' => 1, 'created_at' => date('Y-m-d')),
        	array('descripcion' => 'Beach Tennis', 'activo' => 0, 'created_at' => date('Y-m-d')),
        );

        foreach (array_chunk($array_records, 100) as $records) {
              \DB::table('deportes')->insert($records);
        }
    }
}
