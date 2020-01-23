<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
    public function initialize()
    {
        if (session('?admin.id')) {
            $this->redirect('admin/home/index');
        }
    }

    // 登录方法
    public function login()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password')
            ];
            $result = model('Admin')->login($data);
            if ($result == 1) {

                $this->success('登录成功', 'admin/home/index');
            } else {
                $this->error($result);
            }
        }

        return view();
    }

    // 注册方法
    public function register()
    {

        if (request()->isPost()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass'  => input('post.conpass'),
                'nickname' => input('post.nickname'),
                'email'    => input('post.email')
            ];

            $result = model('Admin')->register($data);
            if ($result == 1) {
                $this->success('注册成功', 'admin/index/login');
            } else {
                $this->error($result);
            }
        }
        return view();
    }

    //忘记密码 发送验证码
    public function forget()
    {
        // 验证邮箱是否存在

        if (request()->isAjax()) {
            if (!Db::name('admin')->where('email', input('post.email'))->find()) {
                $this->error('邮箱不存在');
            }

            $email = input('post.email');
            $code = mt_rand(1000, 9999);
            session('code', $code);

            $result = mailto($email, '重置密码验证码', '重置密码的验证码是：' . $code);
            if ($result) {
                $this->success('验证码发送成功！');
            } else {
                $this->error('验证码发送失败！');
            }
        }

        return view();
    }

    public function reset()
    {
        $code = input('post.code');
        $email = input('post.email');
        $padsword = input('post.password');

        $data = [
            'code' => $code,
            'email' => $email,
            'password' => $padsword
        ];
        // $result = model('Admin')->reset($data);
        $result = model('Admin')->reset($data);


        if ($result == 1) {
            session('code', null);
            $this->success('重置密码成功！', 'admin/index/login');
        } else {
            // $result->getError();
            $this->error($result);
        }
    }

    public function demo()
    {
        // $result['id'] = 1;
        // $result['nickname'] = 'muxi_k';
        // $result['is_super'] = 0;

        // $sessionData = [
        //     'id' => $result['id'],
        //     'nickname' => $result['nickname'],
        //     'is_super' => $result['is_super']
        // ];
        // session('admin', $sessionData);
        // session(null);
        $vd = [
            'username' => 'muxi_k',
            'code' => md5('muxi_k')
        ];

        session('user', $vd);
        // return json(session('user'));

        return session('code');
    }
}