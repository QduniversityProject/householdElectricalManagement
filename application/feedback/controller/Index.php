<?php

namespace app\feedback\controller;
use app\feedback\model\FeedbackModel;
use think\Controller;
use think\Db;

class Index extends controller
{
    public function index(){
        $info=Db::table('bufeedback')
        ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
        ->paginate(10);
        $this->assign('feedbackInfo', $info);
        return $this->fetch('Index/index');
    }
}