<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\plan\Plan;
use think\Db;
/**
 * 平台学习计划接口
 */
class Plans extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];


    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/plans/index/)
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570970666",
    "data": {
    "total": 1,
    "per_page": 20,
    "current_page": 1,
    "last_page": 1,
    "data": [
    {
    "id": 4,
    "typedata": "0",
    "name": "10月平台学习计划",
    "startdate": "2019-10-03",
    "enddate": "2019-10-03",
    "status": "0",
    "objectdata": "0",
    "plan_id": 2,
    "company_id": 4
    }
    ]
    }
    })
     */
    public function index($page = null,$q=null,$company_id = null)
    {
        $data = Db::name('plan')
            ->alias('p')
            ->join('plan_company pc','pc.plan_id = p.id')
            ->where('pc.company_id',$company_id)
            ->where('pc.typedata','0')
            ->where('p.name LIKE "%'.$q.'%"')
            ->paginate(20,$page);

        $this->success('', $data);
    }

    /**
     * 采纳平台计划
     * @ApiMethod   (POST)
     * @ApiRoute    (api/plans/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="objectdata", type="Enum", required=true, description="对象:0=全体驾驶员,1=车队,2=驾驶员")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="车队IDs")
     * @ApiParams   (name="fleet_ids", type="Array", required=true, description="驾驶员IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "保存成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function add($id = null,$company_id= null,$objectdata=null,$driver_ids=[],$fleet_ids=[])
    {
        $plan = Plan::get($id);
        Db::name('plan_company')->update(['status' => '1','typedata' => '1']);
        switch ($objectdata)
        {
            case '0':
                $drivers = Db::name('driver')->where('company_id',$company_id)->select();
                foreach($drivers as $key => $value) {
                    Db::name('plan_driver')->insert(['plan_id' => $id, 'driver_id' => $value['id']]);
                }
                break;
            case '1':
                foreach($driver_ids as $item) {
                    Db::name('plan_driver')->insert(['plan_id' => $id, 'driver_id' => $item]);
                }
                break;
            case '2':
                foreach($fleet_ids as $item) {
                   Db::name('plan_fleet')->insert(['plan_id' => $id, 'fleet_id' => $item]);
                }
                break;
        }
        $this->success('采纳成功');

    }

    /**
     * 详情
     * @ApiMethod   (get)
     * @ApiRoute    (api/plans/show/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ( {
    "code": 1,
    "msg": "",
    "time": "1570972302",
    "data": {
    "plan": {
    "id": 4,
    "typedata": "0",
    "name": "2019年驾校考试科目三",
    "startdate": "2019-10-10",
    "enddate": "2019-10-17",
    "status": "1",
    "objectdata": "0",
    "typedata_text": "日常培训"
    },
    "video": [],
    "examination": [
    {
    "id": 9,
    "typedata": "0",
    "name": "2019驾校考试科目一试卷",
    "startdate": "2019-10-10",
    "enddate": "2019-10-17",
    "status": "1",
    "objectdata": "0",
    "plan_id": 4,
    "examination_id": 9
    }
    ],
    "notice": [],
    "article": []
    }
    })
     */
    public function show($id=null)
    {
        $plan = Plan::get($id);
        $videos=Db::name('plan')
            ->alias('p')
            ->join('plan_video pv','pv.plan_id = p.id')
            ->join('video_detail v','v.id = pv.videodetail_id')
            ->where('p.id',$id)
            ->select();
        //dump($videos);
        $examinations=Db::name('plan')
            ->alias('p')
            ->join('plan_examination pe','pe.plan_id = p.id')
            ->join('examination e','e.id = pe.examination_id')
            ->where('p.id',$id)
            ->select();
        //dump($examinations);
        $notices=Db::name('plan')
            ->alias('p')
            ->join('plan_notice pn','pn.plan_id = p.id')
            ->join('notice n','n.id = pn.notice_id')
            ->where('p.id',$id)
            ->select();
        //dump($notices);
        $articles=Db::name('plan')
            ->alias('p')
            ->join('plan_article pa','pa.plan_id = p.id')
            ->join('article_detail ad','ad.id = pa.articledetail_id')
            ->where('p.id',$id)
            ->select();
        //dump($articles);
        $data = [
            'plan'=> $plan,
            'video' => $videos,
            'examination' => $examinations,
            'notice' => $notices,
            'article' => $articles
        ];
        $this->success('',$data);
    }


    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/plan/del/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "删除成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function del($id=null)
    {
        $result = Plan::where('id', $id)->delete();
        if ($result){
            $this->success('删除成功');
        }
        else{
            $this->error('删除失败');
        }

    }
}
