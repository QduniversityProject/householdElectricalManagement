<?php
namespace app\customOrder\controller;
use app\customOrder\model\customOrder as CusTomOrder;

use think\Controller;

class Index extends controller
{
    public function index()
    {
    $cusTomOrder=CusTomOrder::paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $cusTomOrder);
    return $this->fetch();
   
    }
}
