<?php

namespace app\feedback\controller;


use think\Controller;

class Feedback extends controller
{
    public function show()
    {
        return $this->fetch("Feedback/show");
    }

    public function createForm()
    {
        $type=$_GET['type'];
        $content=$_GET['content'];
        $saleID=$_GET['saleID'];
        $saleperson=$_GET['saleperson'];
        $date=$_GET['date'];

        $year = substr($saleID, 3, 4);
        $month = substr($saleID, 7, 2);

        $result = Db::query("select aftersale_roll from buaftersale order by aftersale_id desc limit 1;");
        $roll = $result[0]['aftersale_roll'];
        $roll_int = (int)substr($roll,-5,5);
        $roll_int += 1;
        $newroll = str_pad($roll_int, 5, 0, STR_PAD_LEFT);
        $aftersaleroll = "SV"+$year+$month+$newroll;

        $this->assign('aftersaleroll', $saleroll);
        $this->assign('saleID', $saleID);
        $this->assign('type', $type);
        $this->assign('content', $content);
        $this->assign('saleperson', $saleperson);
        $this->assign('date', $date);

        $this->fetch('Feedback/show');
    }

    public function insert()
    {

        $type=$_GET['type'];
        $content=$_GET['content'];
        $saleID=$_GET['saleID'];
        $saleperson=$_GET['saleperson'];
        $date=$_GET['date'];
        $aftersaleID=$_GET['aftersaleID'];
        

        $Insert=Db::execute("INSERT INTO ub buaftersale(aftersale_roll, question_type, question, employee_id, processing_date, state) VALUES ( $aftersaleID, $type, $course_id, $content, $saleperson, $date, 1);");
        if($Insert){
            return "添加成功";
        }else
        return "添加失败";
    }

}
