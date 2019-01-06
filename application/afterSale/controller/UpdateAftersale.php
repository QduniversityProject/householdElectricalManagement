<?php

namespace app\afterSale\controller;
use app\afterSale\model\AfterSaleModel;
use think\Db;

use think\Controller;

class UpdateAftersale extends controller
{
    public function form($id){
        $info=AfterSaleModel::where('aftersale_roll','=',$id)->find();
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('UpdateAfterSale/form');
    }

    public function update(){
        $order=AfterSaleModel::where('aftersale_roll',$_GET['aftersale_roll'])->find();
        $order->employee_id=$_GET['employee_id'];
        $order->question=$_GET['question'];
        $order->question_type=$_GET['question_type'];
        $order->save();
        echo($order);
        echo "ok";
    }
}