<?php

namespace app\afterSale\controller;


use think\Controller;

class AfterSale extends controller
{
    public function show()
    {
        return $this->fetch("AfterSale/show");
    }

    public function createForm()
    {
        $type=$_GET['type'];
        $content=$_GET['content'];
        $saleID=$_GET['saleID'];
        $saleperson=$_GET['saleperson'];
        $date=$_GET['date'];
    }

    public function insert($aftersaleID='')
    {
        $type=$_GET['type'];
        $content=$_GET['content'];
        $saleID=$_GET['saleID'];
        $saleperson=$_GET['saleperson'];
        $date=$_GET['date'];
        $aftersaleID=$_GET['aftersaleID'];
        
        
        
        $testInsert=Db::execute("INSERT INTO untest (test_desc, test_type, course_id, tea_id, single_qus_num, multi_qus_num, judgment_qus_num, blank_qus_num, single_score, multi_score, judgment_score, blank_score, start_time, end_time) 
        VALUES ( '$tset_desc',$test_type, $course_id, $tea_id,$single_qus_num, $multi_qus_num,   $judgment_qus_num, $blank_qus_num, $single_score, 
        $multi_score, $judgment_score, $blank_score, '$start_time',  '$end_time');");
        if($testInsert){
            return "添加成功";
        }else
        return "添加失败";
    }

}
