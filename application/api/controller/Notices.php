<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\Driver;
use think\Db;
use app\admin\model\notice\Notice;
/**
 * 公告接口
 */
class Notices extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/notices/index/)
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570874473",
    "data": {
    "total": 1,
    "per_page": 20,
    "current_page": 1,
    "last_page": 1,
    "data": [
    {
    "id": 1,
    "title": "视频管理",
    "ptime": "2019-10-03 19:42:39"
    }
    ]
    }
    })
     */
    public function index($page = null,$company_id = null,$q=null)
    {
        $data = Db::name('notice')
            ->alias('n')
            ->distinct(true)
            ->field('n.id,n.title,n.ptime')
            ->join('notice_driver nd','nd.notice_id = n.id','LEFT')
            ->join('driver d','d.id = nd.driver_id','LEFT')
            ->where('d.company_id',$company_id)
            ->where('n.title LIKE "%'.$q.'%"')
            ->whereOr('n.objecttype','0')
            ->paginate(20,$page);
        $this->success('', $data);
    }

    /**
     * 新增公告
     * @ApiMethod   (POST)
     * @ApiRoute    (api/notices/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="title", type="string", required=true, description="标题")
     * @ApiParams   (name="content", type="text", required=true, description="正文")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
        "code": 1,
        "msg": "保存成功",
        "time": "1570532811",
        "data": null
        })
     */
    public function add($company_id = null)
    {
        $notice = new Notice($_POST);
        $result = $notice->allowField(true)->save();
        $drivers = Driver::where('company_id',$company_id)->select();
        $id = $notice->id;
        if($result){
            foreach($drivers as $key => $value){
                Db::name('notice_driver')->insert(['notice_id' => $id,'driver_id' => $value['id']]);
            }
            $this->success('保存成功');
        }else{
            $this->error('保存失败');
        }

    }

    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/notices/del/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "删除成功",
    "time": "1570533577",
    "data": null
    })
     */
    public function del($id=null)
    {
        $result = Notice::where('id', $id)->delete();
        if ($result){
            $this->success('删除成功');
        }
        else{
            $this->error('删除失败');
        }

    }
}
