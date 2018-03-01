<?php

use Faker\Generator as Faker;
$factory->define(App\Variable::class, function (Faker $faker) {
    return [
           'nombre' => $faker->name,
	        'grupo' => $faker->name,
	        'diminutivo' => str_random(4),
    ];
});
