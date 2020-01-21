<?php

namespace app\admin\controller;

class Article extends Base
{
    // 文章列表
    public function list()
    {
        $articles = model('Article')->with('cate')->order([
            'is_top' => 'asc',
            'create_time' => 'desc'
        ])->paginate(10);
        $viewData = [
            'articles' => $articles
        ];
        $this->assign($viewData);
        return view();
    }

    // 文章添加
    public function add()
    {
        if (request()->isAjax()) {
            $data = [
                'title' => input('post.title'),
                'tags' => input('post.tags'),
                'is_top' => input('post.is_top', 0),
                'cate_id' => input('post.cate_id'),
                'desc' => input('post.desc'),
                'content' => input('post.content')
            ];
            $result = model('Article')->add($data);
            if ($result == 1) {
                $this->success('文章添加成功', 'admin/article/list');
            } else {
                $this->error($result);
            }
        }
        $cates = model('Cate')->select();
        $viewData = ['cates' => $cates];
        $this->assign($viewData);
        return view();
    }

    public function top()
    {
        $data = [
            'id' => input('post.id'),
            'is_top' => input('post.is_top') ? 0 : 1
        ];

        $result = model('Article')->top($data);

        if ($result == 1) {
            $this->success('操作成功');
        } else {
            $this->error($result);
        }
    }

    public function edit()
    {
        $articleInfo = model('Article')->find(input('id'));
        $cates = model('Cate')->select();
        $viewData = [
            'articleInfo' => $articleInfo,
            'cates' => $cates
        ];
        $this->assign($viewData);
        return view();
    }
}