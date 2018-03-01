<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Medida;
use App\Variable;
use Carbon\Carbon;
class medidasController extends Controller
{
        public function show($id)
    {
    	$var=Variable::find($id);

    	if(isset($var)){
    		return response()->json($var->medida()->where("fecha_medida", '>=', Carbon::yesterday())->orderBy('fecha_medida','asc')->get());
    	}else
    		return response()->json([]);

    }
    public function index(Request $request){
    	$response=[];

    	if(isset($request->limit)){
    		$limit=$request->limit;
    	}
    	if(isset($request->ids)){
	    	foreach($request->ids as $clave=>$pos){
	    		$var=Variable::find($pos);
	    		if(isset($var)){
		    		foreach($var->medida()->where("fecha_medida", '>=', Carbon::yesterday())->orderBy('fecha_medida','asc')->get() as $key=>$position){
		    			array_push($response,$position);
		    		}
		    	}
	    	}
	    }else{
	    	$response=Medida::orderBy('fecha_medida','asc')->get();
	    }
	    return response()->json($response);
    }

    public function medicion(Request $request){
    	$response=[];

    	if(isset($request->ids)){
	    	foreach($request->ids as $clave=>$pos){
	    		$var=Variable::find($pos);
	    		if(isset($var)){
	    			if(count($var->medida()->get())>0){
			    		foreach($var->medida()->orderBy('fecha_medida','desc')->limit(1)->get() as $key=>$position){
			    			array_push($response,$position);
			    		}
			    	}
			    	else{
			    		$void_response = array(
			    		'id'=>'',
			    		'variable_id'=>$pos,
			    		'fecha_medida'=>'0000-00-00 00:00:00',
			    		'valor'=>'-');
			    		array_push($response,$void_response);
			    	}
		    	}
	    	}
	    }
	    return response()->json($response);

    }
}
