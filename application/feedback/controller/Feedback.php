<?php

namespace app\feedback\controller;
use app\feedback\model\FeedbackModel;

use think\Controller;
use think\Db;
class Feedback extends controller
{
    public function show()
    {
        return $this->fetch("Feedback/show");
    }

    public function createForm()
    {
        $type=$_GET['type'];
        $others=$_GET['others'];
        $aftersaleID=$_GET['aftersaleID'];
        $date=date('Y-m-d');
        $charge=$_GET['charge'];
        $confirm=$_GET['confirm'];
        if($confirm==1) $confirm='已确认';
        else $confirm='未确认';

        $year = substr($aftersaleID, 2, 4);
        $month = substr($aftersaleID, 6, 2);

        $result0 = Db::table('bufeedback')
        ->alias('a')
        ->join('buaftersale b', 'a.aftersale_roll = b.aftersale_roll')
        ->column('employee_id');
        $saleperson = $result0[0];

        $result1 = FeedbackModel::query("select feedback_roll from bufeedback order by feedback_id desc limit 1;");
        $roll = $result1[0]['feedback_roll'];
        $roll_int = (int)substr($roll,-5,5);
        $roll_int += 1;
        $newroll = str_pad($roll_int, 5, 0, STR_PAD_LEFT);
        $feedbackroll = "FD".$year.$month.$newroll;

        $this->assign('feedbackroll', $feedbackroll);
        $this->assign('aftersaleID', $aftersaleID);
        $this->assign('type', $type);
        $this->assign('others', $others);
        $this->assign('saleperson', $saleperson);
        $this->assign('date', $date);
        $this->assign('charge', $charge);
        $this->assign('confirm', $confirm);

        return $this->fetch('Feedback/pannel');
    }

    public function insert()
    {
        $feedback_roll=$_GET['feedback_roll'];
        $feedback_type=$_GET['feedback_type'];
        $others=$_GET['others'];   
        $feedback_date=$_GET['feedback_date'];
        $aftersaleID=$_GET['aftersale_roll'];
        $charge=$_GET['charge'];
        if($_GET['confirm']=='已确认') $confirment = 1;
        else $confirment = 0;
        Db::table('bufeedback')
        ->insert(['aftersale_roll' => $aftersaleID, 'feedback_roll' => $feedback_roll, 'feedback_type' => $feedback_type, 'others' => $others, 'feedback_date' => $feedback_date, 'charge' => $charge, 'confirment' => $confirment]);
        Db::table('buaftersale')
        ->where('aftersale_roll', $aftersaleID)
        ->update(['state' => "办结"]);
    }

}
