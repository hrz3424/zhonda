<?php

namespace app\admin\model\video;

use think\Model;


class VideoDetail extends Model
{





    // 表名
    protected $name = 'video_detail';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];










    public function video()
    {
        return $this->belongsTo('app\admin\model\Video', 'video_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
