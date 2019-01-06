<?php

namespace app\afterSale\controller;
use app\afterSale\model\AfterSaleModel;
use think\Db;

use think\Controller;

class Index extends controller
{
    public function index(){
        $info=AfterSaleModel::paginate(10);
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('Index/index');
    }
}