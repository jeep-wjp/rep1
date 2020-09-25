<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>添加员工</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="../../resources/layui/css/layui.css" media="all"/>
        <link rel="stylesheet" href="../../css/public.css" media="all"/>

    </head>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;" lay-filter="dataFrm" action="${pageContext.request.contextPath}/UserController/addUser"
      method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户图像</label>
            <div class="layui-upload-drag" id="test10">
                <i class="layui-icon"></i>
                <p>点击上传，或将文件拖拽到此处</p>
                <!-- 隐藏的input,一个隐藏的input（用于保存文件url） -->
                <div class="layui-hide">
                    <input type="hidden" id="su_icon" name="su_icon"/>
                </div>
                <%--                预览区域--%>
                <div class="layui-hide" id="uploadDemoView">
                    <hr>
                    <img src="" alt="上传成功后渲染" style="max-width: 196px">
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="su_name" lay-verify="" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户性别</label>
            <div class="layui-input-block">
                <input type="radio" name="su_sex" value="-1" title="未知" checked="">
                <input type="radio" name="su_sex" value="0" title="男">
                <input type="radio" name="su_sex" value="1" title="女">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户系统登录名</label>
            <div class="layui-input-inline">
                <input type="text" name="su_login_name" lay-verify=""  autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户系统登录密码</label>
            <div class="layui-input-inline">
                <input type="text" name="su_login_passwd" lay-verify=""  autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-inline">
                <label class="layui-form-label">用户生日</label>
                <div class="layui-input-inline">
                    <input type="text" name="su_birth_dt" id="date" lay-verify="date" placeholder="yyyy-MM-dd"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户详细地址</label>
            <div class="layui-input-inline">
                <input type="text" name="su_address" lay-verify=""  autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户所在省份</label>
            <div class="layui-input-inline">
                <select name="su_province" id="su_province" lay-filter="su_province">
                    <option value="">-请选择省-</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户所在城市</label>
            <div class="layui-input-inline">
                <select name="su_city" id="su_city" lay-filter="su_city">
                    <option value="">-请选择市-</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户所在地区</label>
            <div class="layui-input-inline">
                <select name="su_district" id="su_district" lay-filter="su_district">
                    <option value="">-请选择地区--</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户所属部门ID</label>
            <div class="layui-input-inline">
                <select name="su_dept_id" lay-verify="required" lay-search="" id="su_dept_id">
                    <option value="">-用户所属部门ID-</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户电子邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="su_email" lay-verify="" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户状态</label>
            <div class="layui-input-inline">
                <select name="su_status" lay-verify="" lay-search="">
                    <option value="">用户状态</option>
                    <option value="1">1</option>
                    <option value="0">0</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户电话号码</label>
            <div class="layui-input-inline">
                <input type="text" name="su_mobile" lay-verify="" autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">用户信息创建者ID</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="su_create_uid" lay-verify="" lay-search="" id="su_create_uid">--%>
<%--                    <option value="">用户信息创建者ID</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">用户信息创建时间</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="su_create_dt" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--            </div>--%>
<%--        </div>--%>



    </div>

    <div class="layui-form-item" style="margin-top: 30px;margin-left: 20px;">
        <div class="layui-input-block">
            <button type="submit" id="addUser"
                    class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                    lay-submit="" lay-filter="">提交
            </button>
            <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../resources/layui/layui.js"></script>

<script>
    layui.use(['form', 'layedit', 'laydate', 'layer', 'upload', 'jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate,
            $ = layui.jquery,
            upload = layui.upload;

        //日期
        laydate.render({
            elem: '#date',
            trigger: 'click', // 新增这一行以解决v
        });
        //日期时间选择器
        laydate.render({
            elem: '#test5'
            , type: 'datetime',
            value: new Date(),
            min: minDate(),
            trigger: 'click', // 新增这一行以解决
        });

        // 设置最小可选的日期
        function minDate() {
            var now = new Date();
            return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
        }

        //拖拽上传
        upload.render({
            elem: '#test10'
            , url: '${pageContext.request.contextPath}/UserController/upload' //改成您自己的上传接口
            // ,auto:false
            // ,bindAction:"#addUser"
            , done: function (res) {
                // layer.msg('上传成功');
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.data.src);
                console.log(res);
                if (res.code != 0) {
                    // alert("上传失败！");
                    return layer.msg('上传失败');
                }
                // alert("上传成功"+res.data.src);
                layui.$('#su_icon').attr('value', res.data.src);
                return layer.msg("上传成功");
            }
        });

        //动态获取角色下拉框
        $(function () {
            //获取所有的部门id
            $.get("${pageContext.request.contextPath}/DeptController/findAllDeptID", {}, function (res) {
                if (res == "加载数据异常") {
                    alert(res);
                    return;
                }
                $.each(res, function (index, value) {
                    var id1 = value.dept_id;
                    var su_dept_id = document.getElementById("su_dept_id");
                    var opt = new Option(id1, id1);
                    su_dept_id.options[index + 1] = opt;
                });
                form.render('select');
            });
        });

        //获取所有的用户id
        <%--$(function () {--%>
        <%--    $.get("${pageContext.request.contextPath}/UserController/findAllUserId", {}, function (res) {--%>
        <%--        if (res == "加载数据异常") {--%>
        <%--            alert(res);--%>
        <%--            return;--%>
        <%--        }--%>
        <%--        $.each(res, function (index, value) {--%>
        <%--            var id1 = value.id;--%>
        <%--            var su_create_uid = document.getElementById("su_create_uid");--%>
        <%--            var opt = new Option(id1, id1);--%>
        <%--            su_create_uid.options[index + 1] = opt;--%>
        <%--        });--%>
        <%--        form.render('select');--%>
        <%--    });--%>


        <%--});--%>

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '至少得5个字符';
                }
            },
            pass: [
                /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格'
            ],
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

    });
</script>
<script type="text/javascript" src="../../js/area.js"></script>
<script type="text/javascript" src="../../js/province.js"></script>
</body>
</html>
