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
            ->where('employee_id', $employee_id)
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

}