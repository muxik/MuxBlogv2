<?php

namespace app\common\model;

use think\Model;

class System extends Model
{
    // 网站设置
    public function set($data)
    {
        $validate = new \app\common\validate\System();
        if (!$validate->check($data)) {
            return $validate->getError();
        }

        $systemInfo = $this->find();
        $systemInfo->webname = $data['webname'];
        $systemInfo->copyright = $data['copyright'];
        $result =  $systemInfo->save();
        if ($result) {
            return 1;
        } else {
            return '修改失败';
        }
    }
}