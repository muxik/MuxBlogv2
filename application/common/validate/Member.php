<?php

namespace app\common\validate;

use think\Validate;

class Member extends Validate
{
    protected $rule = [
        'username|管理员帐户' => 'require',
        'password|密码' => 'require',
        'email|邮箱' => 'require|email|unique:member',
        'code|验证码' => 'require'
    ];

    /**
     * 添加场景验证
     */
    public function sceneAdd()
    {
        return $this->only(['username', 'password', 'email'])->append('username', 'unique:member');
    }
}