<?php

namespace app\product\model;

use think\Model;

class Product extends Model
{
    // 设置完整的数据表（包含前缀）
    protected $table = 'buproduct';
    public function profile()
    {
    	return $this->hasOne('product_rollno');
    }
}
