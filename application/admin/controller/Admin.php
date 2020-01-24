<?php

namespace app\admin\controller;

use think\Controller;

class Admin extends Base
{
    //管理员列表
    public function list()
    {
        $admins = model('admin')->order('is_super', 'asc')->paginate(5);
        $viewData = [
            'admins' => $admins
        ];
        $this->assign($viewData);
        return view();
    }

    // 管理员添加
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

    public function status()
    {
        $data = [
            'id' => input('post.id'),
            'status' => input('post.status') ? 0 : 1
        ];
        $adminInfo = model('Admin')->find($data['id']);
        $adminInfo->status = $data['status'];

        $result = $adminInfo->save();
        if ($result) {
            $this->success('操作成功！', 'admin/admin/list');
        } else {
            $this->error('操作失败');
        }
    }
}