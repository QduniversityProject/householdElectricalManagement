<?php

namespace app\feedback\controller;
use app\feedback\model\FeedbackModel;
use think\Controller;

class Index extends controller
{
    public function index(){
        $info=FeedbackModel::paginate(10)
        ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll');
        $this->assign('feedbackInfo', $info);
        return $this->fetch('feedback/index');
    }
}