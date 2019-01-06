<?php
namespace app\customOrder\controller;
use think\Db;

use think\Controller;
use app\customOrder\model\CustomOrder as Order;
class UpdateOrder extends controller
{
    public function form($id)
    {
        $info=Db::table('custom_order')
        ->alias('a')
        ->join('buemployee b','a.saler_num = b.employee_id')
        ->join('budepartment c','b.department_id = c.department_id')
        ->join('customer d','d.customer_id = a.custom_num')
        ->join('buproduct e','e.product_rollno = a.product_num')
        // ->join('bucompany_link_man f' , 'd.customer_id =f.belong_company')
        ->where('order_num','=',$id)
        ->find();
        $link=Db::query('select * from custom_order join bucompany_link_man on custom_order.custom_num =bucompany_link_man.belong_company WHERE custom_order.order_num =:id', ['id' => $id]);
        $this->assign('info', $info);
        $this->assign('link', $link);
    return $this->fetch();
    }
    public function update()
    {
        $order=Order::where('order_num','=',$_GET['order_num'])->find();
        $order->amount=$_GET['amount'];
        $order->unit_price=$_GET['unPrice'];
        $order->order_channel=$_GET['channel'];
        $result=$order->save();
        return json($result);
    }
    public function delete()
    {
    $cusTomOrder=CusTomOrder::paginate(10);
    // dump($cusTomOrder);
    $this->assign('cusTomOrder', $cusTomOrder);
    return $this->fetch();
    }

}
