<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\Driver;
use app\admin\model\Fleet;
use think\Db;
/**
 * 车队接口
 */
class Fleets extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];


    /**
     * 列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/fleets/index/)
     * @ApiParams   (name="company_id", type="string", required=true, description="公司ID")
     * @ApiParams   (name="q", type="string", required=true, description="keyword")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function index($page = null,$q=null,$company_id = null)
    {
        $data = Db::name('fleet')
            ->where('company_id',$company_id)
            ->where('name LIKE "%'.$q.'%"')
            ->paginate(20,$page);

        $this->success('', $data);
    }


    /**
     * 车队成员列表
     * @ApiMethod   (GET)
     * @ApiRoute    (api/fleets/member/)
     * @ApiParams   (name="fleet_id", type="string", required=true, description="车队ID")
     * @ApiParams   (name="page", type="string", required=true, description="页数")
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function member($page = null,$q=null ,$fleet_id= null)
    {
        $data = Db::name('fleet')
            ->alias('f')
            ->join('fleet_driver fd','fd.fleet_id = f.id')
            ->where('f.id',$fleet_id)
            ->join('driver d','d.id = fd.driver_id')
            ->where('f.name LIKE "%'.$q.'%"')
            ->field('d.name,d.phone,d.carnum')
            ->paginate(20,$page);
        $this->success('', $data);
    }


    /**
     * 新增车队
     * @ApiMethod   (POST)
     * @ApiRoute    (api/fleets/add/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="company_id", type="integer", required=true, description="公司ID")
     * @ApiParams   (name="name", type="string", required=true, description="车队名称")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="驾驶员ID")
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
        $drivers = Db::name('driver')->where('id','in',$this->request->param('driver_ids'))->select();
        $fleet = new Fleet($_POST);
        $fleet->num = $drivers->count();
        $result = $fleet->allowField(true)->save();
        $fleet_id = $fleet->id;
        if($result){
            foreach($drivers as $key => $value){
                Db::name('fleet_driver')->insert(['fleet_id' => $fleet_id,'driver_id' => $value['id']]);
            }
            $this->success('保存成功');
        }else{
            $this->error('保存失败');
        }

    }

    /**
     * 修改车队
     * @ApiMethod   (POST)
     * @ApiRoute    (api/fleets/edit/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="name", type="string", required=true, description="车队名称")
     * @ApiParams   (name="id", type="integer", required=true, description="车队ID")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="驾驶员ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "保存成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function edit($id = null)
    {
        $fleet = new Fleet();
        $drivers = Db::name('driver')->where('id','in',$this->request->param('driver_ids'))->select();
        $fleet->num = $drivers->count();
        $result = $fleet->allowField(true)->save($_POST,['id' => $id]);
        if($result){
            Db::table('fleet_driver')->where('fleet_id',$id)->delete();
            foreach($drivers as $key => $value){
                Db::name('fleet_driver')->insert(['fleet_id' => $id,'driver_id' => $value['id']]);
            }
            $this->success('修改成功');
        }else{
            $this->error('修改失败');
        }

    }

    /**
     * 设置车队长
     * @ApiMethod   (POST)
     * @ApiRoute    (api/fleets/set_fleeter/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="fleeter", type="Array", required=true, description="车队长")
     * @ApiParams   (name="id", type="integer", required=true, description="车队ID")
     * @ApiParams   (name="driver_ids", type="Array", required=true, description="车队长ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "保存成功",
    "time": "1570532811",
    "data": null
    })
     */
    public function set_fleeter($id = null)
    {
        $fleet = new Fleet();
        $result = $fleet->allowField(true)->save($_POST,['id' => $id]);
        if($result){
            $this->success('修改成功');
        }else{
            $this->error('修改失败');
        }

    }

    /**
     * 删除
     * @ApiMethod   (delete)
     * @ApiRoute    (api/fleets/del/id/{id})
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ()
     */
    public function del($id=null)
    {
        $result = Fleet::where('id', $id)->delete();
        if ($result){
            Db::table('fleet_driver')->where('fleet_id',$id)->delete();
            $this->success('删除成功');
        }
        else{
            $this->error('删除失败');
        }

    }
}
