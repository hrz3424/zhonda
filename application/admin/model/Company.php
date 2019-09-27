<?php

namespace app\admin\model;

use think\Model;
use app\admin\model\user;


class Company extends Model
{





    // 表名
    protected $name = 'company';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];

    protected static function init()
    {
        self::afterWrite(function($row) {
            $values['company_id'] = $row['id'];
            $values['email'] = $row['email'];
            $salt = \fast\Random::alnum();
            $values['password'] = \app\common\library\Auth::instance()->getEncryptPassword($row['password'], $salt);
            $values['salt'] =  $salt;
            db('user')->insert($values,true);
        });
    }










    public function user()
    {
        return $this->hasOne('User', '', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
