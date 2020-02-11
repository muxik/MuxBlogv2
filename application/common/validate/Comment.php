<?php

namespace app\common\validate;


use think\Validate;

class Comment extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'article_id' => 'require',
        'member_id' => 'require',
        'content' => 'require'
    ];

    public function SceneComment()
    {
        return $this->only(['article', 'member_id', 'content']);
    }
}
