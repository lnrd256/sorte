<?php

use Faker\Generator as Faker;

$factory->define(App\Historial::class, function (Faker $faker) {
    return [
    	'variable_id'=>'13',
        'fecha' => $faker->dateTime,
        'valor' => $faker->randomNumber(2),
    ];
});
