<?php

namespace app\admin\controller;


class Member extends Base
{
    // 会员列表
    public function list()
    {
    }

    // 添加会员
    public function add()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'nickname' => input('post.nickname'),
                'email'    => input('post.email')
            ];

            $result = model('Member')->add($data);
            if ($result == 1) {
                $this->success('添加成功', 'admin/member/list');
            } else {
                $this->error($result);
            }
        }
        return view();
    }

    //
}