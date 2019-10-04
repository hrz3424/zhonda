<?php

namespace app\admin\controller\plan;

use app\common\controller\Backend;
use think\Db;
use app\admin\model\Company;
use app\admin\model\video\Video;
/**
 * 平台学习计划管理
 *
 * @icon fa fa-circle-o
 */
class Plan extends Backend
{

    /**
     * Plan模型对象
     * @var \app\admin\model\plan\Plan
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\plan\Plan;
        $this->view->assign("typedataList", $this->model->getTypedataList());
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 公司
     */
    public function company($ids = null)
    {
        $row = $this->model->get($ids);
        $data= Db::table('fa_plan_company')->where('plan_id',$row->id)->column('company_id');
        //dump($data);
        $companys = null;
        if($data){
            $companys = Company::all($data);
        }
        $this->assign('companys', $companys);
        $row['companyids']  = implode(',',$data);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                Db::table('fa_plan_company')->where('plan_id',$ids)->delete();
                $companyids = explode(",",   $params['companyids']);
                foreach($companyids as $item){
                    //dump($item);
                    Db::table('fa_plan_company')->insert(['plan_id' => $ids,'company_id' => $item]);
                }
                Db::commit();
                $this->success();
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }


    /**
     * 视频
     */
    public function video($ids = null)
    {
        $row = $this->model->get($ids);
        $data= Db::table('fa_plan_video')->where('plan_id',$row->id)->column('videodetail_id');
        $row['videoids']  = implode(',',$data);
        $videos = Video::all();
        $this->assign('videos', $videos);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                Db::table('fa_plan_video')->where('videodetail_id',$ids)->delete();
                $videoids = explode(",",   $params['videoids']);
                foreach($videoids as $item){
                    //dump($item);
                    Db::table('fa_plan_video')->insert(['plan_id' => $ids,'videodetail_id' => $item]);
                }
                Db::commit();
                $this->success();
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

}
