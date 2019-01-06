<?php

namespace app\feedback\controller;

use think\Controller;
use app\feedback\model\FeedbackModel;
use think\Db;

class UpdateFeedback extends controller
{
    public function form($id){
        $feedbackInfo=Db::table('bufeedback')
        ->alias('a')
        ->join('buaftersale b', 'a.aftersale_roll=b.aftersale_roll')
        ->where('feedback_roll','=',$id)
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

        // $info=Db::table('bufeedback')
        // ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
        // ->paginate(10);
        // $this->assign('feedbackInfo', $info);

        // return $this->fetch('Index/index');
    }
}