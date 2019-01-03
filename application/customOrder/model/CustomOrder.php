<?php

namespace app\CustomOrder\model;

use think\Model;

class CustomOrder extends Model
{
    // 设置完整的数据表（包含前缀）
    protected $table = 'custom_order';
    // 模型和当前模型的命名空间不一致 一对一对应
    // return $this->hasOne('app\product\model\Product');
}
