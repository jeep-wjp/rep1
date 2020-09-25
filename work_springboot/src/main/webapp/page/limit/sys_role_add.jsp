<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>添加角色</title>
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
    <form class="layui-form" style="width:80%;margin-top:10px" lay-filter="dataFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" name="sr_name" lay-verify=""  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">角色标识</label>
            <div class="layui-input-inline">
                <input type="text" name="sr_sign" lay-verify=""  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <input type="text" name="sr_remark" lay-verify=""  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
<%--            <label class="layui-form-label">创建用户id</label>--%>
            <div class="layui-input-inline">
                <input type="hidden"  class="layui-input" name="sr_create_uid" id="sr_create_uid" readonly="true" />
            </div>
        </div>

<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">创建时间</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="sr_create_dt" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="layui-inline">
<%--            <label class="layui-form-label">更新者ID</label>--%>
            <div class="layui-input-inline">
                <input type="hidden"  class="layui-input" name="sr_update_uid" id="sr_update_uid" value="" readonly="true"/>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">是否是超级管理员</label>
            <div class="layui-input-block">
                <input type="radio" name="sr_issuperadmin" value="1" title="是" >
                <input type="radio" name="sr_issuperadmin" value="0" title="否" checked="">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">是否是系统管理员</label>
            <div class="layui-input-block">
                <input type="radio" name="sr_issysadmin" value="1" title="是" checked="">
                <input type="radio" name="sr_issysadmin" value="0" title="否">
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;margin-left: 20px;">
        <div class="layui-input-block">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-add-1"
                        lay-submit="" lay-filter="addRole">确定
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../resources/layui/layui.js"></script>
<script>
    layui.use(['tree', 'util','form', 'layedit', 'laydate', 'layer','jquery'], function () {
        var form = layui.form,
            tree = layui.tree
            , util = layui.util,
            layer = layui.layer,
            layedit = layui.layedit,
            $ = layui.jquery,
            laydate = layui.laydate;

       //日期时间选择器
        laydate.render({
            elem: '#test5',
            type: 'datetime',
            value:new Date(),
            min:minDate(),
            trigger: 'click', // 新增这一行以解决
        });
        // 设置最小可选的日期
        function minDate(){
            var now = new Date();
            return now.getFullYear()+"-" + (now.getMonth()+1) + "-" + now.getDate()+ " "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
        }
        laydate.render({
            elem: '#test6'
            , type: 'datetime',
            value:new Date(),
            trigger: 'click', // 新增这一行以解决
        });

        //模拟数据
        data = [{
            title: '系统维护'
            , id: 17
            , field: 'name1'
            , checked: false
            , spread: false
            , children: [{
                title: '新增用户'
                , id: 1
            }, {
                title: '用户管理'
                , id: 2
            }, {
                title: '专业维护'
                , id: 3
                , field: ''
            }, {
                title: '工作地点维护'
                , id: 4
                , field: ''
            }, {
                title: '联系方式维护'
                , id: 5
                , field: ''
            }]
        }, {
            title: '招聘动态'
            , id: 18
            , field: ''
            , spread: true
            , children: [{
                title: '发布招聘动态信息'
                , id: 6
                , field: ''
            }, {
                title: '发布紧急招聘信息'
                , id: 7
                , field: ''
            }]
        }, {
            title: '人才战略'
            , id: 19
            , spread: true
            , field: ''
            , children: [{
                title: '发布战略信息'
                , id: 8
                , field: ''
                , fixed: true
            }]
        }, {
            title: '社会招聘'
            , id: 20
            , spread: true
            , field: ''
            , children: [{
                title: '职位管理'
                , id: 9
                , field: ''
                , fixed: true
            }, {
                title: '简历查询'
                , id: 10
                , field: ''
            }, {
                title: '简历统计'
                , id: 11
                , field: ''
            }]
        }, {
            title: '校园招聘'
            , id: 21
            , spread: true
            , field: ''
            , children: [{
                title: '招聘专业'
                , id: 12
                , field: ''
                , fixed: true
            }, {
                title: '校园招聘会'
                , id: 13
                , field: ''
            }, {
                title: '校园简历查询'
                , id: 14
                , field: ''
            }]
        }, {
            title: '人才库'
            , id: 22
            , spread: true
            , field: ''
            , children: [{
                title: '未入人才库简历查询'
                , id: 15
                , field: ''
                , fixed: true
            }, {
                title: '人才库简历查询'
                , id: 16
                , field: ''
            }]
        }, {
            title: '网站首页'
            , id: 24
            , spread: true
            , field: ''
            , children: [{
                title: '招聘专业'
                , id: 25
                , field: ''
                , fixed: true
            }, {
                title: '校园招聘会'
                , id: 26
                , field: ''
            }]
        }, {
            title: '角色权限管理'
            , id: 27
            , spread: true
            , field: ''
            , children: [{
                title: '权限管理'
                , id: 23
                , field: ''
                , fixed: true
            }, {
                title: '角色管理'
                , id: 28
                , field: ''
            }]
        }];

        form.on('submit(addRole)',function (data) {
            $.get("${pageContext.request.contextPath}/RoleController/addRole",data.field,function (res) {
                if (res){
                    layer.msg("添加成功！");
                }else {
                    layer.msg("添加失败！");
                }
            });
            // 重置清空表单
            // $("#reset").click();
            // $('#userTable')[0].reset();
            // form.render();//必须写
            return false;
        });


        //基本演示
        tree.render({
            elem: '#test12'
            , data: data
            , showCheckbox: true  //是否显示复选框
            , id: 'demoid'
            , isJump: false //是否允许点击节点时弹出新窗口跳转
            , click: function (obj) {
                var data = obj.data;  //获取当前点击的节点数据
                // layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
            }
        });
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
                // layer.alert(checkedData.data.id, {shade:0});
                var ids = "";
                var user_level = $("#user_level").val();
                if (user_level.length <= 0) {
                    layer.msg("您没有选中要修改的角色！");
                } else {
                    layer.alert(user_level);
                    $.each(checkedData, function (index, value) {
                        // layer.alert(value.id,{shade:0});
                        // layer.alert(value.title,{shade:0});
                        ids = ids + "id1=" + value.id + "&";
                        // layer.alert(value1.children,{shade:0});
                        $.each(value.children, function (index, value1) {
                            ids = ids + "id2=" + value1.id + "&";
                            // layer.alert(value1.id,{shade:0});
                        });
                    });

                    // ids=ids.substring(0,ids.length-1);
                    ids += "user_level=" + user_level;
                    if (checkedData.length <= 0) {
                        layer.msg("您没有选中任何权限！");
                    } else {
                        layer.confirm('您确定修改当前角色的权限吗?', function () {
                            $.post("/updateRoleResourceServlet", ids, function (res) {
                                if (res == "true") {
                                    layer.msg("权限修改成功！");
                                } else {
                                    layer.msg("权限修改失败！");
                                }
                            });

                        });
                    }
                }


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
</body>
</html>
