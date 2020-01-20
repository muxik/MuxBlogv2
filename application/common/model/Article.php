<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Article extends Model
{
    //软删除
    use SoftDelete;

    // 添加文章
    public function add($data)
    {
        //验证器
        $validate = new \app\common\validate\Article();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        }
        //添加数据
        $result = $this->allowField(true)->save($data);
        if ($result) {
            return 1;
        } else {
            return '文章添加失败';
        }
    }


    public function top($data)
    {
        $validate = new \app\common\validate\Article();
        if (!$validate->scene('top')->check($data)) {
            return $validate->getError();
        }

        $articleInfo = $this->find($data['id']);
        $articleInfo->is_top = $data['is_top'];
        $result = $articleInfo->save();
        if ($result) {
            return 1;
        } else {
            return '操作失败';
        }
    }
}