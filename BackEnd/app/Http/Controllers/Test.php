<?php

namespace App\Http\Controllers;

use App\Model\Student;
use App\Model\Teacher;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class Test extends Controller
{
    public function getIndex(Request $request)
    {
        $this->success['data'] =session()->all();
        return response()->json($this->success);

    }

    public function getSet(Request $request)
    {
        var_dump(request()->segment(1));
        $this->success['data'] =session()->all();
        return response()->json($this->success);
    }
    public  function postIndex(){
        session()->put("testindex","tttttt");
        $this->success['data'] =session()->all();
        $this->success['sid'] =session()->getid();
        return response()->json($this->success);
    }
    public  function getInfo(){

        return response()->json(Teacher::find(1)->account);
    }

}
