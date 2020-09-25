<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>角色管理</title>
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
    </div>
    <div id="userBar" style="display: none;">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delUser">删除</a>
    </div>

    <!-- 数据表格结束 -->

    <!-- 修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv" lay-filter="saveOrUpdateDiv">
        <form class="layui-form" style="width:80%;margin-top:10px" lay-filter="dataFrm">
            <input type="hidden" name="id" id="id" lay-filter="id" >
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sr_name" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">角色标识</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sr_sign" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sr_remark" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">创建用户id</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sr_create_uid" id="sr_create_uid" lay-verify="" autocomplete="off"
                               class="layui-input" readonly="true">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
<%--                    <label class="layui-form-label">创建时间</label>--%>
                    <div class="layui-input-inline">
                        <input type="hidden" name="sr_create_dt" class="layui-input" id="test5"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>
                <div class="layui-inline">
<%--                    <label class="layui-form-label">更新时间</label>--%>
                    <div class="layui-input-inline">
                        <input type="hidden" name="sr_update_dt" class="layui-input" id="test6"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>

                <div class="layui-inline">
<%--                    <label class="layui-form-label">更新者ID</label>--%>
                    <div class="layui-input-inline">
                        <input type="hidden" name="sr_update_uid" id="sr_update_uid" value=""/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">是否是超级管理员</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sr_issuperadmin" value="1" title="是" checked="">
                        <input type="radio" name="sr_issuperadmin" value="0" title="否">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">是否是系统管理员</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sr_issysadmin" value="1" title="是" checked="">
                        <input type="radio" name="sr_issysadmin" value="0" title="否">
                    </div>
                </div>
            </div>

            <div style="float:right;margin-top:-430px;margin-right:-30px">
                <div>
                    <button type="button" class="layui-btn layui-btn-sm" lay-demo="reload">全部取消</button>
                    <font size="3">资源权限</font>
                </div>
                <div id="test12" class="demo-tree"></div>
                <button type="button"
                        class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                       lay-demo="updateRoleResource" >确定
                </button>

            </div>

            <div class="layui-form-item" style="margin-top: 30px;margin-left: 20px;">
                <div class="layui-input-block">
                    <div class="layui-input-block">
                        <button type="submit"
                                class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                                lay-submit=""  lay-filter="editRole">确定
                        </button>
                        <button type="reset"
                                class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置
                        </button>
                    </div>
                </div>
            </div>
        </form>

    </div>
    <!-- 修改的弹出层结束 -->
    <script type="text/javascript" src="../../resources/layui/layui.js"></script>
    <script>
        layui.use(['tree', 'util', 'form', 'layedit', 'laydate', 'layer', 'jquery', 'table'], function () {
            var form = layui.form,
                tree = layui.tree
                , table = layui.table
                , util = layui.util
                ,layer = layui.layer,
                layedit = layui.layedit,
                $ = layui.jquery,
                laydate = layui.laydate;


            // //绑定时间选择器
            // laydate.render({
            //     elem: '#test5'
            //     , type: 'datetime',
            //     trigger: 'click', // 新增这一行以解决
            // });
            // laydate.render({
            //     elem: '#test6'
            //     , type: 'datetime',
            //     trigger: 'click', // 新增这一行以解决
            // });

            //模拟数据
            data = [{
                title: '项目信息管理'
                , id: 1
                , field: ''
                , checked: false
                , spread: true
                , children: [{
                    title: '项目信息'
                    , id: 2
                }]
            }, {
                title: '员工信息管理'
                , id: 3
                , field: ''
                , spread: true
                , children: [{
                    title: '员工信息'
                    , id: 4
                    , field: ''
                }, {
                    title: '添加员工'
                    , id: 5
                    , field: ''
                }]
            }, {
                title: '部门信息管理'
                , id: 6
                , spread: true
                , field: ''
                , children: [{
                    title: '部门信息'
                    , id: 7
                    , field: ''
                    , fixed: true
                },{
                    title: '添加部门'
                    , id: 8
                    , field: ''
                    , fixed: true
                }]
            }, {
                title: '工时信息管理'
                , id: 9
                , spread: true
                , field: ''
                , children: [{
                    title: '工时信息'
                    , id: 10
                    , field: ''
                    , fixed: true
                }, {
                    title: '添加工时'
                    , id: 11
                    , field: ''
                }]
            }, {
                title: '日志信息'
                , id: 12
                , spread: true
                , field: ''
                , children: [{
                    title: '日志信息'
                    , id: 13
                    , field: ''
                    , fixed: true
                }, {
                    title: '添加日志'
                    , id: 14
                    , field: ''
                }]
            }, {
                title: '权限管理'
                , id: 15
                , spread: true
                , field: ''
                , children: [{
                    title: '角色管理'
                    , id: 16
                    , field: ''
                    , fixed: true
                }, {
                    title: '添加角色'
                    , id: 17
                    , field: ''
                }, {
                    title: '菜单管理'
                    , id: 18
                    , field: ''
                }]
            }];

            var data1= null;
            $(function () {
                $.get("${pageContext.request.contextPath}/MenuController/getMenuData",function (res) {
                    data1 = res;
                });
            });
            //基本演示
            tree.render({
                elem: '#test12'
                <%--, data: '${pageContext.request.contextPath}/MenuController/getMenuData'--%>
                , data: data
                , showCheckbox: true  //是否显示复选框
                , id: 'demoid'
                , isJump: false //是否允许点击节点时弹出新窗口跳转
                , click: function (obj) {
                    var data = obj.data;  //获取当前点击的节点数据
                    // layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
                }
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
                // url: "../../json/user/role.json",//获取角色json地址
                url: '${pageContext.request.contextPath}/RoleController/findAllRole',
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
                        field: 'sr_name',
                        title: '角色名称',
                        // edit: true,
                        align: 'center',
                        sort: 'true'

                    }, {
                        field: 'sr_sign',
                        title: '角色标识',
                        align: 'center',
                        sort: 'true'

                    }, {
                        field: 'sr_remark',
                        title: '备注',
                        align: 'center',
                        sort: 'true'

                    }, {
                        field: 'sr_create_uid',
                        title: '创建用户id',
                        // edit: true,
                        align: 'center'

                    }, {
                        field: 'sr_create_dt',
                        title: '创建时间',
                        // edit: true,
                        align: 'center'
                        // ,templet: function (data) {
                        //     return data.sr_create_dt.substring(0, data.sr_create_dt.length - 2)
                        // }
                        // , templet : "<div>{{layui.util.toDateString(d.sbj_start, 'yyyy-MM-dd HH:mm:ss')}}</div>"

                    }, {
                        field: 'sr_update_dt',
                        title: '更新时间',
                        // edit: true,
                        align: 'center'
                        // ,templet: function (data) {
                        //     return data.sr_update_dt.substring(0, data.sr_update_dt.length - 2)
                        // }
                    }, {
                        field: 'sr_update_uid',
                        title: '更新者ID',
                        // edit: true,
                        align: 'center'
                    }, {
                        field: 'sr_issuperadmin',
                        title: '是否是超级管理员',
                        // edit: true,
                        align: 'center'
                    }, {
                        field: 'sr_issysadmin',
                        title: '是否是系统管理员',
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
                            });
                        });
                        break;
                }
            });

            function openAddUser() {
                // mainIndex = layer.open({
                // 	type: 1, //页面层
                // 	title: '添加角色',
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
                    $.post('${pageContext.request.contextPath}/RoleController/deleteRole?id=' + data.id, function (res) {
                        layer.close(index);
                        // alert(res);
                        if (res) {
                            layer.msg("删除成功！");
                            tableIns.reload();
                        } else {
                            layer.msg("删除失败！");
                        }
                    });
                });
            }
            //打开添加窗口 弹层
            var url;
            var mainIndex;

            //打开编辑窗口 弹层
            function openUpdateUser(data) {
                mainIndex = layer.open({
                    type: 1,
                    title: '修改角色',
                    offset: '0px',
                    content: layui.jquery("#saveOrUpdateDiv"),
                    area: ['800px', '500px'],
                    success: function (index) {
                        form.val("dataFrm", JSON.parse(JSON.stringify(data)));
                        findSelectedMenu();
                        form.on('submit(editRole)', function (data1) {
                            data1.field.id = data.id;
                            $.post("${pageContext.request.contextPath}/RoleController/updateRole", data1.field, function (res) {
                                layer.close(mainIndex);
                                if (res) {
                                    layer.msg("修改成功！");
                                    tableIns.reload();
                                } else {
                                    layer.msg("修改失败！");
                                }
                            });
                            return false;
                        });
                    }
                });
            };

            // 异步获取当前选定的角色权限
            function findSelectedMenu() {
                var role_id = $("#id").val();
                // alert(role_id);
                tree.reload('demoid', {});
                $.post("${pageContext.request.contextPath}/MenuController/findSelectedMenu?role_id="+role_id,function (res) {
                    // alert("res:"+res);
                    // var a = new Array();
                    // a = res;
                    $.each(res,function (index, value) {
                        // alert(value);
                        tree.setChecked('demoid', value); //勾选指定节点
                    });
                });
            }

            //按钮事件
            util.event('lay-demo', {
                getChecked: function (othis) {
                    var checkedData = tree.getChecked('demoid'); //获取选中节点的数据

                    layer.alert(JSON.stringify(checkedData), {shade: 0});
                    console.log(checkedData);
                }
                // ,setChecked: function(){
                //
                //     tree.setChecked('demoid', [12, 16]); //勾选指定节点
                // }
                , updateRoleResource: function () {
                    var checkedData = tree.getChecked('demoid'); //获取选中节点的数据
                    var ids = "";
                    // var ids1 = new Array();
                    // var ids2 = new Array();
                    var roleId=$("#id").val();
                    ids+="ids="+roleId+"&";
                    $.each(checkedData, function (index, value) {
                        // layer.alert(value.id,{shade:0});
                        // layer.alert(value.title,{shade:0});
                        // ids1[index] = value;

                        ids += "ids=" + value.id + "&";
                        // layer.alert(value1.children,{shade:0});
                        $.each(value.children, function (index, value1) {
                            ids += "ids=" + value1.id + "&";
                            // ids2[index] = value;
                            // layer.alert(value1.id,{shade:0});
                        });
                    });

                    ids = ids.substring(0,ids.length-1);

                    // alert(roleId);
                    $.post("${pageContext.request.contextPath}/RoleController/updateRoleResource",ids,function (res) {
                        if (res) {
                            layer.msg("权限修改成功！");
                        } else {
                            layer.msg("权限修改失败！");
                        }
                    });


                    // layer.alert(JSON.stringify(checkedData), {shade:0});
                    var checkedDataStr = JSON.stringify(checkedData);

                    // layer.alert(JSON.stringify(checkedData), {shade:0});
                    console.log(checkedData);
                }
                , reload: function () {
                    //重载实例
                    tree.reload('demoid', {});

                }
            });


        });
    </script>
</div>


</body>
</html>
