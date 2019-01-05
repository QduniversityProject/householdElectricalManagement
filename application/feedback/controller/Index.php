<?php

namespace app\feedback\controller;

use think\Controller;

class Index extends controller
{
    public function index(){
        $info=bufeedback::paginate(10);
        $this->assign('feedbackInfo', $info);
        return $this->fetch('feedback/index');
    }
}