<?php

namespace app\admin\controller\article;

use app\common\controller\Backend;
use think\Db;
use app\admin\model\question\Question;
use app\admin\model\question\QuestionDetail;
/**
 * 文章管理
 *
 * @icon fa fa-circle-o
 */
class ArticleDetail extends Backend
{

    /**
     * Article_detail模型对象
     * @var \app\admin\model\article\Article_detail
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\article\ArticleDetail;

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
        $article_id = $this->request->param('article_id');
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            if($article_id){
                $total = $this->model
                    ->with(['article'])
                    ->where($where)
                    ->Where('article_id',$article_id)
                    ->order($sort, $order)
                    ->count();

                $list = $this->model
                    ->with(['article'])
                    ->where($where)
                    ->Where('article_id',$article_id)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();
            }else{
                $total = $this->model
                    ->with(['article'])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

                $list = $this->model
                    ->with(['article'])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            }


            foreach ($list as $row) {


            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
    /**
     * 编辑
     */
    public function question($ids = null)
    {
        $row = $this->model->get($ids);
        //var_dump($row->id);
        $data= Db::name('article_question')->where('articledetail_id',$row->id)->column('questiondetail_id');
        //var_dump($data);
        $row['questionids']  = implode(',',$data);
        $questions = Question::all();
        $this->assign('questions', $questions);
        //var_dump($data);
        $row['single'] = 0;
        $row['multi'] = 0;
        $tmpdata = QuestionDetail::all($data);
        foreach($tmpdata as $item){
            if($item->typedata == '0'){
                $row['single'] = $row['single'] + 1;
            }
            else{
                $row['multi'] =   $row['multi'] + 1;
            }
        }
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
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $row->validateFailException(true)->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);
                    //$id = $this->model->getLastInsID();
                    //dump($ids);
                    Db::name('article_question')->where('articledetail_id',$ids)->delete();
                    $questionids = explode(",",   $params['questionids']);
                    foreach($questionids as $item){
                        //dump($item);
                        Db::name('article_question')->insert(['articledetail_id' => $ids,'questiondetail_id' => $item]);
                    }
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $row = $this->model->get(['id' => $ids]);
        $single=Db::name('question_detail')
            ->field('qd.*')
            ->alias('qd')
            ->join('article_question aq','aq.questiondetail_id = qd.id')
            ->where('aq.articledetail_id',$row->id)
            ->where('qd.typedata','0')
            ->select();
        //dump($single);
        $multi=Db::name('question_detail')
            ->field('qd.*')
            ->alias('qd')
            ->join('article_question aq','aq.questiondetail_id = qd.id')
            ->where('aq.articledetail_id',$row->id)
            ->where('qd.typedata','1')
            ->select();
        //dump($multi);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        $this->view->assign("single", $single);
        $this->view->assign("multi", $multi);
        return $this->view->fetch();
    }
}
