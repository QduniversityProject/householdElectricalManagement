<?php
namespace app\staff\controller;
use think\Controller;
use think\Db;

class staff extends Controller
{

    public function staff()
    {
        $list=Db::table('buemployee')
        ->alias('a')
        ->join('burole b','a.role_id = b.role_id')
        ->paginate(5);
        return view('staff',['list'=>$list]);
    }
}
