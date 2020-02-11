<?php

namespace app\admin\controller;


class Member extends Base
{
    // 会员列表
    public function list()
    {
        $members = model('Member')->order(['id' => 'desc'])->paginate(10);
        $viewData = [
            'members' => $members
        ];
        $this->assign($viewData);

        return view();
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

    // 会员修改
    public function edit()
    {
        if (request()->isAjax()) {
            $data = [
                'id' => input('post.id'),
                'username' => input('post.username'),
                'password' => input('post.password'),
                'nickname' => input('post.nickname'),
                'email'    => input('post.email')
            ];
            $result = model('Member')->edit($data);
            if ($result == 1) {
                $this->success('修改成功', 'admin/member/list');
            } else {
                $this->error($result);
            }
        }

        $memberInfo = model('Member')->find(input('id'));
        $viewData = [
            'memberInfo' => $memberInfo
        ];
        $this->assign($viewData);
        return view();
    }

    // 会员删除
    public function del()
    {
        if (request()->isAjax()) {
            $memberInfo = model('Member')->with('comments')->find(input('post.id'));
            $result = $memberInfo->together('comments')->delete();
            if ($result) {
                $this->success('删除成功', 'admin/member/list');
            } else {
                $this->error('删除失败');
            }
        }
    }
}