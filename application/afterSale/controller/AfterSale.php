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
        $saleperson=$_GET['saleperson'];
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
        $this->assign('saleperson', $saleperson);
        $this->assign('date', $date);

        return $this->fetch('AfterSale/pannel');
    }

    public function insert()
    {
        dump($_GET);
        exit;
        $type=$_GET['question_type'];
        $content=$_GET['question'];   
        $saleperson=$_GET['saleperson'];

        $date=$_GET['date'];
        $aftersaleID=$_GET['aftersale_roll'];
$saleID=$_GET['order_num'];
        $Insert=Db::execute("INSERT INTO ub buaftersale(aftersale_roll, order_num, question_type, question, employee_id, processing_date, state)
        VALUES ( $aftersaleID, $saleID, $type, $contnet, $saleperson, $date, '办理中');");
        if($Insert){
            return "添加成功";
        }else
        return "添加失败";
    }

}
