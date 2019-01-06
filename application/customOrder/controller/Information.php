<?php
namespace app\customOrder\controller;
use think\Controller;
use think\Db;

class Information extends Controller
{

    public function information()
    {
    $order=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->paginate(5);
    $this->assign('information', $order);
    return $this->fetch();
    }

}
