<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Variable;
use App\Historial;
use Carbon\Carbon;
class historialController extends Controller
{
    public function show($id)
    {
    	$var=Variable::find($id);

    	if(isset($var)){
    		return response()->json($var->historial()->where("fecha", '>=', Carbon::yesterday())->orderBy('fecha','asc')->get());
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
		    		foreach($var->historial()->where("fecha", '>=', Carbon::yesterday())->orderBy('fecha','asc')->get() as $key=>$position){
		    			array_push($response,$position);
		    		}
		    	}
	    	}
	    }else{
	    	$response=Historial::orderBy('fecha','asc')->get();
	    }
	    return response()->json($response);
    }

    public function medicion(Request $request){
    	$response=[];

    	if(isset($request->ids)){
	    	foreach($request->ids as $clave=>$pos){
	    		$var=Variable::find($pos);
	    		if(isset($var)){
	    			if(count($var->historial()->get())>0){
			    		foreach($var->historial()->orderBy('fecha','desc')->limit(1)->get() as $key=>$position){
			    			array_push($response,$position);
			    		}
			    	}
			    	else{
			    		$void_response = array(
			    		'id'=>'',
			    		'variable_id'=>$pos,
			    		'fecha'=>'0000-00-00 00:00:00',
			    		'valor'=>'-');
			    		array_push($response,$void_response);
			    	}
		    	}
	    	}
	    }
	    return response()->json($response);

    }
}
