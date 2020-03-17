<?php

namespace app\index\controller;

class Article extends Base
{
    // 文章详情页
    public function info()
    {
        $articleInfo = model('Article')->with('comments,comments.member')->find(input('id'));
        $articleInfo->setInc('click');

        $viewData = [
            'articleInfo' => $articleInfo
        ];

        $this->assign($viewData);
        return view();
    }

    // 文章评论
    public function comment()
    {
        if (request()->isAjax()) {
            if (!session('?index.id')) {
                $this->error('你还没有登录！！');
            }
            $data = [
                'article_id' => input('post.article_id'),
                'member_id' => input('post.member_id'),
                'content' => input('post.content')
            ];
            $result = model('Comment')->comment($data);
            if ($result) {
                $this->success('评论成功！', 'null');
            } else {
                $this->error($result);
            }
        }
    }

    public function add()
    {
        if (request()->isAjax()) {
            $data = [
                'title' => input('post.title'),
                'tags' => input('post.tags'),
                'is_top' => 0, /* 默认不推荐 */
                'cate_id' => input('post.cate_id'),
                'desc' => input('post.desc'),
                'content' => input('post.content'),
                'author' => session('index.nickname')
            ];
            $result = model('Article')->add($data);
            if ($result == 1) {
                $this->success('文章添加成功', '/');
            } else {
                $this->error($result);
            }
        }
        $cates = model('Cate')->select();
        $viewData = ['cates' => $cates];
        $this->assign($viewData);
        return view();
    }
}