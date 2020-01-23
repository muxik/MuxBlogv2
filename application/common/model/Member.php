<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Member extends Model
{
    // 软删除
    use SoftDelete;

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
            return '注册失败';
        }
    }
}