<?php

namespace app\common\validate;

use think\Validate;

class Article extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'title|文章标题' => 'require',
        'tags|标签' => 'require',
        'cate_id|所属栏目' => 'require',
        'desc|文章概要' => 'require',
        'content|文章内容' => 'require',
        'is_top|推荐' => 'require'
    ];

    // 验证场景
    public function sceneAdd()
    {
        return $this->only(['title', 'tags', 'cate_id', 'desc', 'content']);
    }

    public function sceneTop()
    {
        return $this->only(['is_top']);
    }

    public function sceneEdit()
    {
        return $this->only(['title', 'tags', 'cate_id', 'desc', 'content']);
    }
}