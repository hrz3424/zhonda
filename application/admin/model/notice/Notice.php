<?php

namespace app\admin\model\notice;

use think\Model;


class Notice extends Model
{





    // 表名
    protected $name = 'notice';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'objecttype_text'
    ];



    public function getObjecttypeList()
    {
        return ['0' => __('公司'), '1' => __('驾驶员')];
    }


    public function getObjecttypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['objecttype']) ? $data['objecttype'] : '');
        $list = $this->getObjecttypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
