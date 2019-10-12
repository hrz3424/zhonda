<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\library\Ems;
use app\common\library\Sms;
use fast\Random;
use think\Validate;

/**
 * 会员接口
 */
class User extends Api
{
    protected $noNeedLogin = ['login', 'resetpwd', 'changeemail'];
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }


    /**
     * 会员登录
     *
     * @param string $account  账号
     * @param string $password 密码
     * @param string $code 验证码
     * @ApiReturn ({
        "code": 1,
        "msg": "登录成功",
        "time": "1570501579",
        "data": {
            "userinfo": {
                "token": "423f0205-7805-4619-90a3-79cbdcab6800",
                "createtime": 1570501579,
                "expiretime": 1573093579,
                "expires_in": 2592000,
                "company_id": 4
             }
           }
        })
     */
    public function login()
    {
        $account = $this->request->request('account');
        $password = $this->request->request('password');
        $code = $this->request->request('code');
        $captcha = new \think\captcha\Captcha();
        if(!$captcha->check($code)){
            return $this->error('验证码错误');
        }
        if (!$account || !$password) {
            $this->error(__('Invalid parameters'));
        }
        $ret = $this->auth->login($account, $password);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 注销登录
     */
    public function logout()
    {
        $this->auth->logout();
        $this->success(__('Logout successful'));
    }


    /**
     * 重置密码
     *
     * @param string $email      邮箱
     * @param string $newpassword 新密码
     * @param string $captcha     验证码
     */
    public function resetpwd()
    {
        $email = $this->request->request("email");
        $newpassword = $this->request->request("newpassword");
        $captcha = $this->request->request("captcha");
        if (!$newpassword || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::is($email, "email")) {
            $this->error(__('Email is incorrect'));
        }
        $user = \app\common\model\User::getByEmail($email);
        if (!$user) {
            $this->error(__('User not found'));
        }
        $ret = Ems::check($email, $captcha, 'resetpwd');
        if (!$ret) {
            $this->error(__('Captcha is incorrect'));
        }
        Ems::flush($email, 'resetpwd');
        //模拟一次登录
        $this->auth->direct($user->id);
        $ret = $this->auth->changepwd($newpassword, '', true);
        if ($ret) {
            $this->success(__('Reset password successful'));
        } else {
            $this->error($this->auth->getError());
        }
    }
}
