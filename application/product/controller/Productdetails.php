<?php
namespace app\product\controller;
use think\Controller;
use think\Db;

class Productdetails extends Controller
{
    public function productdetails($productdevelop_id=null)
    { 
        $list = Db::table('buproductmaster')
        ->field('c.product_rollno,c.product_name,c.product_cost,c.product_price,c.product_color,c.productdevelop_id,a.productmaster_id')
        ->alias('a')
        ->join('buproductdevelop b','a.productmaster_id = b.productmaster_id')
        ->join('buproduct c','b.productdevelop_id = c.productdevelop_id')  
        ->where('c.productdevelop_id', "$productdevelop_id")
        ->select();
        $this->assign("pro",$list);
        return $this->fetch();

    }
}
