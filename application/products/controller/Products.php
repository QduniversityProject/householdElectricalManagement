<?php
namespace app\products\controller;
use think\Controller;
use think\Db;

class Products extends Controller
{
    public function products()
    { 
        $list = Db::table('buproductmaster')
        ->field('c.product_rollno,c.product_name,c.product_cost,c.product_price,c.product_color,b.productdevelop_name,a.productmaster_name')
        ->alias('a')
        ->join('buproductdevelop b','a.productmaster_id = b.productmaster_id')
        ->join('buproduct c','b.productdevelop_id = c.productdevelop_id')  
        ->paginate(5);
        return view('products',['list'=>$list]);
    }
}