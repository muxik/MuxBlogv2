<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Member extends Model
{
    // 软删除
    use SoftDelete;

    // 只读字段
    protected $readonly = ['username', 'email'];

    // 添加会员
    public function add($data)
    {
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        }
        //添加数据
        $result = $this->allowField(true)->save($data);
        if ($result) {
            return 1;
        } else {
            return '添加失败';
        }
    }

    // 关联评论
    public function comments()
    {
        return $this->hsaMany('Comment', 'member_id', 'id');
    }

    public function edit($data)
    {
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('edit')->check($data)) {
            return $validate->getError();
        }

        $memberInfo = $this->find($data['id']);
        $memberInfo->nickname = $data['nickname'];
        $memberInfo->password = $data['password'];
        $result = $memberInfo->save();

        if ($result) {
            return 1;
        } else {
            return '修改失败';
        }
    }
}
