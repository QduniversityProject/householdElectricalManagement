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
    $role=$_COOKIE['role_id'];
    $uid=$_COOKIE['employee_id'];
    //获取部门编号
    $pid=$_COOKIE['department_id'];

    //根据角色id 筛选能看部门的还是个人的
    if($role==3){
    $map['c.employee_id']  = array('=',$uid);
    }else
    $map['c.department_id']  = array('=',$pid);
    $order=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->where($map)
    ->paginate(10);
    $this->assign('cusTomOrder', $order);
    $this->assign('json', json_encode($order));
    return $this->fetch();
    }
    public function json()
    {
    //获取员工编号
    $role=$_COOKIE['role_id'];
    $uid=$_COOKIE['employee_id'];
    //获取部门编号
    $pid=$_COOKIE['department_id'];

    //根据角色id 筛选能看部门的还是个人的
    if($role==3){
    $map['c.employee_id']  = array('=',$uid);
    }else
    $map['c.department_id']  = array('=',$pid);
    
    $num=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->where($map)->count();


    $order=Db::table('custom_order')
    ->alias('a')
        // ->field('a.amount','*','a.unit_price')

    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->where('c.department_id','=',($pid))
    ->limit(($_GET['page']-1)*$_GET['limit'],$_GET['limit'])
    ->select();

   


    $rs1=jsontable(0,'数据返回成功',$num,$order); 
    return json_encode($rs1);

    }
    public function test(){
    //获取员工编号
    $role=$_COOKIE['role_id'];
    $uid=$_COOKIE['employee_id'];
    //获取部门编号
    $pid=$_COOKIE['department_id'];

    //根据角色id 筛选能看部门的还是个人的
    if($role==3){
    $map['c.employee_id']  = array('=',$uid);
    }else
    $map['c.department_id']  = array('=',$pid);
    $order=Db::table('custom_order')
    ->alias('a')
    ->join('buproduct b','a.product_num = b.product_rollno')
    ->join('buemployee c','a.saler_num = c.employee_id')
    ->where($map)
    ->select();
    // $this->assign('cusTomOrder', $order);
    return $this->fetch();
    }

    public function excelPrint()
    {
        //获取员工编号
    $role=$_COOKIE['role_id'];
    $uid=$_COOKIE['employee_id'];
    //获取部门编号
    $pid=$_COOKIE['department_id'];

    //根据角色id 筛选能看部门的还是个人的
    if($role==3){
    $map['c.employee_id']  = array('=',$uid);
    }else
    $map['c.department_id']  = array('=',$pid);

        $markTable = Db::table('custom_order')
                    ->alias('a')
                    ->join('buproduct b','a.product_num = b.product_rollno')
                    ->join('buemployee c','a.saler_num = c.employee_id')
                    ->join('customer d ', 'a.custom_num = d.customer_id')
                    ->where($map)
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
                ->setCellValue("J" . $i, $data['product_color'])
                ->setCellValue("K" . $i, $data['product_model'])
                ->setCellValue("L" . $i, $data['product_size'])
                ->setCellValue("M" . $i, $data['product_weight'])
                ->setCellValue("N" . $i, $data['product_cost'])
                ->setCellValue("O" . $i, $data['custom_num'])
                ->setCellValue("P" . $i, $data['name'])

                ;
            $i++;
        }
        //设置单元格宽度
        //参考地址  https://blog.csdn.net/diandian_520/article/details/7827038
        $PHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(16);
        $PHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(14);
        $PHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(12);
        $PHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(18);
        $PHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(12);
        $PHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(18);
        $PHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(18);
        $PHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(18);


        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel2007");
        header('Content-Disposition: attachment;filename="订单.xlsx"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $PHPWriter->save("php://output"); //表示在$path路径下面生成demo.xlsx文件
    }

    public function getPdf(){    
// $html = <<<EOD
// <h1>该功能正在维护--敬请期待</h1>  
// EOD;
            
            // pdf($html);die;



            function pdf($html=array(),$title="订单",$fileName="订单PDF"){
                // $fileName = time();
                vendor('tecnickcom.tcpdf.tcpdf'); //导入TCPDF类
                $pdf = new \Tcpdf(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
                // 设置打印模式
                //设置文件信息，头部的信息设置
                $pdf->SetCreator(PDF_CREATOR);
                $pdf->SetAuthor("XX家电管理系统");
                $pdf->SetTitle($title);
                $pdf->SetSubject('TCPDF Tutorial');
                $pdf->SetKeywords('TCPDF, PDF, example, test, guide');//设置关键字 
                // 是否显示页眉
                $pdf->setPrintHeader(false);
                // 设置页眉显示的内容
                $pdf->SetHeaderData('logo.png', 60, 'baijunyao.com', '', array(0,64,255), array(0,64,128));
                // 设置页眉字体
                $pdf->setHeaderFont(Array('deja2vusans', '', '12'));
                // 页眉距离顶部的距离
                $pdf->SetHeaderMargin('5');
                // 是否显示页脚
                $pdf->setPrintFooter(false);
                // 设置页脚显示的内容
                $pdf->setFooterData(array(0,64,0), array(0,64,128));
                // 设置页脚的字体
                $pdf->setFooterFont(Array('dejavusans', '', '10'));
                // 设置页脚距离底部的距离
                $pdf->SetFooterMargin('10');
                // 设置默认等宽字体
                $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
                // 设置行高
                $pdf->setCellHeightRatio(1);
                // 设置左、上、右的间距
                $pdf->SetMargins('10', '10', '10');
                // 设置是否自动分页  距离底部多少距离时分页
                $pdf->SetAutoPageBreak(TRUE, '15');
                // 设置图像比例因子
                $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
                if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
                    require_once(dirname(__FILE__).'/lang/eng.php');
                    $pdf->setLanguageArray($l);
                }
                $pdf->setFontSubsetting(true);
                $pdf->AddPage("A4","Landscape",true,true);
                // 设置字体
                $pdf->SetFont('stsongstdlight', '', 10, '', true);
             
                $pdf->writeHTML($html);//HTML生成PDF
                //$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);
                $showType= 'I';//PDF输出的方式。I，在浏览器中打开；D，以文件形式下载；F，保存到服务器中；S，以字符串形式输出；E：以邮件的附件输出。
                
                 $pdf->Output("{$fileName}.pdf", $showType);
             
            }
                //如果是把HTML页面转PDF格式执行以下代码
                //   $html = "http://localhost/tp5/public/customOrder/index?page=1";
                $html = "http://localhost/tp6/public/customOrder/index/test";
                // $html="www.baidu.com";
                  $data = file_get_contents($html);//获取html页面的url
                //   dump($data);
                  pdf($data);die;
                 
               
               
    
    }
    
}
