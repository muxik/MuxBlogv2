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

// Front-end
Route::rule('cate/:id', 'index/index/index', 'get');
Route::group('/', function () {
    Route::rule('/', 'index/index/index', 'get');
    Route::rule('article-<id>', 'index/article/info', 'get');
    Route::rule('register', 'index/index/register', 'get|post');
    Route::rule('login', 'index/index/login', 'get|post');
    Route::rule('login_out', 'index/index/login_out', 'post');
});

// Back-end
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

    // Member route
    Route::rule('member-list', 'admin/member/list', 'get');
    Route::rule('member-add', 'admin/member/add', 'get|post');
    Route::rule('member-del', 'admin/member/del', 'post');
    Route::rule('member-edit/[:id]', 'admin/member/edit', 'get|post');

    // Admin route
    Route::rule('admin-list', 'admin/admin/list', 'get');
    Route::rule('admin-add', 'admin/admin/add', 'get|post');
    Route::rule('admin-edit', 'admin/admin/edit', 'get|post');
    Route::rule('admin-del', 'admin/admin/del', 'post');
    Route::rule('admin-status', 'admin/admin/status', 'post');

    // Commemt Route
    Route::rule('commemt-list', 'admin/comment/list', 'get');
    ROute::rule('commemt-del', 'admin/comment/del', 'post');

    // system settings Route
    Route::rule('system-set', 'admin/system/set', 'get|post');
});