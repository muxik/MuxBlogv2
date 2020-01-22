<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// use think\console\command\optimize\Route;


Route::group('admin', function () {
    // Login and register route
    Route::rule('/', 'admin/index/login', 'get|post');
    Route::rule('register', 'admin/index/register', 'get|post');
    Route::rule('forget', 'admin/index/forget', 'get|post');
    Route::rule('reset', 'admin/index/reset', 'post');
    Route::rule('loginout', 'admin/home/loginout', 'post');

    // Home page route
    Route::rule('index', 'admin/home/index', 'get');

    // Cate route
    Route::rule('cate-list', 'admin/cate/list', 'get');
    Route::rule('cate-add', 'admin/cate/add', 'get|post');
    Route::rule('cate-sort', 'admin/cate/sort', 'post');
    Route::rule('cate-edit/[:id]', 'admin/cate/edit', 'get|post');
    Route::rule('cate-del', 'admin/cate/del', 'post');

    // Article route
    Route::rule('article-list', 'admin/article/list', 'get');
    Route::rule('article-add', 'admin/article/add', 'get|post');
    Route::rule('article-top', 'admin/article/top', 'post');
    Route::rule('article-edit/[:id]', 'admin/article/edit', 'get|post');
    Route::rule('article-del', 'admin/article/del', 'post');

    //Member route
    Route::rule('member-add', 'admin/member/add', 'get|post');
    Route::rule('member-list', 'admin/member/list', 'get');
    Route::rule('member-del', 'admin/member/del', 'post');
});


Route::rule('/', 'admin/index/demo', 'get|post');