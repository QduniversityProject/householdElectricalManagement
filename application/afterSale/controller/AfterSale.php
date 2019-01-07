<?php

namespace app\afterSale\controller;
use app\afterSale\model\AfterSaleModel;
use think\Db;
use think\Controller;

class AfterSale extends controller
{
    public function show()
    {
        return $this->fetch("AfterSale/show");
    }

    public function creatForm()
    {
        $type=$_GET['type'];
        $content=$_GET['content'];
        $saleID=$_GET['saleID'];
        $check0 = Db::table('custom_order')
        ->where('order_num',$saleID)
        ->find();
        if(is_null($check0['order_num'])){
            $flag='请输入已有的销售单号或按照正确的销售单号格式输入';
            $this->assign('flag', $flag);
        }

        //$saleperson=$_COOKIE['employee_id'];
        $date=date("Y-m-d");

        $year = substr($saleID, 2, 5);
        $month = substr($saleID, 7, 2);

        $result = Db::query("select aftersale_roll from buaftersale order by aftersale_id desc limit 1;");
        $roll = $result[0]['aftersale_roll'];
        $roll_int = (int)substr($roll,-5,5);
        $roll_int += 1;
        $newroll = str_pad($roll_int, 4, 0, STR_PAD_LEFT);
        $aftersaleroll = "SV".$year.$month.$newroll;

        $this->assign('aftersaleroll', $aftersaleroll);
        $this->assign('saleID', $saleID);
        $this->assign('type', $type);
        $this->assign('content', $content);
        //$this->assign('saleperson', $saleperson);
        $this->assign('date', $date);

        return $this->fetch('AfterSale/pannel');
    }

    public function insert()
    {
        $type=$_GET['question_type'];
        $content=$_GET['question'];   
        $saleperson=$_GET['saleperson'];
        $date=$_GET['date'];
        $aftersaleID=$_GET['aftersale_roll'];
        $saleID=$_GET['order_num'];
        Db::table('buaftersale')
        ->insert(['aftersale_roll' => $aftersaleID, 'order_num' => $saleID, 'question_type' => $type, 'question' => $content, 'employee_id' => $saleperson, 'processing_date' => $date, 'state' => '办理中']);
    }

}
