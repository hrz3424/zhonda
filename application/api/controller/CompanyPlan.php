<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\plan\Plan;
use think\Db;
/**
 * 公司学习计划接口
 */
class CompanyPlan extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];


    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/company_plan/index/)
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570708230",
    "data": {
    "total": 1,
    "per_page": 20,
    "current_page": 1,
    "last_page": 1,
    "data": [
    {
    "id": 6,
    "typedata": "1",
    "name": "2019年驾校考试科目三",
    "startdate": "2019-10-10",
    "enddate": "2019-10-17",
    "status": "0",
    "objectdata": "0",
    "plan_id": 4,
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
            ->where('pc.typedata','1')
            ->where('p.name LIKE "%'.$q.'%"')
            ->paginate(20,$page);

        $this->success('', $data);
    }

    /**
     * 新增公司计划
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="typedata", type="Enum", required=true, description="类型:0=日常培训,1=岗前培训")
     * @ApiParams   (name="objectdata", type="Enum", required=true, description="对象:0=全体驾驶员,1=车队,2=驾驶员")
     * @ApiParams   (name="name", type="string", required=true, description="名称")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="车队IDs")
     * @ApiParams   (name="fleet_ids", type="Array", required=true, description="驾驶员IDs")
     * @ApiParams   (name="startdate", type="date", required=true, description="开始日期")
     * @ApiParams   (name="enddate", type="date", required=true, description="结束日期")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "保存成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function add($company_id = null,$objectdata=null,$driver_ids=[],$fleet_ids=[])
    {
        $plan = new Plan($_POST);
        $plan->status = '1';
        $result = $plan->allowField(true)->save();
        $id = $plan->id;
        if($result){
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
            $this->success('保存成功');
        }else{
            $this->error('保存失败');
        }

    }

    /**
     * 编辑公司计划
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="typedata", type="Enum", required=true, description="类型:0=日常培训,1=岗前培训")
     * @ApiParams   (name="objectdata", type="Enum", required=true, description="对象:0=全体驾驶员,1=车队,2=驾驶员")
     * @ApiParams   (name="name", type="string", required=true, description="名称")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="车队IDs")
     * @ApiParams   (name="fleet_ids", type="Array", required=true, description="驾驶员IDs")
     * @ApiParams   (name="startdate", type="date", required=true, description="开始日期")
     * @ApiParams   (name="enddate", type="date", required=true, description="结束日期")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "保存成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function edit($id =null ,$company_id = null,$objectdata=null,$driver_ids=[],$fleet_ids=[])
    {
        $plan = new Plan($_POST);
        $plan->status = '1';
        $result = $plan->allowField(true)->save($_POST,['id' => $id]);;
        $id = $plan->id;
        if($result){
            switch ($objectdata)
            {
                case '0':
                    Db::table('plan_driver')->where('plan_id',$id)->delete();
                    $drivers = Db::name('driver')->where('company_id',$company_id)->select();
                    foreach($drivers as $key => $value) {
                        Db::name('plan_driver')->insert(['plan_id' => $id, 'driver_id' => $value['id']]);
                    }
                    break;
                case '1':
                    Db::table('plan_driver')->where('plan_id',$id)->delete();
                    foreach($driver_ids as $item) {
                        Db::name('plan_driver')->insert(['plan_id' => $id, 'driver_id' => $item]);
                    }
                    break;
                case '2':
                    Db::table('plan_fleet')->where('plan_id',$id)->delete();
                    foreach($fleet_ids as $item) {
                        Db::name('plan_fleet')->insert(['plan_id' => $id, 'fleet_id' => $item]);
                    }
                    break;
            }
            $this->success('修改成功');
        }else{
            $this->error('修改失败');
        }

    }

    /**
     * 公司计划--添加视频
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/video/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="video_ids", type="Array", required=true, description="视频IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function video($id =null ,$video_ids=[])
    {
        foreach($video_ids as $item){
            Db::name('plan_video')->insert(['plan_id' => $id,'videodetail_id' => $item]);
        }
        $this->success('添加成功');
    }

    /**
     * 公司计划--编辑视频
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/video_edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="type", type="integer", required=true, description="获取关联ids=0,修改保存=1")
     * @ApiParams   (name="video_ids", type="Array", required=true, description="视频IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function video_edit($id =null ,$video_ids=[],$type=null)
    {
        switch ($type) {
            case 0:
                $data= Db::name('plan_video')->where('plan_id',$id)->column('videodetail_id');
                $this->success('', $data);
                break;
            case 1:
                Db::name('plan_video')->where('plan_id',$id)->delete();
                foreach($video_ids as $item){
                    Db::name('plan_video')->insert(['plan_id' => $id,'videodetail_id' => $item]);
                }
                $this->success('修改成功');
                break;
        }
    }

    /**
     * 公司计划--添加试卷
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/examination/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="examination_ids", type="Array", required=true, description="试卷IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function examination($id =null ,$examination_ids=[])
    {
        foreach($examination_ids as $item){
            Db::name('plan_examination')->insert(['plan_id' => $id,'examination_id' => $item]);
        }
        $this->success('添加成功');
    }

    /**
     * 公司计划--编辑试卷
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/examination_edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="type", type="integer", required=true, description="获取关联ids=0,修改保存=1")
     * @ApiParams   (name="examination_ids", type="Array", required=true, description="试卷IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function examination_edit($id =null ,$examination_ids=[],$type=null)
    {
        switch ($type) {
            case 0:
                $data= Db::name('plan_examination')->where('plan_id',$id)->column('examination_id');
                $this->success('', $data);
                break;
            case 1:
                Db::name('plan_examination')->where('plan_id',$id)->delete();
                foreach($examination_ids as $item){
                    Db::name('plan_examination')->insert(['plan_id' => $id,'examination_id' => $item]);
                }
                $this->success('修改成功');
                break;
        }
    }

    /**
     * 公司计划--添加公告
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/notice/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="notice_ids", type="Array", required=true, description="公告IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function notice($id =null ,$notice_ids=[])
    {
        foreach($notice_ids as $item){
            Db::name('plan_notice')->insert(['plan_id' => $id,'notice_id' => $item]);
        }
        $this->success('添加成功');

    }

    /**
     * 公司计划--编辑公告
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/notice_edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="type", type="integer", required=true, description="获取关联ids=0,修改保存=1")
     * @ApiParams   (name="notice_ids", type="Array", required=true, description="公告IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function notice_edit($id =null ,$notice_ids=[],$type=null)
    {
        switch ($type) {
            case 0:
                $data= Db::name('plan_notice')->where('plan_id',$id)->column('notice_id');
                $this->success('', $data);
                break;
            case 1:
                Db::name('plan_notice')->where('plan_id',$id)->delete();
                foreach($notice_ids as $item){
                    Db::name('plan_notice')->insert(['plan_id' => $id,'notice_id' => $item]);
                }
                $this->success('修改成功');
                break;
        }
    }

    /**
     * 公司计划--添加文章
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/article/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="article_ids", type="Array", required=true, description="文章IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function article($id =null ,$article_ids=[])
    {
        foreach($article_ids as $item){
            Db::name('plan_article')->insert(['plan_id' => $id,'articledetail_id' => $item]);
        }
        $this->success('添加成功');

    }

    /**
     * 公司计划--编辑公告
     * @ApiMethod   (POST)
     * @ApiRoute    (api/company_plan/article_edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="type", type="integer", required=true, description="获取关联ids=0,修改保存=1")
     * @ApiParams   (name="article_ids", type="Array", required=true, description="公告IDs")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function article_edit($id =null ,$article_ids=[],$type=null)
    {
        switch ($type) {
            case 0:
                $data= Db::name('plan_article')->where('plan_id',$id)->column('articledetail_id');
                $this->success('', $data);
                break;
            case 1:
                Db::name('plan_article')->where('plan_id',$id)->delete();
                foreach($article_ids as $item){
                    Db::name('plan_article')->insert(['plan_id' => $id,'articledetail_id' => $item]);
                }
                $this->success('修改成功');
                break;
        }
    }


    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/company_plan/del/id/{id})
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
