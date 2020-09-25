<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../../css/public.css" media="all" />
</head>
<body class="loginBody">
 <form class="layui-form">
    <div class="login_face"><img src="../../images/face.jpg" class="userAvatar"></div>
    <div class="layui-form-item input-item">
        <label for="userName">用户名</label>
        <input type="text" name="su_name" placeholder="请输入用户名" autocomplete="off" id="userName" class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input type="password" name="su_login_passwd" placeholder="请输入密码" autocomplete="off" id="password" class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item" id="imgCode">
        <label for="code">验证码</label>
        <input type="text" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
        <img src="../../images/code.jpg">
    </div>
    <div class="layui-form-item">
        <!--<button type="submit" class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>-->
        <input type="submit" class="layui-btn layui-block"  lay-submit="" lay-filter="login"  value="登陆" />
    </div>
    <%--<br>--%>
    <div class="layui-form-item">
        <!--<button type="submit" class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>-->
        <a href="register.jsp"><input type="button" class="layui-btn layui-block" value="注册" /></a>
    </div>
    <div class="layui-form-item layui-row">
        <a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
    </div>
</form>

<script type="text/javascript" src="../../resources/layui/layui.js"></script>
<script type="text/javascript" src="../../js/login/login.js"></script>
</body>
<script type="text/javascript">
    layui.use(['layer','form','jquery'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            // alert("test");
            $.post('${pageContext.request.contextPath}/loginServlet',data.field,function (res) {
                // alert(res);
                if (!res){
                    layer.alert("用户名或者密码错误");
                    return false;
                }else{
                    location.href="${pageContext.request.contextPath}/index.jsp";
                }
            });
            return false;
        });
    });

</script>
</html>
