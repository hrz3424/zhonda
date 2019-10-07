<?php

namespace app\admin\model;

use think\Model;


class Driver extends Model
{





    // 表名
    protected $name = 'driver';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'typedata_text',
        'status_text'
    ];



    public function getTypedataList()
    {
        return ['0' => __('Typedata 0'), '1' => __('Typedata 1')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
    }


    public function getTypedataTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['typedata']) ? $data['typedata'] : '');
        $list = $this->getTypedataList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    /**
     * 获取驾驶员的消息
     */
    public function messages()
    {
        return $this->morphMany('Message', 'msgtable');
    }




}
