<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\Driver;
use think\Db;
use app\admin\model\Message;
/**
 * 消息接口
 */
class Messages extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/messages/index/)
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570885302",
    "data": {
    "total": 1,
    "per_page": 20,
    "current_page": 1,
    "last_page": 1,
    "data": [
    {
    "id": 8,
    "name": "阿里巴巴",
    "content": "您还剩一个视频任务未完成，请于9月15日之前完成。",
    "createtime": 1570445600
    }
    ]
    }
    })
     */
    public function index($page = null,$company_id = null,$q=null)
    {
        $drivers = Driver::where('company_id', $company_id)->column('id');
        $data = Db::name('message')
            ->field('id,name,content,createtime')
            ->distinct(true)
            ->where('typedata','1')
            ->where('msgtable_id','in',$drivers)
            ->where('msgtable_type','Driver')
            ->whereOr("typedata = '0' and msgtable_id = $company_id and msgtable_type= 'Company' ")
            ->paginate(20,$page);

        $this->success('', $data);
    }

    /**
     * 新增消息
     * @ApiMethod   (POST)
     * @ApiRoute    (api/messages/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="driver_ids", type="integer", required=true, description="驾驶员IDs")
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
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
    public function add($company_id = null,$driver_ids = [])
    {
        $ids = Driver::where('company_id',$company_id)
            ->where('id','in',$driver_ids)
            ->field('id,name')->select();
        $result = false;
        foreach($ids as $key => $value){
            $message = new Message($_POST);
            $message->name = $value['name'];
            $message->msgtable_id = $value['id'];
            $message->msgtable_type = 'Driver';
            $message->typedata = '1';
            $message->objectdata = '1';
            $result = $message->allowField(true)->save();
        }
        if($result){
            $this->success('保存成功');
        }else{
            $this->error('保存失败');
        }

    }

    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/messages/del/id/{id})
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
        $result = Message::where('id', $id)->delete();
        if ($result){
            $this->success('删除成功');
        }
        else{
            $this->error('删除失败');
        }

    }
}
