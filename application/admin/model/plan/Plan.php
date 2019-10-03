<?php

namespace app\admin\model\plan;

use think\Model;


class Plan extends Model
{





    // 表名
    protected $name = 'plan';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'typedata_text'
    ];



    public function getTypedataList()
    {
        return ['0' => __('日常培训'), '1' => __('岗前培训')];
    }


    public function getTypedataTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['typedata']) ? $data['typedata'] : '');
        $list = $this->getTypedataList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
