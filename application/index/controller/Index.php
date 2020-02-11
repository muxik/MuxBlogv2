<?php

namespace app\index\controller;

class Index extends Base
{
    public function index()
    {
        $where = [];
        $catename = null;
        if (input('?id')) {
            $where = [
                'cate_id' => input('id')
            ];
            // 通过id 查询栏目下的内容
            $catename = model('Cate')->where('id', input('id'))->value('catename');
        }

        // 模板赋值
        $articles = model('Article')->where($where)->order('create_time',  'desc')->paginate(5);
        $viewData = [
            'articles' => $articles,
            'catename' => $catename
        ];
        $this->assign($viewData);
        return view();
    }

    public function register()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),
                'nickname' => input('post.nickname'),
                'email' => input('post.email'),
                'verify' => input('post.verify')
            ];
            $res = model('Member')->register($data);
            if ($res == 1) {
                $this->success('注册成功！', 'index/index/login');
            } else {
                $this->error($res);
            }
        }
        return view();
    }

    // 登录方法
    public function login()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'verify' => input('post.verify')
            ];
            $result = model('Member')->login($data);
            if ($result == 1) {
                $this->success('登录成功', 'index/index/index');
            } else {
                $this->error($result);
            }
        }
        return view();
    }

    // 退出登录
    public function login_out()
    {
        session(null);
        if (session('?index.id')) {
            $this->error('退出失败，请重试');
        } else {
            $this->success('退出成功！', 'index/index/index');
        }
    }

    // 文章搜索 
    public function search()
    {
        $where[] = [
            'title', 'like', '%' . input('keyword') . '%'
        ];
        $catename = input('keyword');
        $articles = model('Article')->where($where)->order('create_time', 'desc')->paginate(7);
        $viewData = ['articles' => $articles, 'catename' => $catename];
        $this->assign($viewData);

        return view('index');
    }
}