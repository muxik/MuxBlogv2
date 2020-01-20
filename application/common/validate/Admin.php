<?php

namespace app\common\validate;

use think\Validate;

class Admin extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'username|管理员帐户' => 'require',
        'password|密码' => 'require',
        'conpass|确认密码' => 'require|confirm:password',
        'email|邮箱' => 'require|email|unique:admin',
        'code|验证码' => 'require'
    ];

    /**
     * 登录验证场景
     */
    public function sceneLogin()
    {
        return $this->only(['username', 'password']);
    }

    /**
     * 注册场景验证
     */
    public function sceneRegister()
    {
        return $this->only(['username', 'password', 'conpass', 'email'])->append('username', 'unique:admin');
    }

    /**
     * 重置密码验证场景
     */
    public function sceneReset()
    {
        return $this->only(['code', 'password']);
    }
}
