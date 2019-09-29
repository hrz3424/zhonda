<?php

namespace app\admin\model\question;

use think\Model;


class QuestionDetail extends Model
{





    // 表名
    protected $name = 'question_detail';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];










    public function question()
    {
        return $this->belongsTo('app\admin\model\question\Question', 'question_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
