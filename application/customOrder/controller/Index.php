<?php
namespace app\customOrder\controller;
use app\customOrder\model\CustomOrder as Order;
use think\Db;
use think\Controller;

class Index extends controller
{
    public function index()
    {
    $order=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $order);
    return $this->fetch();
   
    }
    public function test(){
        echo json_decode("7777");
    }
}
