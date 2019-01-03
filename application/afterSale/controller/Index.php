<?php

namespace app\afterSale\controller;

use think\Controller;

class Index extends controller
{
    public function index($id){
        $order=buaftersale::paginate(10);
        $this->assign('aftersaleInfo', $info);
        return $this->fetch('afterSale/index');
    }
}