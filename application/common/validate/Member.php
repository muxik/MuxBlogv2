<?php

namespace app\common\validate;

use think\Validate;

class Member extends Validate
{
    protected $rule = [
        'username|会员帐户' => 'require|unique:member',
        'password|密码' => 'require',
        'conpass|确认密码' => 'require|confirm:password',
        'email|邮箱' => 'require|email|unique:member',
        'nickname|昵称' => 'require',
        'verify|验证码' => 'require|captcha'
    ];

    /**
     * 添加场景验证
     */
    public function sceneAdd()
    {
        return $this->only(['username', 'password', 'email'])->append('username', 'unique:member');
    }

    // 注册验证场景
    public function sceneRegister()
    {
        return $this->only(['username', 'password', 'conpass', 'email', 'verify'])->append('username', 'unique:member');
    }

    // 登录验证场景
    public function sceneLogin()
    {
        return $this->only(['username', 'password', 'verify'])->remove('username', 'unique');
    }

    // 修改验证场景 
    public function sceneEdit()
    {
        return $this->only(['nickname', 'password']);
    }
}