<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>工时添加</title>
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
                <select name="pui_pi_id" id="pui_pi_id" lay-verify="required" lay-search="">
                    <option value="">项目ID</option>
                </select>
            </div>
        </div>
<%--        隐藏域--%>
        <input type="hidden" name="pui_su_id" value="1" >

        <div class="layui-inline">
            <label class="layui-form-label">工时数</label>
            <div class="layui-input-inline">
                <input type="text" name="pui_work_hour" lay-verify="required|number" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">工时录入时间</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text"  readonly="readonly" name="pui_input_dt" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>

    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                    lay-submit="" lay-filter="addWorkhour">提交
            </button>
            <input type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
                   value="重置">
        </div>
    </div>
</form>


<script type="text/javascript" src="../../resources/layui/layui.js"></script>
<script type="text/javascript" src="../../js/user/userInfo.js"></script>
<script type="text/javascript" src="../../js/cacheUserInfo.js"></script>
<script>
    layui.use(['form', 'laydate', 'layedit', 'table', 'laytpl', 'jquery'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var table = layui.table;
        var layedit = layui.layedit;


        //绑定时间选择器
        //日期
        laydate.render({
            elem: '#date',
            trigger: 'click', // 新增这一行以解决
        });
        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'datetime',
            value:new Date(),
            min:minDate(),
            trigger: 'click', // 新增这一行以解决
        });
        // 设置最小可选的日期
        function minDate(){
            var now = new Date();
            return now.getFullYear()+"-" + (now.getMonth()+1) + "-" + now.getDate()+ " "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
        }
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

        form.on('submit(addWorkhour)',function (data) {
            $.get("${pageContext.request.contextPath}/WorkhourController/addWorkhour",data.field,function (res) {
                // alert(res);
                if (res){
                    layer.msg("添加成功！");
                }else {
                    layer.msg("添加失败！");
                }
            });
            // 重置清空表单
            $("#reset").click();
            // $('#userTable')[0].reset();
            form.render();//必须写
            return false;
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
