<?php

namespace app\common\model;

use app\common\validate\Admin as ValidateAdmin;
use think\Model;
use think\model\concern\SoftDelete;

class Admin extends Model
{
    //软删除
    use SoftDelete;

    //只读字段
    protected $readonly = ['email'];

    //登录校验
    public function login($data)
    {
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('login')->check($data)) {
            return $validate->getError();
        }

        $result = $this->where($data)->find();
        if ($result) {
            //验证登录状态
            if ($result['status'] != 1) {
                return '此帐号被禁用';
            }

            //保存session
            $sessionData = [
                'id' => $result['id'],
                'nickname' => $result['nickname'],
                'is_super' => $result['is_super']
            ];
            session('admin', $sessionData);

            //返回1代表登录成功
            return 1;
        } else {
            return '帐号或者密码错误';
        }
    }

    //注册用户
    public function register($data)
    {
        //验证器
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('register')->check($data)) {
            return $validate->getError();
        }
        //添加数据
        $result = $this->allowField(true)->save($data);
        if ($result) {
            mailto($data['email'], '注册管理员帐户成功', '<h1>亲爱的' . $data['username'] . '恭喜您成为本站会员！</h1><br><a href="http://www.tpblog.com/index.php?">点击链接进行验证</a>');
            return 1;
        } else {
            return '注册失败';
        }
    }

    public function reset($data)
    {
        $sessionData = session('code');
        $adminInfo = model('Admin')->where('email', $data['email'])->find();

        // 返回验证器结果
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('reset')->check($data)) {
            return $validate->getError();
        }

        if ($data['code'] != $sessionData) {
            return '验证码不正确！';
        }


        $password = $data['password'];
        $adminInfo->password = $password;
        $result = $adminInfo->save();

        if ($result) {
            return 1;
        } else {
            return '重置密码失败！';
        }
    }


    public function add($data)
    {
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        }

        $result = $this->allowField(true)->save($data);
        if ($result) {
            return 1;
        } else {
            return '添加失败';
        }
    }
}