<?php

namespace app\feedback\controller;
use app\feedback\model\FeedbackModel;
use think\Controller;
use think\Db;

class Index extends controller
{
    public function index($employee_id=null){
        if(isset($employee_id)){
            $info=Db::table('bufeedback')
            ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
            ->where('employee_id', $employee_id)
            ->paginate(5);
            $this->assign('feedbackInfo', $info);
            return $this->fetch('Index/index_emp');
        }
        else{
            $info=Db::table('bufeedback')
        ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
        ->paginate(5);
        $this->assign('feedbackInfo', $info);
        return $this->fetch('Index/index');
        }
        
    }
}