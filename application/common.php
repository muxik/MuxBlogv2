<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


/**
 * 发送邮件函数
 * @param String $to 收件人
 * @param String $title 邮件标题
 * @param String $content 邮件内容
 * @param String $username 发件人邮箱帐号
 * @param String $password 发件人邮箱密码
 * @return String Error Info 
 */
function mailto($to, $title, $content, $username, $password)
{
    $mail = new PHPMailer(true);

    try {
        //Server settings
        $mail->SMTPDebug = SMTP::DEBUG_OFF;                      // Enable verbose debug output
        $mail->isSMTP();                                            // Send using SMTP
        $mail->Host       = 'smtp.163.com';                    // Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = $username;                     // SMTP username
        $mail->Password   = $password;                               // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
        $mail->Port       = 465;                                    // TCP port to connect to

        $mail->CharSet = 'utf-8';
        //Recipients
        $mail->setFrom('muxi_k_ing@163.com', 'Muxi_k');
        $mail->addAddress($to);     // Add a recipient

        // Content
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = $title;
        $mail->Body    = $content;
        $mail->AltBody = $content;

        return $mail->send();
    } catch (Exception $e) {
        exception($mail->ErrorInfo, 1001);
    }
}

/**
 * 分页操作把span标签替换成a标签
 * @param String $data
 * @return String
 */
function replace($data)
{
    return str_replace('span', 'a', $data);
}

/**
 * 把字符串转换成数组 文章标签
 * @param String $data 字符串
 * @return Array
 */
function strToArray($data)
{
    return explode('|', $data);
}


/**
 * 首页url替换
 * @param String $url 要转换的url地址
 * @return String
 */
function urlReplace($url)
{
    if (!strpos($url, 'index.php')) {
        return 'index.php' . $url;
    } else {
        return $url;
    }
}