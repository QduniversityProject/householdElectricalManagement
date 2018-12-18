<?php
namespace app\customOrder\controller;
use app\customOrder\model\CustomOrder as Order;

use think\Controller;

class Index extends controller
{
    public function index()
    {
    $order=Order::paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $order);
    return $this->fetch();
   
    }
    public function test(){
        echo json_decode("7777");
    }
}
