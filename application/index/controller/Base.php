<?php

namespace app\index\controller;

use think\Controller;


/**
 * @author muxi_k
 */
class Base extends Controller
{
    //使用共享视图
    public function initialize()
    {
        $cates = model('Cate')->order('sort', 'asc')->select();
        $webInfo = model('System')->find();
        $topArticle = model('Article')->where('is_top', 1)->order('create_time', 'desc')->limit(10)->select();
        $viewData = [
            'cates' => $cates,
            'webInfo' => $webInfo,
            'topArticle' => $topArticle
        ];
        $this->view->share($viewData);
    }
}
