<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Variable extends Model
{

     public function medida(){
    	 return $this->hasMany('App\Medida');
    }
}
