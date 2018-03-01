<?php

use Illuminate\Database\Seeder;
use App\Variable;
class VariableTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Historial::class, 12)->create();
    }
}
