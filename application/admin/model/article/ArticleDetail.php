<?php

namespace app\admin\model\article;

use think\Model;


class ArticleDetail extends Model
{





    // 表名
    protected $name = 'article_detail';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];










    public function article()
    {
        return $this->belongsTo('app\admin\model\article\Article', 'article_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
