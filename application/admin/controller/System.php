<?php

namespace app\admin\controller;

class System extends Base
{
    public function set()
    {
        if (request()->isAjax()) {
            $data = [
                'webname' => input('post.webname'),
                'copyright' => input('post.copyright')
            ];
            $reslut = model('System')->set($data);
            if ($reslut) {
                $this->success('修改成功', 'admin/system/set');
            } else {
                $this->error($reslut);
            }
        }
        return view();
    }
}