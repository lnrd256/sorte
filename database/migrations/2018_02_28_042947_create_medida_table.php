<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMedidaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('medidas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('taladro_id')->unsigned();
            $table->integer('variable_id')->unsigned();
            $table->dateTime('fecha_medida');
            $table->integer('profundidad');
            $table->integer('valor');
            $table->timestamps();
            $table->foreign('variable_id')
                    ->references('id')->on('variables')
                    ->onDelete('cascade');
            $table->foreign('taladro_id')
                    ->references('id')->on('taladros')
                    ->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('medidas');
    }
}
