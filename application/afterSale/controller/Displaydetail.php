<?php
namespace app\afterSale\controller;
use think\Db;

use think\Controller;

class Displaydetail extends Controller{
    public function showOrder($order_num=null){
        $info = Db::table('custom_order')
        ->alias('a')
        ->join('customer b', 'a.custom_num=b.customer_id')
        ->where('a.order_num',$order_num)
        ->find();
        //dump($info);
        //exit;
        $this->assign('info', $info);
        return $this->fetch('Displaydetail/customOrder');
    }
}

?>