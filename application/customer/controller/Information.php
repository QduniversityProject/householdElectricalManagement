<?php
namespace app\customer\controller;
use think\Controller;
use think\Db;

class Information extends Controller
{

    public function information()
    {
    $order=Db::table('customer')
    ->paginate(5);
    $this->assign('information', $order);
    return $this->fetch();
    }

}
