# MuxBlogv2

**项目时间： `2019.12.27 - 2020.2.11`**

**项目名称: `MuxBlogv2`**

**项目环境:**

- PHP： 7.4
- Apache: 2.4
- OS: manjaro18

## 如何使用

---

- **下载项目文件**

  - **`$git clone https://github.com/muxik/MuxBlogv2.git`**

- **导入数据库文件**

  - **`mysql> source tp_blog.sql ;`**

- **数据数据库配置**
  - **`/config/database.php`**

## 公共函数

---

- **`mailto()`**

  **path: `apploaction/common.php`**

```php

    /**
      * mailto()
      * 发送邮件函数    strToArray

      * @return Array
      * function mailto(
          * $to,
          * $title,
          * $content,
          * $username,
          * $password
      * ) { }
      * @param String $to — 收件人
      * @param String $title — 邮件标题
      * @param String $content — 邮件内容
      * @param String $username — 发件人邮箱帐号
      * @param String $password — 发件人邮箱密码
      * @return String — Error Info
      */
```

- **`replace()`**

```php
    /**
     * replace($data)
        * 分页操作把span标签替换成a标签

        * function replace($data) { }
        * @param String $data
        * @return String
    */
```

- **`strToArray()`**

```php
    /**
      * strToArray

      * 把字符串转换成数组 文章标签

      * function strToArray($data) { }
      * @param String $data — 字符串

      * @return Array
      */
```

- **`urlReplace()`**

```php
    /**
      * urlReplace

      * 首页url替换

      * function urlReplace($url) { }
      * @param String $url — 要转换的url地址

      * @return String
      */
```
