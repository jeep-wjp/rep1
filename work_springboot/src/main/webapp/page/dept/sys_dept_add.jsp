<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form class="layui-form " lay-filter="dataFrm" >

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">上级机构ID</label>
            <div class="layui-input-inline">
                <select name="dept_parent_id" id="dept_parent_id" lay-verify="" lay-search="">
                    <option value="">上级机构ID</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">机构名称</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_name" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">机构排序</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_order" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">是否启用</label>
            <div class="layui-input-block">
                <input type="radio" name="dept_flag" value="0" title="启用" checked="">
                <input type="radio" name="dept_flag" value="1" title="禁用">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">机构地址</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_addr" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">机构联系人</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_contact" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">机构联系电话</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_phone" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">机构简介</label>
            <div class="layui-input-inline">
                <input type="text" name="dept_desc" lay-verify="" s autocomplete="off" placeholder=""
                       class="layui-input">
            </div>
        </div>

    </div>


    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                    lay-submit="" lay-filter="addDept">提交
            </button>
            <input type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
                   value="重置">
        </div>
    </div>
</form>


<script type="text/javascript" src="../../resources/layui/layui.js"></script>
<script type="text/javascript" src="../../js/cacheUserInfo.js"></script>
<script>
    layui.use(['form', 'laydate', 'layedit', 'table', 'laytpl', 'jquery'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var table = layui.table;
        var layedit = layui.layedit;

        //页面加载动态获取角色下拉框
        $(function () {
            $.get("${pageContext.request.contextPath}/DeptController/findAllDeptID", {}, function (res) {
                if (res == "加载数据异常") {
                    layer.msg(res);
                    return;
                }
                $.each(res, function (index, value) {
                    // layer.alert(value.role_id);
                    var dept_id = value.dept_id;
                    var dept_parent_id = document.getElementById("dept_parent_id");
                    var opt = new Option(dept_id, dept_id);
                    dept_parent_id.options[index + 1] = opt;
                });
                form.render('select');
            });
        });
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        form.on('submit(addDept)',function (data) {
            $.get("${pageContext.request.contextPath}/DeptController/addDept",data.field,function (res) {
                if (res == "true"){
                    layer.msg("添加成功！");
                }else {
                    alert("添加失败！");
                }
            });
            // 重置清空表单
            // $("#reset").click();
            // $('#userTable')[0].reset();
            // form.render();//必须写
            return false;
        });
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
