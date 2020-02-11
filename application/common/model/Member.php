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
        return $this->hasMany('Comment', 'member_id', 'id');
    }

    // 会员修改
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

    // 前台会员注册
    public function register($data)
    {
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('register')->check($data)) {
            return $validate->getError();
        }

        $res = $this->allowField(true)->save($data);
        if ($res) {
            return 1;
        } else {
            return '注册失败';
        }
    }

    // 前台会员登录
    public function login($data)
    {
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('login')->check($data)) {
            return $validate->getError();
        }
        // 过滤验证码
        unset($data['verify']);

        $result = $this->where($data)->find();
        if ($result) {
            $sessionDate = [
                'id' => $result['id'],
                'nickname' => $result['nickname']
            ];
            session('index', $sessionDate);
            return 1;
        } else {
            return '用户名或者密码错误';
        }
    }
}