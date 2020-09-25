<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>员工信息管理</title>
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
<div class="rt_content">
    <!-- 数据表格开始 -->
    <form class="layui-form">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" id="su_name" name="su_name" autocomplete="off" class="layui-input"
                       placeholder="请输入用户名"/>
            </div>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-warm layui-btn-sm layui-icon " id="doSearch">搜索
                </button>
            </div>
        </div>
    </form>
    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>
    <br>

    <div style="display: none;" id="userToolBar">
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="batchDeleteUser">批量删除员工</button>
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
                        <input type="text" name="su_name" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
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
                        <input type="text" name="su_login_name" lay-verify="" autocomplete="off" placeholder=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户系统登录密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="su_login_passwd" lay-verify="" autocomplete="off" placeholder=""
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
                        <input type="text" name="su_address" lay-verify="" autocomplete="off" placeholder=""
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
                            <option value="">用户所属部门ID</option>
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
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户信息创建者ID</label>
                    <div class="layui-input-inline">
                        <input type="text" name="su_create_uid" class="layui-input" id="su_create_uid" readonly="true">
                    </div>
                </div>
                <div class="layui-inline">
<%--                    <label class="layui-form-label">用户信息创建时间</label>--%>
                    <div class="layui-input-inline">
                        <input type="hidden" name="su_create_dt" class="layui-input" id="test5"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">给用户分配角色</label>
                    <div class="layui-input-inline">
                        <select name="sur_role_id" lay-verify="" lay-search="" id="sur_role_id">
                            <option value="">-请选择角色-</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-form-item" style="text-align: center;">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                            lay-submit="" lay-filter="updateUser" id="updateUser">提交
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
<script>
    layui.use(['form', 'laydate', 'layedit', 'table', 'laytpl', 'jquery', 'upload'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var table = layui.table;
        var upload = layui.upload;
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
            , type: 'datetime',
            trigger: 'click', // 新增这一行以解决
        });

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
            //获取所有的用户id
            <%--$.get("${pageContext.request.contextPath}/UserController/findAllUserId", {}, function (res) {--%>
            <%--    if (res == "加载数据异常") {--%>
            <%--        alert(res);--%>
            <%--        return;--%>
            <%--    }--%>
            <%--    // alert(res);--%>
            <%--    $.each(res, function (index, value) {--%>
            <%--        var id1 = value.id;--%>
            <%--        var su_dept_id = document.getElementById("su_create_uid");--%>
            <%--        var opt = new Option(id1, id1);--%>
            <%--        su_dept_id.options[index + 1] = opt;--%>
            <%--    });--%>
            <%--    form.render('select');--%>
            <%--});--%>
            //获取所有的部门id
            $.get("${pageContext.request.contextPath}/DeptController/findAllDeptID", function (res) {

                if (res != null) {
                    $.each(res, function (index, value) {
                        var opt = new Option(value.dept_id, value.dept_id);
                        var su_dept_id = document.getElementById("su_dept_id");
                        su_dept_id.options[index + 1] = opt;
                    });
                    form.render('select');
                } else {
                    layer.msg("用户所属部门ID 加载异常！");
                }
            });
            //获取所有的角色
            $.get("${pageContext.request.contextPath}/RoleController/findAllRole", function (res) {

                if (res != null) {
                    $.each(res.data, function (index, value) {
                        // alert(res.data);
                        // console.log(res.data);
                        var opt = new Option(value.sr_name, value.id);
                        var sur_role_id = document.getElementById("sur_role_id");
                        sur_role_id.options[index + 1] = opt;
                    });
                    form.render('select');
                } else {
                    layer.msg("用户角色 加载异常！");
                }
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
            url: "/UserController/findAllUser",
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
                    field: 'su_name',
                    title: '用户姓名',
                    // edit: true,
                    align: 'center',
                    sort: 'true'

                }, {
                    field: 'su_login_name',
                    title: '用户系统登录名',
                    // edit: true,
                    align: 'center'

                }, {
                    field: 'su_login_passwd',
                    title: '用户系统登录密码',
                    // edit: true,
                    align: 'center'

                }, {
                    // field: 'user_level',
                    field: 'su_sex',
                    title: '用户性别',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_birth_dt',
                    title: '用户生日',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_icon',
                    title: '用户头像',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_address',
                    title: '用户详细地址',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_province',
                    title: '用户所在省份',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_city',
                    title: '用户所在城市',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_district',
                    title: '用户所在地区',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_dept_id',
                    title: '用户所属部门ID',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_email',
                    title: '用户电子邮箱',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_mobile',
                    title: '用户电话号码',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_status',
                    title: '用户状态',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_create_uid',
                    title: '用户信息创建者ID',
                    // edit: true,
                    align: 'center'
                }, {
                    // field: 'user_level',
                    field: 'su_create_dt',
                    title: '用户信息创建时间',
                    // edit: true,
                    align: 'center'
                    // ,templet: function (data) {
                    //     return data.su_create_dt.substring(0, data.su_create_dt.length - 2)
                    // }
                }, {
                    // field: 'user_level',
                    field: 'sur_role_id',
                    title: '用户角色Id',
                    hide:true,
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

        //搜索按钮
        $("#doSearch").click(function () {
            // layer.alert("点击");
            var su_name = $("#su_name").val();
            tableIns.reload({
                where: {//设定异步数据接口的额外参数
                    "su_name": su_name
                }
            });
        });

        var index;
        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'addUser':
                    // openAddUser();
                    break;
                case 'batchDeleteUser':
                    //批量删除
                    deleteBatch();
                    break;
            }
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
                    idStr = idStr + "idStr=" + value.id + "&";
                });
                idStr = idStr.substring(0,idStr.length-1);
                $.post("${pageContext.request.contextPath}/UserController/deleteBatchUser",idStr,function (res) {
                    if (res){
                        layer.msg("批量删除成功！");
                    }else {
                        layer.msg("删除失败！");
                    }
                    tableIns.reload();
                });
                return false;
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
                $.post('${pageContext.request.contextPath}/UserController/deleteUser?id=' + data.id, function (res) {
                    layer.close(index);
                    // alert(res);
                    if (res == "true") {
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
                title: '修改用户',
                offset: '0px',
                content: layui.jquery("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", JSON.parse(JSON.stringify(data)));
                    form.on('submit(updateUser)', function (data1) {
                        // alert(data.id);
                        data1.field.id = data.id;
                        $.post("${pageContext.request.contextPath}/UserController/updateUser", data1.field, function (res) {
                            layer.close(mainIndex);
                            if (res == "true") {
                                layer.msg("修改成功！");
                                tableIns.reload();
                            } else {
                                layer.msg("修改失败！");
                            }

                        });
                        return false; //阻止表单跳转。
                    });
                }
            });
        };
    });
</script>
<script type="text/javascript" src="../../js/area.js"></script>
<script type="text/javascript" src="../../js/province.js"></script>
</body>
</html>
