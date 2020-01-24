<?php

namespace app\common\validate;

use think\Validate;

class Member extends Validate
{
    protected $rule = [
        'username|会员帐户' => 'require',
        'password|密码' => 'require',
        'email|邮箱' => 'require|email|unique:member',
        'nickname|昵称' => 'require'
    ];

    /**
     * 添加场景验证
     */
    public function sceneAdd()
    {
        return $this->only(['username', 'password', 'email'])->append('username', 'unique:member');
    }

    // 修改验证场景 
    public function sceneEdit()
    {
        return $this->only(['nickname', 'password']);
    }
}