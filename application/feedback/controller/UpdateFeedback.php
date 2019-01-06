<?php

namespace app\feedback\controller;

use think\Controller;
use app\feedback\model\FeedbackModel;

class UpdateFeedback extends controller
{
    public function form($id){
        $feedbackInfo=FeedbackModel::where('feedback_roll','=',$id)
        ->find();
        $this->assign('info', $feedbackInfo);
        return $this->fetch('UpdateFeedback/form');
    }

    public function update(){
        dump($_GET);
        $order=FeedbackModel::where('feedback_roll',$_GET['feedback_roll'])->find();
        $order->others=$_GET['others'];
        $order->feedback_type=$_GET['feedback_type'];
        $order->confirment=$_GET['confirment'];
        $order->charge=$_GET['charge'];
        $order->others=$_GET['others'];
        $order->save();
        echo($order);
        echo "ok";
    }
}