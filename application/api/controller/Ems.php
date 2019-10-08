<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\library\Ems as Emslib;
use app\common\model\User;

/**
 * 邮箱验证码接口
 */
class Ems extends Api
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
        \think\Hook::add('ems_send', function($params) {
            $obj = \app\common\library\Email::instance();
            $result = $obj
                ->to($params->email)
                ->subject('验证码')
                ->message("你的验证码是：" . $params->code)
                ->send();
            return $result;
        });
    }

    /**
     * 发送验证码
     *
     * @param string    $email      邮箱
     */
    public function send()
    {
        $email = $this->request->request("email");

        $last = Emslib::get($email);
        if ($last && time() - $last['createtime'] < 60)
        {
            $this->error(__('发送频繁'));
        }
        $ret = Emslib::send($email, NULL);
        if ($ret)
        {
            $this->success(__('发送成功'));
        }
        else
        {
            $this->error(__('发送失败'));
        }
    }

    /**
     * 检测验证码
     *
     * @param string    $email      邮箱
     * @param string    $captcha    验证码
     */
    public function check()
    {
        $email = $this->request->request("email");
        $captcha = $this->request->request("captcha");

        $ret = Emslib::check($email, $captcha);
        if ($ret)
        {
            $this->success(__('成功'));
        }
        else
        {
            $this->error(__('验证码不正确'));
        }
    }

}
