<?php
namespace app\customer\controller;
use think\Controller;
use think\Db;
use app\customer\model\Custom;
use app\customer\model\CompanyLinkMan;


class Index extends controller
{
    public function index()
    {
        $company=Db::table('customer')
        ->where("customer_id","like","CT02%")
        ->select();
        $this->assign("company",$company);
        return $this->fetch();
    }
    public function updata()
    {   
        $type=$_POST['type'];
        if($type=='CT01'){
            //获取顾客编号
            $maxNum=Db::query("select max(customer_id) from customer where customer_id like '$type%'");
            $abc=substr($maxNum[0]['max(customer_id)'],-5);
            $newNum=$type.sprintf('%05s',$abc+1);
            $customer=model('Custom');
            $customer->customer_id=$newNum;
            $customer->name=$_POST['name'];
            $customer->phnone=$_POST['phone'];
            $customer->address=$_POST['desc'];
            $customer->level=$_POST['numbers'];
            $status=$customer->save();
            if($status==1){
                return json("创建成功！");
            }
            else{
                return json("创建失败！");
            }
        }
        elseif ($type=='CT02'){
            $ccustomer=model('CompanyLinkMan');
            $ccustomer->belong_company=$_POST['comId'];
            $ccustomer->name=$_POST['name'];
            $ccustomer->phone=$_POST['phone'];
            $ccustomer->address=$_POST['desc'];
            $status=$ccustomer->save();
            if($status==1){
                return json("创建成功！");
            }
            else{
                return json("创建失败！");
            }

        }
        
    }

}
