<?php
namespace app\customOrder\controller;
use app\customOrder\model\CustomOrder as Order;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;
use think\Controller;

class ImportFromExcel extends controller
{
    public function import()
    {
        // echo "成功";
        vendor("PHPExcel"); //方法一
        $objPHPExcel = new \PHPExcel();
 
        //获取表单上传文件
		$file = request()->file('excel');
        $info = $file->validate(['size'=>15678,'ext'=>'xlsx,xls,csv'])->move(ROOT_PATH . 'public' . DS . 'excel');
		if($info){
            $exclePath = $info->getSaveName();  //获取文件名
            $file_name = ROOT_PATH . 'public' . DS . 'excel' . DS . $exclePath;   //上传文件的地址
            $objReader =\PHPExcel_IOFactory::createReader('Excel2007');
            $obj_PHPExcel =$objReader->load($file_name, $encode = 'utf-8');  //加载文件内容,编码utf-8
            echo "<pre>";
            $excel_array=$obj_PHPExcel->getsheet(0)->toArray();   //转换为数组格式
            array_shift($excel_array);  //删除第一个数组(标题);
            $data = [];
			$i=0;
            foreach($excel_array as $k=>$v) {
                $data[$k]['order_num'] = $v[1];
                $data[$k]['product_num'] = $v[2];
                $data[$k]['custom_num'] = $v[3];
                $data[$k]['order_time'] = $v[4];
                $data[$k]['order_channel'] = $v[5];
                $data[$k]['amount'] = $v[6];
                $data[$k]['unit_price'] = $v[7];
                $data[$k]['saler_num'] = $v[8];
				$i++;
            }
            $success=Db::name('custom_order')->insertAll($data); //批量插入数据
          
		   $error=$i-$success;
            echo "总{$i}条，成功{$success}条，失败{$error}条。";
        
		}else{
			// 上传失败获取错误信息
			echo $file->getError();
        }
        // $this->assign('success', $success);
        // $this->assign('error', $error);
        // return $this->fetch(index.);
    }
 
}