<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Medida extends Model
{

    public function variable(){
    	  return $this->belongsTo('App\Variable');
    }
}

