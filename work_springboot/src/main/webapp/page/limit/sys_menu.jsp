<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8">
    <title>菜单管理</title>
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
    <!-- 数据表格开始 -->
    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>

    <div style="display: none;" id="userToolBar">
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="addUser" >添加
            </button>
            <%--            <button type="button" class="layui-btn layui-btn-sm" lay-event="batchDeleteUser">批量删除</button>--%>
        </div>
    </div>
    <div id="userBar" style="display: none;">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delUser">删除</a>
    </div>

    <!-- 数据表格结束 -->

    <!-- 修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv" lay-filter="saveOrUpdateDiv">
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm">
            <div class="layui-form-item">
                <input type="hidden" name="id" value="">
                <div class="layui-inline">
                    <label class="layui-form-label">父菜单ID</label>
                    <div class="layui-input-inline">
                        <select name="sm_parent_id" id="sm_parent_id" lay-verify="" lay-search="">
                            <option value="">-父菜单ID-</option>
                            <option value="0">一级菜单</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">菜单名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sm_name" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">菜单URL</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sm_url" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">授权</label>
                    <div class="layui-input-inline">
                        <select name="sm_perms" lay-verify="required" lay-search="">
                            <option value="">项目ID</option>
                            <option value="1">layer</option>
                            <option value="2">form</option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">类型</label>
                    <div class="layui-input-inline">
                        <select name="sm_type" lay-verify="required" lay-search="">
                            <option value="">类型</option>
                            <option value="0">目录</option>
                            <option value="1">菜单</option>
                            <option value="2">按钮</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">菜单图标</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sm_icon" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">排序</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sm_order" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>

<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">创建时间</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="sm_create_dt" class="layui-input" id="test5"--%>
<%--                               placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">创建者ID</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="sm_create_uid" id="sm_create_uid" lay-verify="" autocomplete="off"--%>
<%--                               placeholder=""--%>
<%--                               class="layui-input">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">更新时间</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="sm_update_dt" class="layui-input" id="test6"--%>
<%--                               placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-inline">--%>
<%--                    <label class="layui-form-label">更新者ID</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="sm_update_uid" id="sm_update_uid" value=""/>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>

            <div class="layui-form-item" style="text-align: center;">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                            lay-submit="" lay-filter="submitBtnFilter">提交
                    </button>
                    <input type="reset"  id="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
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
        laydate.render({
            elem: '#test5'
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test6'
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test6'
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test7'
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
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
            // url: "../../json/user/menu.json",//获取菜单json地址
            url: '${pageContext.request.contextPath}/MenuController/findAllMenu',
            toolbar: '#userToolBar',
            cellMinWidth: 150, //全局定义常规单元格的最小宽度
            page: true,
            totalRow: true,
            even: true, //开启隔行背景
            height: 450,
            limits: [2, 10, 20, 30],
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
                    field: 'sm_parent_id',
                    title: '父菜单ID',
                    // edit: true,
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'sm_name',
                    title: '菜单名称',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'sm_url',
                    title: '菜单URL',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'sm_perms',
                    title: '授权',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'sm_type',
                    title: '类型',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'sm_icon',
                    title: '菜单图标',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'sm_order',
                    title: '排序',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'sm_create_dt',
                    title: '创建时间',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'sm_create_uid',
                    title: '创建者ID',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'sm_update_dt',
                    title: '更新时间',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'sm_update_uid',
                    title: '更新者ID',
                    // edit: true,
                    align: 'center'
                }, {
                    fixed: 'right',
                    title: '操作',
                    toolbar: '#userBar',
                    align: 'center',
                    width: 150
                }
                ]
            ]
        });

        //动态获取父菜单id下拉框
        $(function () {
            $.get("${pageContext.request.contextPath}/MenuController/findAllMenu", {}, function (res) {
                if (res!=null) {
                    // alert(res.data);

                    $.each(res.data, function (index, value) {
                        // alert("value.id"+value.id);
                        var su_dept_id = document.getElementById("sm_parent_id");
                        var opt = new Option(value.sm_name, value.id);
                        su_dept_id.options[index + 2] = opt;
                    });
                    form.render('select');
                    return;
                }

            });

        });

        var index;
        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'addUser':
                    openAddUser();
                    break;
                case 'batchDeleteUser':
            }
            ;
        });

        function openAddUser() {
            mainIndex = layer.open({
                type: 1, //页面层
                title: '添加菜单',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                success: function (index) {
                    // 重置清空表单
                    $("#reset").click();
                    // $('#userTable')[0].reset();
                    form.render();//必须写

                    form.on('submit(submitBtnFilter)', function (data) {
                        $.post("${pageContext.request.contextPath}/MenuController/addMenu", data.field, function (res) {
                            layer.close(mainIndex);
                            if (res) {
                                layer.msg("添加成功！");
                            } else {
                                layer.msg("添加失败！");
                            }

                        });
                        layer.close(mainIndex);
                        tableIns.reload();
                        return false;
                    });
                }

            });
        }

        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'delUser') { //删除
                delUser(data);
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
            }
        });

        //单条删除函数
        function delUser(data) {
            // layer.msg("删除");
            // layer.alert(data.id);
            layer.confirm('确定删除吗？', {icon: 1, title: '提示'}, function (index) {

                <%--$.post('${pageContext.request.contextPath}/deleteUser?id=' + data.id, function (res) {--%>
                $.post('${pageContext.request.contextPath}/MenuController/deleteMenu?id=' + data.id, function (res) {
                    layer.close(index);
                    // alert(res);
                    if (res) {
                        layer.msg("删除成功！");
                        tableIns.reload();
                    } else {
                        layer.msg("删除失败！");
                    }
                });
                <%--window.location.href = "${pageContext.request.contextPath}/userInfoServlet?method=deleteUser&user_id=" + data.user_id;--%>
                // obj.del();
                // layer.close(index);
            });
        }

        //打开添加窗口 弹层
        var url;
        var mainIndex;

        //打开编辑窗口 弹层
        function openUpdateUser(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改菜单',
                offset: '0px',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", JSON.parse(JSON.stringify(data)));
                    form.on('submit(submitBtnFilter)', function (data) {
                        $.post("${pageContext.request.contextPath}/MenuController/updateMenu", data.field, function (res) {
                            layer.close(mainIndex);
                            if (res) {
                                layer.msg("修改成功！");
                                tableIns.reload();
                            } else {
                                layer.msg("修改失败！");
                            }

                        });
                        layer.close(mainIndex);
                        tableIns.reload();
                        return false;
                    });
                }
            });
        };
    });
</script>
</body>
</html>
