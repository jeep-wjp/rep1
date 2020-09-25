<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8">
    <title>日志添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../resources/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../css/public.css" media="all"/>
</head>
<body class="childrenBody">
<div>
    ${tip}

</div>
 <form class="layui-form " lay-filter="dataFrm" id="dataFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">项目ID</label>
            <div class="layui-input-inline">
                <select name="pui_pi_id"id="pui_pi_id" lay-verify="required" lay-search="">
                    <option value="">项目ID</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">项目更新时间</label>
            <div class="layui-input-inline">
                <input type="text" name="pui_input_dt" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">项目更新内容</label>
                <div class="layui-input-block">
                    <textarea name="pul_update_contents" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon "
                    lay-submit="" lay-filter="">立即提交
            </button>
            <input type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
                   value="重置">
        </div>
    </div>
</form>


<script type="text/javascript" src="../../resources/layui/layui.js"></script>

j<script type="text/javascript" src="../../js/cacheUserInfo.js"></script>
<script>
    layui.use(['form', 'laydate', 'layedit', 'table', 'laytpl', 'jquery'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var table = layui.table;
        var layedit = layui.layedit;


        //绑定时间选择器
        laydate.render({
            elem: '#test5'
            , type: 'datetime'
            ,value:new Date(),
            trigger: 'click', // 新增这一行以解决
        });


        //动态获取项目id
        $(function () {
            $.get("${pageContext.request.contextPath}/findAllProjectId", {}, function (res) {
                if (res == "加载数据异常") {
                    alert(res);
                    return;
                }
                $.each(res, function (index, value) {
                    var id1 = value.id;
                    var pui_pi_id = document.getElementById("pui_pi_id");
                    var opt = new Option(id1, id1);
                    pui_pi_id.options[index + 1] = opt;
                });
                form.render('select');
            });
        });
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
    });
</script>
</body>
</html>
