<?php
namespace app\customOrder\controller;


use think\Controller;

class UpdateOrder extends controller
{
    public function update($id)
    {
    $this->assign('orderId', $id);
    return $this->fetch();
   
    }
    public function delete()
    {
    $cusTomOrder=CusTomOrder::paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $cusTomOrder);
    return $this->fetch();
   
    }

}
