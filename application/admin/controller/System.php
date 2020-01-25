<?php

namespace app\admin\controller;

class System extends Base
{
    public function set()
    {
        if (request()->isAjax()) {
            $data = [
                'id' => input('post.id'),
                'webname' => input('post.webname'),
                'copyright' => input('post.copyright')
            ];
            $reslut = model('System')->set($data);
            if ($reslut == 1) {
                $this->success('修改成功', 'admin/system/set');
            } else {
                $this->error($reslut);
                // return json($data);
            }
        }
        $systemInfo = model('System')->find();
        $viewData = [
            'systemInfo' => $systemInfo
        ];
        $this->assign($viewData);
        return view();
    }
}