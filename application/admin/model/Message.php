<?php

namespace app\admin\model;

use think\Model;

use app\admin\model\Driver;

use app\admin\model\Company;


class Message extends Model
{





    // 表名
    protected $name = 'message';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'objectdata_text'
    ];



    public function getObjectdataList()
    {
        return ['0' => __('Objectdata 0'), '1' => __('Objectdata 1')];
    }


    public function getObjectdataTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['objectdata']) ? $data['objectdata'] : '');
        $list = $this->getObjectdataList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function msgtable()
    {
        return $this->morphTo('msgtable',[
            'Company'	=>	Company::class,
            'Driver'	=>	Driver::class,
        ]);
    }





}
