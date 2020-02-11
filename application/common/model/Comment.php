<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Comment extends Model
{
    // 软删除
    use SoftDelete;

    // 关联文章
    public function article()
    {
        return $this->belongsTo('Article', 'article_id', 'id');
    }

    // 关联用户
    public function member()
    {
        return $this->belongsTo('Member', 'member_id', 'id');
    }

    // 文章评论
    public function comment($data)
    {
        $validate = new \app\common\validate\Comment();

        if (!$validate->scene('comment')->check($data)) {
            return $this->getError();
        }

        $res = $this->allowField(true)->save($data);

        // 添加评论数
        $comm_num = model('Article')->where('id', $data['article_id'])->find();
        $comm_num->comm_num += 1;
        $comm_res = $comm_num->save();
        if ($res && $comm_res) {
            return 1;
        } else {
            return '评论失败！';
        }
    }
}
