<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historial extends Model
{
	protected $table='historial';
    public function variable(){
    	  return $this->belongsTo('App\Variable');
    }
}
