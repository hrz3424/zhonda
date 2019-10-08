<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\model\User;

/**
 * 验证接口
 */
class Validate extends Api
{
    protected $noNeedLogin = '*';
    protected $layout = '';
    protected $error = null;

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 检测邮箱验证码
     *
     * @param string $email   邮箱
     * @param string $captcha 验证码
     */
    public function check_ems_correct()
    {
        $email = $this->request->request('email');
        $captcha = $this->request->request('captcha');
        if (!\app\common\library\Ems::check($email, $captcha)) {
            $this->error(__('验证码不正确'));
        }
        $this->success();
    }
}
