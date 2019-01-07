<?php

namespace app\afterSale\controller;
use app\afterSale\model\AfterSaleModel;
use think\Db;

use think\Controller;

class Index extends controller
{
    public function index($employee_id=null){
        if(isset($employee_id)){
            $info=Db::table('buaftersale')
            ->alias('a')
            ->join('custom_order b', 'a.order_num = b.order_num')
            ->join('customer c', 'b.custom_num = c.customer_id')
            ->where('employee_id', $employee_id)
            ->order('a.state')
            ->order('c.level desc')
            ->paginate(5);
            $this->assign('aftersaleInfo', $info);
            return $this->fetch('Index/index_emp');
        }
        else{
            $info=AfterSaleModel::paginate(5);
            $this->assign('aftersaleInfo', $info);
            return $this->fetch('Index/index');
        }
       
    }

    public function vip($employee_id=null){
        $info=Db::table('buaftersale')
        ->alias('a')
        ->join('custom_order b', 'a.order_num = b.order_num')
        ->join('customer c', 'b.custom_num = c.customer_id')
        ->where('employee_id', $employee_id)
        ->where('c.level', '是')
        ->order('a.state')
        ->order('c.level desc')
        ->paginate(5);
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('Index/index_emp');
    }
    public function nofeedback($employee_id=null){
        $info=Db::table('buaftersale')
        ->alias('a')
        ->join('custom_order b', 'a.order_num = b.order_num')
        ->join('customer c', 'b.custom_num = c.customer_id')
        ->where('employee_id', $employee_id)
        ->where('a.state', '办理中')
        ->order('a.state')
        ->order('c.level desc')
        ->paginate(5);
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('Index/index_emp');
    }
    public function feedback($employee_id=null){
        $info=Db::table('buaftersale')
        ->alias('a')
        ->join('custom_order b', 'a.order_num = b.order_num')
        ->join('customer c', 'b.custom_num = c.customer_id')
        ->where('employee_id', $employee_id)
        ->where('a.state', '办结')
        ->order('a.state')
        ->order('c.level desc')
        ->paginate(5);
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('Index/index_emp');
    }

}