<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>部门信息管理</title>
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
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-sm" lay-event="batchDeleteUser">批量删除</button>
            </div>
        </div>
    </div>


    <div id="userBar" style="display: none;">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delUser">删除</a>
    </div>

    <!-- 数据表格结束 -->

    <!-- 修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv" lay-filter="saveOrUpdateDiv">
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm">
            <input type="hidden" name="dept_id">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">上级机构ID</label>
                    <div class="layui-input-inline">
                        <select name="dept_parent_id" id="dept_parent_id" lay-verify="required" lay-search="">
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
                            lay-submit="" lay-filter="editDept">提交
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
            elem: '#test7'
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
        });

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
            url: "${pageContext.request.contextPath}/DeptController/findAllDept",
            // url: "../../json/user/dept.json",//获取菜单json地址
            <%--url: '/userInfoServlet?method=${param.method}&user_id=${param.user_id}&name=${param.name}&dept_name=${param.dept_name}&user_level=${param.user_level}',--%>
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
                    field: 'dept_id',
                    title: '机构编号',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'dept_parent_id',
                    title: '上级机构ID',
                    // edit: true,
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'dept_name',
                    title: '机构名称',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'dept_order',
                    title: '机构排序',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'dept_flag',
                    title: '是否启用',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'dept_addr',
                    title: '机构地址',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'dept_contact',
                    title: '机构联系人',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'dept_phone',
                    title: '机构联系电话',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'dept_desc',
                    title: '机构简介',
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
        var index;
        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'addUser':
                    openAddUser();
                    break;
                case 'batchDeleteUser':
                    deleteBatch();
                    break;
            }
            ;
        });

        //批量删除
        function deleteBatch() {
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
                    idStr = idStr + "idStr=" + value.dept_id + "&";
                });
                idStr = idStr.substring(0, idStr.length - 1);

                $.post("${pageContext.request.contextPath}/DeptController/deleteBatchDept", idStr, function (res) {
                    if (res) {
                        layer.msg("批量删除成功！");
                    } else {
                        layer.msg("删除失败！");
                    }
                    tableIns.reload();
                });
                return false;
            });

        }

        function openAddUser() {
            // mainIndex = layer.open({
            // 	type: 1, //页面层
            // 	title: '添加用户',
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
                    $.get("${pageContext.request.contextPath}/DeptController/delDept?deptid=" + data.dept_id, function (res) {
                        if (res) {
                            layer.msg("删除成功！");
                        } else {
                            layer.msg("删除失败！");
                        }
                        layer.close(index);
                    });
                    tableIns.reload();
                    return false;
                });
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
                $("select option[value='" + data.dept_parent_id + "']").attr("selected", "selected");  //如果值一样 就选中对应的option,
            }
        });

        //打开添加窗口 弹层
        var url;
        var mainIndex;

        //打开编辑窗口 弹层
        function openUpdateUser(data) {
            // console.log(data);
            //	alert(data);
            mainIndex = layer.open({
                type: 1,
                title: '修改用户',
                offset: '0px',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", JSON.parse(JSON.stringify(data)));
                }
            });
        };

        form.on('submit(editDept)', function (data) {
            $.get("${pageContext.request.contextPath}/DeptController/editDept", data.field, function (res) {
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


    });
</script>
</body>
</html>
