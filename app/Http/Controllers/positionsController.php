<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Position;
class positionsController extends Controller
{
     public function index()
    {
    	$pos=Position::orderby('posicion','asc')->get();
    	return response()->json($pos);
    }
    public function update(Request $request,$id){
    	$pos=Position::find($id);
    	$pos->variable_id=$request->id;

    	$pos->save();
    	return response()->json($pos);
    }
}
