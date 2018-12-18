<?php
namespace app\customOrder\controller;
use think\Db;

use think\Controller;
use app\customOrder\model\CustomOrder as Order;
class UpdateOrder extends controller
{

    // $users = User::where('name', 'like', '%think')
    // ->where('id', 'between', [1, 5])
    // ->order('id desc')
    // ->limit(5)
    // ->select();
    public function form($id)
    {
        $info=Order::where('order_num','=',$id)
        ->find();
    $this->assign('info', $info);
   
    return $this->fetch();
    }
    public function update()
    {
    echo "ok";
    }
    public function delete()
    {
    $cusTomOrder=CusTomOrder::paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $cusTomOrder);
    return $this->fetch();
   
    }

}
