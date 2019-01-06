<?php
namespace app\product\controller;
use think\Controller;
use think\Db;

class Product extends Controller
{
    public function product($department_id=null)
    { 
        $list = Db::table('buproductmaster')
        ->field('b.productdevelop_name,a.productmaster_name,b.productdevelop_id,c.department_id')
        ->alias('a')
        ->join('buproductdevelop b','a.productmaster_id = b.productmaster_id')
        ->join('budepartment c','a.productmaster_id = c.productmaster_id')  
        ->where('c.department_id', "$department_id")
        ->select();
        $this->assign("pro",$list);
        return $this->fetch();
    }
}