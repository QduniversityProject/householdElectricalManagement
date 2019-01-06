<?php
namespace app\department\controller;
use think\Controller;
use think\Db;

class Department extends Controller
{

    public function department($department_id)
    {
        $list = Db::table('budepartment')
        ->field('department_name,department_desc,department_id')
        ->where('department_id', "$department_id")
        ->find();
        $this->assign("dep",$list);
        return $this->fetch();
    }
}
