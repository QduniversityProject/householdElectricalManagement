<?php
namespace app\customOrder\controller;
use think\Controller;
use think\Db;

class ManagerAnalysis extends Controller
{       
    public function info()
    {
        //获取员工编号
        $role=$_COOKIE['role_id'];
        $uid=$_COOKIE['employee_id'];
        //获取部门编号
        $pid=$_COOKIE['department_id'];
        $info=Db::query("
        select
            a.saler_num as id,
            c.employee_name as name,
            d.productdevelop_name as type,
            SUM(a.amount*a.unit_price) as total,
            a.order_time
        from custom_order a
        join buproduct b on a.product_num = b.product_rollno
        join buemployee c on a.saler_num = c.employee_id
        join buproductdevelop d on b.productdevelop_id =d.productdevelop_id
        where c.department_id=".$pid."
        group by
            a.saler_num,
            b.product_id,
            c.employee_name,
            a.order_time 
order by total desc"
            ." limit ".($_GET['page']-1)*$_GET['limit'].",".$_GET['limit']
        );


        $num=Db::query("
        
                select count(*) as va from (select
                a.saler_num as id,
                c.employee_name as name,
                d.productdevelop_name as type,
                sum(a.amount*a.unit_price) as total,
                a.order_time as time
                from custom_order a
                join buproduct b on a.product_num = b.product_rollno
                join buemployee c on a.saler_num = c.employee_id
                join buproductdevelop d on b.productdevelop_id =d.productdevelop_id
                where c.department_id=".$pid."
                group by
                a.saler_num,
                b.product_id,
                c.employee_name,
                a.order_time
                ) as num;");

            $num=$num[0]['va'];
            $rs1=jsontable(0,'数据返回成功',$num,$info); 
            return json_encode($rs1);
    }
 


    public function managerAnalysis()
    {
       return $this->fetch();
    }

}
