<?php

use Illuminate\Database\Seeder;

class CampeonatoCategoriasTableSeeder extends Seeder
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
            array('campeonato_horarios_id' => 1, 'anyo_inicio' => '2005', 'anyo_fin' => '2006', 'created_at' => date('Y-m-d')),
            array('campeonato_horarios_id' => 1, 'anyo_inicio' => '2007', 'anyo_fin' => '2008', 'created_at' => date('Y-m-d')),
            array('campeonato_horarios_id' => 1, 'anyo_inicio' => '2009', 'anyo_fin' => '2010', 'created_at' => date('Y-m-d')),
        );

        foreach (array_chunk($array_records, 100) as $records) {
            \DB::table('campeonato_categorias')->insert($records);
        }
    }
}
