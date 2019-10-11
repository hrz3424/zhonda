<?php

namespace app\api\controller;

use app\common\controller\Api;
use fast\Random;
use think\Config;
use app\admin\model\video\Video;
use app\admin\model\video\VideoDetail;
use app\admin\model\article\Article;
use app\admin\model\article\ArticleDetail;
use app\admin\model\examination\Examination;
use app\admin\model\notice\Notice;

/**
 * 公共接口
 */
class Common extends Api
{
    protected $noNeedLogin = ['upload'];
    protected $noNeedRight = '*';

    /**
     * 上传文件
     * @ApiMethod (POST)
     * @param File $file 文件流
     */
    public function upload()
    {
        $file = $this->request->file('file');
        if (empty($file)) {
            $this->error(__('No file upload or server upload limit exceeded'));
        }

        //判断是否已经存在附件
        $sha1 = $file->hash();

        $upload = Config::get('upload');

        preg_match('/(\d+)(\w+)/', $upload['maxsize'], $matches);
        $type = strtolower($matches[2]);
        $typeDict = ['b' => 0, 'k' => 1, 'kb' => 1, 'm' => 2, 'mb' => 2, 'gb' => 3, 'g' => 3];
        $size = (int)$upload['maxsize'] * pow(1024, isset($typeDict[$type]) ? $typeDict[$type] : 0);
        $fileInfo = $file->getInfo();
        $suffix = strtolower(pathinfo($fileInfo['name'], PATHINFO_EXTENSION));
        $suffix = $suffix && preg_match("/^[a-zA-Z0-9]+$/", $suffix) ? $suffix : 'file';

        $mimetypeArr = explode(',', strtolower($upload['mimetype']));
        $typeArr = explode('/', $fileInfo['type']);

        //禁止上传PHP和HTML文件
        if (in_array($fileInfo['type'], ['text/x-php', 'text/html']) || in_array($suffix, ['php', 'html', 'htm'])) {
            $this->error(__('Uploaded file format is limited'));
        }
        //验证文件后缀
        if ($upload['mimetype'] !== '*' &&
            (
                !in_array($suffix, $mimetypeArr)
                || (stripos($typeArr[0] . '/', $upload['mimetype']) !== false && (!in_array($fileInfo['type'], $mimetypeArr) && !in_array($typeArr[0] . '/*', $mimetypeArr)))
            )
        ) {
            $this->error(__('Uploaded file format is limited'));
        }
        //验证是否为图片文件
        $imagewidth = $imageheight = 0;
        if (in_array($fileInfo['type'], ['image/gif', 'image/jpg', 'image/jpeg', 'image/bmp', 'image/png', 'image/webp']) || in_array($suffix, ['gif', 'jpg', 'jpeg', 'bmp', 'png', 'webp'])) {
            $imgInfo = getimagesize($fileInfo['tmp_name']);
            if (!$imgInfo || !isset($imgInfo[0]) || !isset($imgInfo[1])) {
                $this->error(__('Uploaded file is not a valid image'));
            }
            $imagewidth = isset($imgInfo[0]) ? $imgInfo[0] : $imagewidth;
            $imageheight = isset($imgInfo[1]) ? $imgInfo[1] : $imageheight;
        }
        $replaceArr = [
            '{year}'     => date("Y"),
            '{mon}'      => date("m"),
            '{day}'      => date("d"),
            '{hour}'     => date("H"),
            '{min}'      => date("i"),
            '{sec}'      => date("s"),
            '{random}'   => Random::alnum(16),
            '{random32}' => Random::alnum(32),
            '{filename}' => $suffix ? substr($fileInfo['name'], 0, strripos($fileInfo['name'], '.')) : $fileInfo['name'],
            '{suffix}'   => $suffix,
            '{.suffix}'  => $suffix ? '.' . $suffix : '',
            '{filemd5}'  => md5_file($fileInfo['tmp_name']),
        ];
        $savekey = $upload['savekey'];
        $savekey = str_replace(array_keys($replaceArr), array_values($replaceArr), $savekey);

        $uploadDir = substr($savekey, 0, strripos($savekey, '/') + 1);
        $fileName = substr($savekey, strripos($savekey, '/') + 1);
        //
        $splInfo = $file->validate(['size' => $size])->move(ROOT_PATH . '/public' . $uploadDir, $fileName);
        if ($splInfo) {
            $params = array(
                'admin_id'    => 0,
                'user_id'     => (int)$this->auth->id,
                'filesize'    => $fileInfo['size'],
                'imagewidth'  => $imagewidth,
                'imageheight' => $imageheight,
                'imagetype'   => $suffix,
                'imageframes' => 0,
                'mimetype'    => $fileInfo['type'],
                'url'         => $uploadDir . $splInfo->getSaveName(),
                'uploadtime'  => time(),
                'storage'     => 'local',
                'sha1'        => $sha1,
            );
            $attachment = model("attachment");
            $attachment->data(array_filter($params));
            $attachment->save();
            \think\Hook::listen("upload_after", $attachment);
            $this->success(__('Upload successful'), [
                'url' => $uploadDir . $splInfo->getSaveName()
            ]);
        } else {
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }


    /**
     * 视频类目
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/video/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570793560",
    "data": [
    {
    "id": 1,
    "name": "学习视频",
    "num": 10
    },
    {
    "id": 2,
    "name": "阿里巴巴",
    "num": 20
    }
    ]
    })
     */
    public function video()
    {
        $data = Video::all();

        $this->success('', $data);
    }

    /**
     * 视频详情
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/video_detail/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570794536",
    "data": [
    {
    "id": 1,
    "name": "H5视频",
    "url": "url",
    "cover": "/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg",
    "introduce": "介绍",
    "vtime": "03:26:51",
    "video_id": 2
    }
    ]
    })
     */
    public function video_detail($id = null)
    {
        $data = VideoDetail::where('video_id', $id)->select();

        $this->success('', $data);
    }

    /**
     * 试卷
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/examination/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570794679",
    "data": [
    {
    "id": 8,
    "name": "2020驾校考试科目一试卷"
    },
    {
    "id": 9,
    "name": "2019驾校考试科目一试卷"
    }
    ]
    })
     */
    public function examination()
    {
        $data = Examination::all();

        $this->success('', $data);
    }

    /**
     * 公告
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/notice/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570794763",
    "data": [
    {
    "id": 1,
    "title": "视频管理",
    "content": "<p>测试<br></p>",
    "objecttype": "0",
    "ptime": "2019-10-03 19:42:39",
    "views": "",
    "objecttype_text": "公司"
    }
    ]
    })
     */
    public function notice()
    {
        $data = Notice::all();

        $this->success('', $data);
    }


    /**
     * 文章类目
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/article/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570793654",
    "data": [
    {
    "id": 1,
    "name": "中文",
    "num": 10,
    "sort": 1
    },
    {
    "id": 2,
    "name": "阿里巴巴",
    "num": 90,
    "sort": 2
    }
    ]
    })
     */
    public function article()
    {
        $data = Article::all();

        $this->success('', $data);
    }

    /**
     * 文章详情
     * @ApiMethod   (GET)
     * @ApiRoute    (api/common/article_detail/)
     * @ApiHeaders  (name=token, type=string, required=true, description="请求的Token")
     * @ApiParams   (name="id", type="integer", required=true, description="ID")
     * @ApiReturnParams   (name="msg", type="string", required=true, sample="返回成功")
     * @ApiReturnParams   (name="code", type="integer", required=true, sample="0")
     * @ApiReturn   ({
    "code": 1,
    "msg": "",
    "time": "1570794347",
    "data": [
    {
    "id": 2,
    "article_id": 2,
    "title": "2019驾校考试科目四",
    "cover": "/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg",
    "content": "<p><img src=\"/assets/img/qrcode.png\" style=\"width: 50px;\"><br></p>",
    "ptime": "2019-09-30 18:48:24",
    "views": "0"
    }
    ]
    })
     */
    public function article_detail($id=null)
    {
        $data = ArticleDetail::where('article_id', $id)->select();

        $this->success('', $data);
    }
}
