<?php
namespace app\product\controller;
use think\Controller;
use think\Db;

class Productdetails extends Controller
{
    public function productdetails($productdevelop_id=null)
    { 
        $list = Db::table('buproduct')
        ->field('product_rollno,product_name,product_cost,product_price,product_color,productdevelop_id')
        ->where('productdevelop_id', "$productdevelop_id")
        ->select();
        $this->assign("pro",$list);
        return $this->fetch();
    }
}
