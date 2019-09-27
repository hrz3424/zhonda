<?php

namespace app\admin\validate;

use think\Validate;

class User extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'email'    => 'require|email|unique:user,email',
    ];
    /**
     * 提示消息
     */
    protected $message = [
        'email' => '邮箱格式错误'
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => ['email'],
        'edit' => ['email'],
    ];

}
