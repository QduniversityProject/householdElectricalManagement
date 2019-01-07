<?php
namespace app\chart\controller;

use think\Controller;
use think\request;
use think\Db;

class Chart extends Controller
{
    public function charta ()
    {
        return $this->fetch();
    }

    public function showcharta ()
    {
        $param = input('post.');
        $amdata = Db::query("select c.productmaster_name, avg(amount*unit_price) as avg, max(amount*unit_price) as max 
        from buproduct a join buproductdevelop b 
        on a.productdevelop_id = b.productdevelop_id join buproductmaster c 
        on b.productmaster_id = c.productmaster_id join custom_order d 
        on a.product_rollno = d.product_num where d.order_time BETWEEN '".$param['starttime']."' AND '".$param['endtime']."' 
        GROUP BY c.productmaster_id;");
        // halt($amdata);
        if (count($amdata) !== 0){
            foreach ($amdata as $key => $val){
                $avg[$key] = $val['avg'];
                $max[$key] = (int)$val['max'];
                $pname[$key] = $val['productmaster_name'];
            }
            $avg1 = array('name' => '平均销售额', 'data' => $avg);
            $max1 = array('name' => '最高销售额', 'data' => $max);
            $avgmax = json_encode(array($avg1, $max1));
            $pname = json_encode($pname);
        }
        else{
            $this->error('没有查到相应成绩！');
        }
        // halt($pname);

        /* 产品大类别饼状图数据 */ 
        $amount1 = Db::query('select a.productmaster_name as name, sum(amount) as sum from buproductmaster a join buproductdevelop b 
        on a.productmaster_id=b.productmaster_id join buproduct c 
        on b.productdevelop_id=c.productdevelop_id join custom_order d 
        on c.product_rollno=d.product_num group by a.productmaster_id order by sum desc limit 1;');

        $amount2 = Db::query('select a.productmaster_name as name, sum(amount) as sum from buproductmaster a join buproductdevelop b 
        on a.productmaster_id=b.productmaster_id join buproduct c 
        on b.productdevelop_id=c.productdevelop_id join custom_order d 
        on c.product_rollno=d.product_num group by a.productmaster_id order by sum desc limit 1,1;');

        $amount3 = Db::query('select a.productmaster_name as name, sum(amount) as sum from buproductmaster a join buproductdevelop b 
        on a.productmaster_id=b.productmaster_id join buproduct c 
        on b.productdevelop_id=c.productdevelop_id join custom_order d 
        on c.product_rollno=d.product_num group by a.productmaster_id order by sum desc limit 2,1;');

        $total1 = Db::query('select sum(amount) as sum from buproductmaster a join buproductdevelop b 
        on a.productmaster_id=b.productmaster_id join buproduct c 
        on b.productdevelop_id=c.productdevelop_id join custom_order d 
        on c.product_rollno=d.product_num;');

        // halt($amount1[0]['sum']);
        if ($total1[0]['sum'] !== 0)
        {
            $pamount1 = $amount1[0]['sum']*100/$total1[0]['sum'];
            $pamount2 = $amount2[0]['sum']*100/$total1[0]['sum'];
            $pamount3 = $amount3[0]['sum']*100/$total1[0]['sum'];
            $pamount4 = 100 - $pamount1 - $pamount2 - $pamount3;
            $a1 = array('category' => $amount1[0]['name'], 'value' => $pamount1, 'color' => '#9de219');
            $a2 = array('category' => $amount2[0]['name'], 'value' => $pamount2, 'color' => '#90cc38');
            $a3 = array('category' => $amount3[0]['name'], 'value' => $pamount3, 'color' => '#068c35');
            $a4 = array('category' => '其他', 'value' => $pamount4, 'color' => '#006634');
            $pie1 = json_encode(array($a1, $a2, $a3, $a4));
            // halt($pie1);
        }
        else{
            $this->error('没有查到相应成绩！');
        }

        /* 具体产品饼状图数据 */ 
        $amount4 = Db::query('select a.product_name as name, sum(amount) as sum from buproduct a join custom_order b 
        on a.product_rollno=b.product_num GROUP BY a.product_rollno ORDER BY sum desc limit 1;');

        $amount5 = Db::query('select a.product_name as name, sum(amount) as sum from buproduct a join custom_order b 
        on a.product_rollno=b.product_num GROUP BY a.product_rollno ORDER BY sum desc limit 1,1;');

        $amount6 = Db::query('select a.product_name as name, sum(amount) as sum from buproduct a join custom_order b 
        on a.product_rollno=b.product_num GROUP BY a.product_rollno ORDER BY sum desc limit 2,1;');

        $total2 = Db::query('select sum(amount) as sum from buproduct a join custom_order b 
        on a.product_rollno=b.product_num;');

        if ($total2[0]['sum'] !== 0)
        {
            $pamount5 = $amount4[0]['sum']*100/$total2[0]['sum'];
            $pamount6 = $amount5[0]['sum']*100/$total2[0]['sum'];
            $pamount7 = $amount6[0]['sum']*100/$total2[0]['sum'];
            $pamount8 = 100 - $pamount5 - $pamount6 - $pamount7;
            $a5 = array('category' => $amount4[0]['name'], 'value' => $pamount5, 'color' => '#9de219');
            $a6 = array('category' => $amount5[0]['name'], 'value' => $pamount6, 'color' => '#90cc38');
            $a7 = array('category' => $amount6[0]['name'], 'value' => $pamount7, 'color' => '#068c35');
            $a8 = array('category' => '其他', 'value' => $pamount8, 'color' => '#006634');
            $pie2 = json_encode(array($a5, $a6, $a7, $a8));
            // halt($pie2);
        }
        else{
            $this->error('没有查到相应成绩！');
        }

        /* 问题产品排行表 */ 
        $list1 = Db::query('select c.product_name as name, count(b.product_num) as count from buaftersale a join custom_order b 
        on a.order_num=b.order_num join buproduct c
        on b.product_num=c.product_rollno group by b.product_num order by count desc;');

        /* 产品购买途径排行表 */ 
        $list2 = Db::query('select order_channel as name, count(order_channel) as count, sum(amount*unit_price) as sum from custom_order 
        group by order_channel order by count desc;');



        $this->assign('pname', $pname);
        $this->assign('avgmax', $avgmax);
        $this->assign('pie1', $pie1);
        $this->assign('pie2', $pie2);
        $this->assign('list1', $list1);
        $this->assign('list2', $list2);
        return view('charta');
    }
}