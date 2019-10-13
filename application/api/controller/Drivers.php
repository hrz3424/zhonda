<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\Driver;
use think\Db;
/**
 * 驾驶员接口
 */
class Drivers extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/drivers/index/)
     * @ApiParams   (name="fleet_id", type="string", required=true, description="车队ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570699256",
    "data": {
    "total": 2,
    "per_page": 20,
    "current_page": 1,
    "last_page": 1,
    "data": [
    {
    "id": 3,
    "avatar": "/uploads/20191008/6d88f0620a49c79f5d8e5dba134373e3.jpeg",
    "name": "陈道明",
    "idcard": "342401199007189234",
    "nvq": "12345678",
    "carnum": "皖B8888",
    "phone": "18712398268",
    "typedata": "0",
    "status": "0",
    "company_id": 4
    },
    {
    "id": 4,
    "avatar": "/uploads/20191008/6d88f0620a49c79f5d8e5dba134373e3.jpeg",
    "name": "张倩",
    "idcard": "342401198906239765",
    "nvq": "12345678",
    "carnum": "粤B3838",
    "phone": "13295573487",
    "typedata": "0",
    "status": "0",
    "company_id": 4
    }
    ]
    }
    })
     */
    public function index($page = null,$fleet_id = null,$q=null)
    {
        if($fleet_id){
            $data = Db::name('driver')
                ->where('fleet_id',$fleet_id)
                ->where('name LIKE "%'.$q.'%" or phone LIKE "%'.$q.'%" or carnum LIKE "%'.$q.'%" or nvq LIKE "%'.$q.'%"')
                ->paginate(20,$page);
        }else{
            $data = Db::name('driver')
                ->where('name LIKE "%'.$q.'%" or phone LIKE "%'.$q.'%" or carnum LIKE "%'.$q.'%" or nvq LIKE "%'.$q.'%"')
                ->paginate(20,$page);
        }

        $this->success('', $data);
    }

    /**
     * 新增驾驶员
     * @ApiMethod   (POST)
     * @ApiRoute    (api/drivers/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="avatar", type="string", required=true, description="头像")
     * @ApiParams   (name="name", type="string", required=true, description="姓名")
     * @ApiParams   (name="idcard", type="string", required=true, description="身份证号码")
     * @ApiParams   (name="nvq", type="string", required=true, description="资格证号")
     * @ApiParams   (name="carnum", type="string", required=true, description="车牌号")
     * @ApiParams   (name="phone", type="string", required=true, description="手机号")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
        "code": 1,
        "msg": "保存成功",
        "time": "1570532811",
        "data": null
        })
     */
    public function add()
    {
        $driver = new Driver($_POST);
        $result = $driver->allowField(true)->save();
        if($result){
            $this->success('保存成功');
        }else{
            $this->error('保存失败');
        }

    }

    /**
     * 修改驾驶员
     * @ApiMethod   (POST)
     * @ApiRoute    (api/drivers/edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiParams   (name="avatar", type="string", required=true, description="头像")
     * @ApiParams   (name="name", type="string", required=true, description="姓名")
     * @ApiParams   (name="idcard", type="string", required=true, description="身份证号码")
     * @ApiParams   (name="nvq", type="string", required=true, description="资格证号")
     * @ApiParams   (name="carnum", type="string", required=true, description="车牌号")
     * @ApiParams   (name="phone", type="string", required=true, description="手机号")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "修改成功",
    "time": "1570533577",
    "data": null
    })
     */
    public function edit($id = null)
    {
        $driver = new Driver();
        $result = $driver->allowField(true)->save($_POST,['id' => $id]);
        if($result){
            $this->success('修改成功');
        }else{
            $this->error('修改失败');
        }

    }

    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/drivers/del/id/{id})
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
        $result = Driver::where('id', $id)->delete();
        if ($result){
            $this->success('删除成功');
        }
        else{
            $this->error('删除失败');
        }

    }
}
