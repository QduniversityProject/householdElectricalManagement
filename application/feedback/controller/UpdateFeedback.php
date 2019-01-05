<?php

namespace app\feedback\controller;

use think\Controller;

class UpdateFeedback extends controller
{
    public function form($id){
        $info=ubfeedback::where('feedback_roll','=',$id)
        ->find();
        $this->assign('feedbackInfo', $info);
        return $this->fetch('UpdateFeedback/form');
    }

    public function update($id){
        dump($_GET);
        $order=bufeedback::where('feedback_roll',$_GET['feedback_roll'])->find();
        $order->employee_id=$_GET['employee_id'];
        $order->others=$_GET['others'];
        $order->question_type=$_GET['question_type'];
        $order->confirment=$_GET['confirment'];
        $order->charge=$_GET['charge'];
        $order->save();
        echo($order);
        echo "ok";
    }
}