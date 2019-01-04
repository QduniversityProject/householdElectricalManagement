<?php
namespace app\products\controller;
use think\Controller;
use think\Db;

class Products extends Controller
{
    public function products()
    { 
        $list = Db::table('buproductmaster')
        ->field('b.productdevelop_name,a.productmaster_name,b.productdevelop_id')
        ->alias('a')
        ->join('buproductdevelop b','a.productmaster_id = b.productmaster_id')
        ->join('budepartment c','a.productmaster_id = c.productmaster_id')  
        ->paginate(5);
        $this->assign("pro",$list);
        return $this->fetch();
    }
}