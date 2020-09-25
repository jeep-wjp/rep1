<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8">
    <title>工时信息管理</title>
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
<div class="rt_content">
    <form  class="layui-form" >
            <div class="layui-inline">
                <label class="layui-form-label">工时录入时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="pui_input_dt1_start" id="pui_input_dt1_start" class="layui-input test1"  placeholder="请输入开始时间">
                </div>
                <div class="layui-input-inline">至</div>
                <div class="layui-input-inline">
                    <input type="text" name="pui_input_dt2_end" id="pui_input_dt2_end" class="layui-input test1" placeholder="请输入结束时间">
                </div>
            </div>

            <div class="layui-inline">
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn layui-btn-warm layui-btn-sm layui-icon "
                            id="doSearch">搜索
                    </button>
                </div>
            </div>
    </form>

    <!-- 数据表格开始 -->
    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>

    <div style="display: none;" id="userToolBar">
    </div>
    <div id="userBar" style="display: none;">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改工时</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delUser">删除</a>
    </div>

    <!-- 数据表格结束 -->

    <!-- 修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv" lay-filter="saveOrUpdateDiv">
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm">
            <input type="hidden" name="id" >
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">项目ID</label>
                    <div class="layui-input-inline">
                        <select name="pui_pi_id" id="pui_pi_id" lay-verify="required" lay-search="">
                            <option value="">项目ID</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">工时数</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pui_work_hour" lay-verify=""    autocomplete="off" placeholder="" class="layui-input">
                    </div>
                </div>
            </div>
<%--            <div class="layui-form-item">--%>
<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">工时录入时间</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="pui_input_dt" class="layui-input test1" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="layui-form-item" style="text-align: center;">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                            lay-submit="" lay-filter="submitBtn">提交
                    </button>
                    <input type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
                           value="重置">
                </div>
            </div>
        </form>

    </div>
    <!-- 修改的弹出层结束 -->
</div>

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

        //绑定时间选择器
        $(".test1").each(function () {

            laydate.render({
                elem: this
                ,type: 'datetime'
                ,trigger: 'click' // 新增这一行以解决
            });
        });
        //
        // laydate.render({
        //     elem: '#pui_input_dt2_end'
        //     ,type: 'datetime',
        //     trigger: 'click', // 新增这一行以解决
        // });
        // laydate.render({
        //     elem: '#pui_input_dt1_start'
        //     ,type: 'datetime',
        //     trigger: 'click', // 新增这一行以解决
        // });


        $("#doSearch").click(function () {
            var pui_input_dt1_start = $("#pui_input_dt1_start").val();
            var pui_input_dt2_end = $("#pui_input_dt2_end").val();
            tableIns.reload({
                where: {//设定异步数据接口的额外参数
                    "pui_input_dt1_start": pui_input_dt1_start,
                    "pui_input_dt2_end": pui_input_dt2_end
                }
            });
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

        //渲染数据表格
        var tableIns = table.render({
            elem: '#userTable',
            url:"${pageContext.request.contextPath}/WorkhourController/findAllWorkhour",
            // url : "../../json/user/time.json",//获取菜单json地址
            <%--url: '/userInfoServlet?method=${param.method}&user_id=${param.user_id}&name=${param.name}&dept_name=${param.dept_name}&user_level=${param.user_level}',--%>
            toolbar: '#userToolBar',
            cellMinWidth: 150, //全局定义常规单元格的最小宽度
            page: true,
            totalRow: true,
            even: true, //开启隔行背景
            height: 450,
            limits: [2, 4, 6, 10],
            cols: [
                [{
                    type: 'checkbox',
                    fixed: 'left'
                }, {
                    field: 'id',
                    title: 'ID',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'pui_pi_id',
                    title: '项目ID',
                    // edit: true,
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'pui_su_id',
                    title: '用户ID',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'pui_work_hour',
                    title: '工时数',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'pui_input_dt',
                    title: '工时录入时间',
                    // edit: true,
                    align: 'center'
                }, {
                    fixed: 'right',
                    title: '操作',
                    toolbar: '#userBar',
                    align: 'center',
                    width:150
                }
                ]
            ]
        });
        var index;
        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'addUser':
                    openAddUser();
                    break;
                case 'batchDeleteUser':
                    //批量删除
                    //获取选中状态
                    var checkStatus = table.checkStatus('userTable');
                    //获取选中数量
                    var selectCount = checkStatus.data.length;
                    var data = checkStatus.data;

                    if (selectCount == 0) {
                        layer.msg('批量删除至少选中一项数据', function () {
                        });
                        return false;
                    }
                    // alert(selectCount);
                    layer.confirm('真的要删除选中的项吗？', {icon: 1, title: '提示'}, function (index) {
                        // index = layer.load(1, {shade: [0.1,'#fff']});
                        // var idStr=[];
                        var idStr = "";
                        data.forEach(function (value) {
                            idStr = idStr + "idStr=" + value.user_id + "&";
                        })
                        // for(var i=0; i<selectCount; i++){
                        //     idStr.push(data[i].user_id);
                        // }
                        // console.log(idStr);
                        window.location.href = "${pageContext.request.contextPath}/userInfoServlet?method=deleteMoreUser&" + idStr;
                        // layer.table.reload("userTable");
                        <%--$.ajax({--%>
                        <%--type:'post',--%>
                        <%--data:{"idStr":idStr},--%>
                        <%--url:'${base}/testDel/delAll.htm',--%>
                        <%--success:function(data){--%>
                        <%--if(data.code==0){--%>
                        <%--$('#seach').click();--%>
                        <%--}--%>
                        <%--layer.close(index);--%>
                        <%--layer.msg(data.msg);--%>
                        <%--},error:function(code){--%>
                        <%--parent.layer.msg('操作失败!',{icon: 5,time:1000});--%>
                        <%--}--%>
                        <%--});--%>

                    });
                    break;
            }
            ;
        });

        function openAddUser() {
            // mainIndex = layer.open({
            // 	type: 1, //页面层
            // 	title: '添加日志',
            // 	content: layui.jquery("#saveOrUpdateDiv"),
            // 	area: ['800px', '500px'],
            // });
            window.location.href = "sys_user_add.jsp";
        }

        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'delUser') { //删除
                // layer.msg("删除");
                layer.confirm('确定删除吗？', {icon: 1, title: '提示'}, function (index) {
                    layer.close(index);
                   delUser(data);

                });
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
            }
        });

        //打开添加窗口 弹层
        var url;
        var mainIndex;

        function delUser(data) {
            $.get('${pageContext.request.contextPath}/WorkhourController/deleteWorkhour?id='+data.id,function (res) {
                if (res){
                    layer.msg("删除成功！");
                    tableIns.reload();
                }else {
                    layer.close("删除失败！");
                }
            });

        }
        //打开编辑窗口 弹层
        function openUpdateUser(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改工时',
                offset: '0px',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", JSON.parse(JSON.stringify(data)));
                    form.on('submit(submitBtn)',function (data1) {
                        data1.field.id=data.id;
                        $.get('${pageContext.request.contextPath}/WorkhourController/updateWorkhour',data1.field,function (res) {
                            layer.close(mainIndex);
                            if (res){
                                layer.msg("修改成功！");
                                tableIns.reload();
                            }else {
                                layer.msg("修改失败！");
                            }
                        });
                        return false;

                    })
                }
            });

        };


    });
</script>
</body>
</html>
