<?php
namespace app\departments\controller;

use app\departments\model\Departments as DepartmentsModel;
use think\Controller;
use think\Db;

class Departments 
{

    public function departments()
    {
        $list = DepartmentsModel::paginate(5);
        return view('departments',['list'=>$list]);
    }



}