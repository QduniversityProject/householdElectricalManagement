<?php
namespace app\role\controller;

use think\Controller;
use think\Db;

class Role extends Controller
{
    public function role()
    {
        $param = input('post.');
        if(empty($param['employeeid'])){
            $list = Db::table('buemployee')->select();
            return view('role',['list'=>$list]);
            // $this->assign('list', $list);
            // return $this->fetch();
        }else{
            $list = Db::table('buemployee')->where('employee_id',$param['employeeid'])->select();
            return view('role',['list'=>$list]);
        }
        
    }

    public function roleChange ($employee_id = 'EM00002')
    {
        $list = Db::table('buemployee')->field('employee_password',true)->where('employee_id',$employee_id)->select();
        // halt($list);
        $this->assign('selected', $list[0]['role_id']);
        return view('roleChange',['list'=>$list]);
    }

    public function doChange()
    {
        $now = input('post.');
        Db::table('buemployee')->where('employee_id', $now['employee_id'])->update(['role_id' => $now['role_id']]);
        $this->success('修改成功！','Role/role',1);
        // $list = Db::table('buemployee')->field('employee_password',true)->where('employee_id',$now['employee_id'])->select();
        // return view('roleChange',['list'=>$list]);
    }

}