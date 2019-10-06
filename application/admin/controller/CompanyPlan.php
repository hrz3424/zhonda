<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
use app\admin\model\Company;
use app\admin\model\video\Video;
use app\admin\model\article\Article;
/**
 * 平台学习计划管理
 *
 * @icon fa fa-circle-o
 */
class CompanyPlan extends Backend
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
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->where('status','1')
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->where('status','1')
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }


    /**
     * 详情
     */
    public function detail($ids)
    {
        $row = $this->model->get(['id' => $ids]);
        $companys=$this->model
            ->field('p.*')
            ->alias('p')
            ->join('plan_company pc','pc.plan_id = p.id')
            ->join('company c','c.id = pc.company_id')
            ->column('c.name');
        $companys = implode(",", $companys);
        //dump($companys);
        $videos=$this->model
            ->field('p.*')
            ->alias('p')
            ->join('plan_video pv','pv.plan_id = p.id')
            ->join('video_detail v','v.id = pv.videodetail_id')
            ->column('v.name');
        //dump($videos);
        $examinations=$this->model
            ->field('p.*')
            ->alias('p')
            ->join('plan_examination pe','pe.plan_id = p.id')
            ->join('examination e','e.id = pe.examination_id')
            ->column('e.name');
        //dump($examinations);
        $notices=$this->model
            ->field('p.*')
            ->alias('p')
            ->join('plan_notice pn','pn.plan_id = p.id')
            ->join('notice n','n.id = pn.notice_id')
            ->column('n.title');
        //dump($notices);
        $articles=$this->model
            ->field('p.*')
            ->alias('p')
            ->join('plan_article pa','pa.plan_id = p.id')
            ->join('article_detail ad','ad.id = pa.articledetail_id')
            ->column('ad.title');
        //dump($articles);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        $this->view->assign("companys", $companys);
        $this->view->assign("videos", $videos);
        $this->view->assign("examinations", $examinations);
        $this->view->assign("notices", $notices);
        $this->view->assign("articles", $articles);
        return $this->view->fetch();
    }



}
