<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
use app\admin\model\Company;
/**
 * 消息管理
 *
 * @icon fa fa-circle-o
 */
class Message extends Backend
{

    /**
     * Message模型对象
     * @var \app\admin\model\Message
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Message;
        $this->view->assign("objectdataList", $this->model->getObjectdataList());
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                if($params['objectdata'] == '0'){
                    $companyids = explode(",", $params['companyids']);
                    $where['id'] = ['in', $companyids];
                    $companys = Db::name('company')->where($where)->select();
                    //dump($companys);
                    unset($params['companyids']);
                    foreach ($companys as $company) {
                        $params['name'] = $company['name'];
                        $params['msgtable_id'] = $company['id'];
                        $params['msgtable_type'] = 'Company';
                        $message = new \app\admin\model\Message();
                        $message->allowField(true)->save($params);
                    }
                    $this->success();
                }
                else {
                    $driverids = explode(",", $params['driverids']);
                    $where['id'] = ['in', $driverids];
                    $drivers = Db::name('driver')->where($where)->select();
                    //dump($companys);
                    unset($params['driverids']);
                    foreach ($drivers as $driver) {
                        $params['name'] = $driver['name'];
                        $params['msgtable_id'] = $driver['id'];
                        $params['msgtable_type'] = 'Driver';
                        $message = new \app\admin\model\Message();
                        $message->allowField(true)->save($params);
                    }
                    $this->success();
                }
            }
            else {
                $this->error(__('Parameter %s can not be empty', ''));
            }
        }
        return $this->view->fetch();
    }


}
