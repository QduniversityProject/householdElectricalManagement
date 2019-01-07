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
<<<<<<< HEAD
        ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
        ->paginate(5);
        $this->assign('feedbackInfo', $info);
           
=======
            ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
            ->where('employee_id', $employee_id)
            ->paginate(5);
            $this->assign('feedbackInfo', $info);
>>>>>>> a9a22f027cb4addb4f8c832e4dcd0cf5c421cb57
            return $this->fetch('Index/index_emp');
        }
        else{
            $info=Db::table('bufeedback')
        ->join('buaftersale','bufeedback.aftersale_roll = buaftersale.aftersale_roll')
        ->paginate(5);
        $this->assign('feedbackInfo', $info);
<<<<<<< HEAD
            return $this->fetch('Index/index');
        }
=======
        return $this->fetch('Index/index');
        }
        
>>>>>>> a9a22f027cb4addb4f8c832e4dcd0cf5c421cb57
    }
}