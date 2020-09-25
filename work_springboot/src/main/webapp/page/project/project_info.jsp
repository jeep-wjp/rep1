<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8">
    <title>项目管理</title>
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
            <button type="button" class="layui-btn layui-btn-sm" lay-event="addUser">新增</button>

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
                <input type="hidden" name="id">
                <div class="layui-inline">
                    <label class="layui-form-label">项目名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_name" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">项目所属单位/部门/公司</label>
                    <div class="layui-input-inline">
                        <select name="pi_department" lay-verify="required" lay-search="">
                            <option value="">项目所属单位/部门/公司</option>
                            <option value="采购部">采购部</option>
                            <option value="销售部">销售部</option>
                            <option value="人事部">人事部</option>
                        </select>
                    </div>
                </div>


            </div>
            <div class="layui-form-item">
                <%--                <div class="layui-inline">--%>
                <%--                    <label class="layui-form-label">项目创建者ID</label>--%>
                <%--                    <div class="layui-input-inline">--%>
                <%--                        <select name="pi_create_uid" lay-verify="" lay-search="" id="pi_create_uid">--%>
                <%--                            <option value="">--项目创建者ID--</option>--%>
                <%--                        </select>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <div class="layui-inline">
                    <label class="layui-form-label">项目创建者ID</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_create_uid" id="pi_create_uid" lay-verify="" class="layui-input"
                               readonly="true">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目创建时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_create_dt" class="layui-input" id="test5"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>


            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">项目计划开始日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_plan_start_dt" class="layui-input" id="test"
                               placeholder="yyyy-MM-dd">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目计划结束日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_plan_end_dt" class="layui-input" id="test1"
                               placeholder="yyyy-MM-dd">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目实际开始日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_real_start_dt" class="layui-input" id="test2"
                               placeholder="yyyy-MM-dd">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目实际结束日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="pi_real_end_dt" class="layui-input" id="test3"
                               placeholder="yyyy-MM-dd">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">项目状态</label>
                    <div class="layui-input-inline">
                        <select name="pi_state" lay-verify="" lay-search="">
                            <option value="">项目状态</option>
                            <option value="0">未开始</option>
                            <option value="1">进行中</option>
                            <option value="2">已完成</option>
                        </select>
                    </div>
                </div>

            </div>


            <div class="layui-form-item" style="text-align: center;">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                            lay-submit="" lay-filter="submitBtnFilter">提交
                    </button>
                    <input type="reset" id="reset"
                           class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh"
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
            elem: '#test',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test1',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test2',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test3',
            trigger: 'click', // 新增这一行以解决
        });
        laydate.render({
            elem: '#test5'
            , type: 'datetime',
            value: new Date(),
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
            // url: "../../json/user/project.json",//获取项目json地址
            url: "/findAllProject",
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
                    field: 'pi_name',
                    title: '项目名称',
                    // edit: true,
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'pi_department',
                    title: '项目所属单位/部门/公司',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'pi_create_uid',
                    title: '项目创建者ID',
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'pi_create_dt',
                    title: '项目创建时间',
                    templet: function (data) {
                        return data.pi_create_dt.substring(0, data.pi_create_dt.length - 2)
                    },
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'pi_plan_start_dt',
                    title: '项目计划开始日期',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'pi_plan_end_dt',
                    title: '项目计划结束日期',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'pi_real_start_dt',
                    title: '项目实际开始日期',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'pi_real_end_dt',
                    title: '项目实际结束日期',
                    // edit: true,
                    align: 'center'
                }, {
                    field: 'pi_state',
                    title: '项目状态',
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

                    });
                    break;
            }
            ;
        });



        var mainIndex;

        //打开添加窗口 弹层
        function openAddUser() {
            mainIndex = layer.open({
                type: 1, //页面层
                title: '添加用户',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                success: function (index) {
                    // 重置清空表单
                    $("#reset").click();
                    form.render();//必须写

                    laydate.render({
                        elem: '#test5'
                        , type: 'datetime',
                        value: new Date(),
                        trigger: 'click', // 新增这一行以解决
                    });

                    // getAllId();
                    form.on('submit(submitBtnFilter)', function (data) {
                        // layer.alert(JSON.stringify(data));
                        $.post('${pageContext.request.contextPath}/addProject', data.field, function (res) {
                            layer.close(mainIndex);
                            if (res == 'true') {
                                layer.msg("添加成功！");
                                tableIns.reload();
                            } else {
                                layer.msg("添加失败！");
                            }
                        });
                        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                    });

                }
            });
        }

        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'delUser') { //删除
                openDelUser(data);
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
            }
        });

        //单条删除函数
        function openDelUser(data) {
            // layer.msg("删除");
            // layer.alert(data.id);
            layer.confirm('确定删除吗？', {icon: 1, title: '提示'}, function (index) {

                $.post('${pageContext.request.contextPath}/deleteProject?id=' + data.id, function (res) {
                    layer.close(index);
                    if (res == 'true') {
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

        //打开编辑窗口 弹层
        function openUpdateUser(data) {
            data.pi_create_dt = data.pi_create_dt.substring(0, data.pi_create_dt.length - 2)
            mainIndex = layer.open({
                type: 1,
                title: '修改用户',
                offset: '0px',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", JSON.parse(JSON.stringify(data))
                    );
                    // getAllId();
                    form.on('submit(submitBtnFilter)', function (data) {
                        // layer.alert(JSON.stringify(data));
                        $.post('${pageContext.request.contextPath}/updateProject', data.field, function (res) {
                            layer.close(mainIndex);
                            if (res == 'true') {
                                layer.msg("修改成功！");
                                tableIns.reload();
                            } else {
                                layer.msg("修改失败！");
                            }
                        });

                        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                    });

                }

            });

        };


    });
</script>
</body>
</html>
