<?php
namespace app\staff\controller;
use think\Controller;
use think\Db;

class staff extends Controller
{

    public function staff($department_id=null)
    {
        $list=Db::table('buemployee')
        ->alias('a')
        ->join('burole b','a.role_id = b.role_id')
        ->where('department_id', "$department_id")
        ->paginate(5);
        return view('staff',['list'=>$list]);
    }
}
