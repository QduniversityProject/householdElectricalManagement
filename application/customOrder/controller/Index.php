<?php
namespace app\customOrder\controller;
use app\customOrder\model\CustomOrder as Order;
use think\Db;
use think\Controller;

class Index extends controller
{
    public function index()
    {
    //获取员工编号
    // $uid=$_COOKIE['u_id'];
    //获取部门编号
    // $pid=$_COOKIE['p_id'];
    $pid=1;
    $order=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->where('c.department_id','=',($pid))
    ->paginate(10);
    $this->assign('cusTomOrder', $order);
    return $this->fetch();
   
    }
    public function test(){
        echo json_decode("7777");
    }

    public function excelPrint()
    {
        //获取员工编号
        // $uid=$_COOKIE['u_id'];
        //获取部门编号
        // $pid=$_COOKIE['p_id'];
        $pid=1;

        $markTable = Db::table('custom_order')
                    ->alias('a')
                    ->join('buproduct b','a.product_num = b.product_rollno')
                    ->join('buemployee c','a.saler_num = c.employee_id')
                    ->join('customer d ', 'a.custom_num = d.customer_id')
                    ->where('c.department_id','=',($pid))
                    ->select();
    
        $path = dirname(__FILE__); //找到当前脚本所在路径
        vendor("PHPExcel"); //方法一
        $PHPExcel = new \PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("订单"); //给当前活动sheet设置名称
        $PHPSheet
            ->setCellValue("A1", "订单编号")
            ->setCellValue("B1", "订单渠道")
            ->setCellValue("C1", "产品编号")
            ->setCellValue("D1", "产品名称")
            ->setCellValue("E1", "数量")
            ->setCellValue("F1", "单价")
            ->setCellValue("G1", "订单时间")
            ->setCellValue("H1", "销售员编号")
            ->setCellValue("I1", "销售员姓名")
            ->setCellValue("J1", "产品颜色")
            ->setCellValue("K1", "产品规格")
            ->setCellValue("L1", "产品尺寸")
            ->setCellValue("M1", "产品重量")
            ->setCellValue("N1", "产品成本")
            ->setCellValue("O1", "顾客编号")
            ->setCellValue("P1", "顾客姓名");

        $i = 2;
        foreach ($markTable as $data) {
            $PHPSheet
                ->setCellValue("A" . $i, $data['order_num'])
                ->setCellValue("B" . $i, $data['order_channel'])
                ->setCellValue("C" . $i, $data['product_num'])
                ->setCellValue("D" . $i, $data['product_name'])
                ->setCellValue("E" . $i, $data['amount'])
                ->setCellValue("F" . $i, $data['unit_price'])
                ->setCellValue("G" . $i, $data['order_time'])
                ->setCellValue("H" . $i, $data['saler_num'])
                ->setCellValue("I" . $i, $data['employee_name'])
                ->setCellValue("J" . $i, $data['procuct_color'])
                ->setCellValue("K" . $i, $data['product_model'])
                ->setCellValue("L" . $i, $data['product_size'])
                ->setCellValue("M" . $i, $data['product_weight'])
                ->setCellValue("N" . $i, $data['product_cost'])
                ->setCellValue("O" . $i, $data['custom_num'])
                ->setCellValue("P" . $i, $data['name'])

                ;
            $i++;
        }

        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007");
        header('Content-Disposition: attachment;filename="订单.xlsx"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
    }
}
