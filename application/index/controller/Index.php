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
}