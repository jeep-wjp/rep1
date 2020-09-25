layui.use(['jquery', 'table', 'layer', 'laypage', 'element', 'form','laydate'], function() {
	var $ = layui.jquery,
		table = layui.table, //表格
		layer = layui.layer, //弹层
		laypage = layui.laypage,
		element = layui.element,
		laydate=layui.laydate,
		form = layui.form;
	laydate.render({
		elem:'#test1',
		trigger: 'click'
	});
	//渲染表格
	var tableIns = table.render({
		id:'rtTable',
		elem: '#Recruitment_table' //渲染的目标对象
			,
		url: '/Campus_meetingServlet?method='+method//数据接口
			,
		title: '招聘专业表' //数据导出来的标题
			,
		toolbar: "#Recruitment_ToolBar",
		height: '300',
		cellMinWidth: 100 //设置列的最小默认宽度
			,
		done: function(res, curr, count) {

		},
		page: true //是否启用分页
			,
		cols: [
			[ //列表数据
			
				{
					type: 'checkbox',
					fixed: 'left'
				},{
					field: 'MID',
					title: '招聘编号',
					align: 'center'
				}, {
					field: 'PLACE',
					title: '招聘地点',
					align: 'center'
				}, {
					field: 'REQUIREMENT',
					title: '参会要求',
					align: 'center'
				}, {
					field: 'STATUS',
					title: '状态',
					align: 'center'
				}, {
					field: 'TIME',
					title: '招聘时间',
					align: 'center'

				},{
					field: 'NOTICE',
					title: '备注',
					align: 'center'
				},{
					fixed: 'right',
					toolbar: '#Recruitment_Bar',
					title: '操作',
					width: 220,
					align: 'center'
				}
			]
		]
	});

	//监听头部工具栏事件
	table.on("toolbar(Recruitment_table)", function(obj) {
		switch (obj.event) {
			case 'add':
				openAdd();
				break;
			case 'batchDelete':
				delBatch();
				break;
		};
	});
	//批量删除
	function delBatch() {
		var checkStatus = table.checkStatus('rtTable'); //userTable 即为基础参数 id 对应的值
		var data = checkStatus.data; //获取选中行的数据
		var count = data.length;//获取选中行数量，可作为是否有选中行的条件

		layer.confirm('您确定要删除这些用户?', function () {
			if (count < 0) {
				layer.msg("请选中要删除的用户");
				return;
			}
			//拼接出请求参数
			var ids = "";
			//value代表被选中的行对象   each方法用于对数组进行迭代  最终ids的值为:id=7&id=8&
			$.each(data, function (index, value) {
				ids += "id=" + value.MID + "&";
			});
			ids = ids.substring(0, ids.length - 1);
			$.post("/Campus_meetingServlet?method=deleteBatch", ids, function (res) {
				if (res == "true") {
//					   成功提示
					layer.msg("删除成功", {icon: 6});
//					  刷新数据表格
					$("#searchBtn").click();
//					 关闭确认层
					tableIns.reload();
					layer.close(index);
					return;
				} else {
					layer.msg("删除失败", {icon: 5});
					layer.close(index);
				}
			});
		});
	}
	//监听行工具事件
	table.on('tool(Recruitment_table)', function(obj) {
	
		var data = obj.data; //获得当前行数据
		var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		if (layEvent === 'del') { //删除
			layer.confirm('真的删除行么', function(index) {
				$.ajax({
					url: '/Campus_meetingServlet?method=del',
					type: 'post',
					data: {id: data.MID},
					dataType: "text",
					success: function (r) {
						if (r != "") {
							layer.msg("删除成功", {icon: 6});
							tableIns.reload();
						} else {
							layer.msg("删除失败", {icon: 5});
						}
					}
				});
				layer.close(index);
				//向服务端发送删除指令
			});
		} else if (layEvent === 'edit') { //编辑
			openUpdate(data);
		}
	});
	//打开添加窗口 弹层
	function openAdd() {
		layer.open({
			type: 1, //页面层
			title: '添加',
			content: $("#saveOrUpdateDiv"),
			area: ['800px', '400px'],
			success: function (layero, index) {
				//重新渲染表单
				form.render();
				form.on('submit(doSubmit)', function (data) {
					data.field.method = "add";
					$.post('/Campus_meetingServlet', data.field, function (res) {
						if (res == "true") {
							layer.msg('添加成功', {icon: 6});
							$("#search").click();
							layer.close(index);
						} else {
							layer.msg('添加失败', {icon: 5});
						}
					});
				});
			}
		});
	}

	//打开编辑窗口 弹层
	function openUpdate(data) {
		$("#MID").attr("disabled",true);
		layer.open({
			type: 1,
			title: '修改',
			content: $("#saveOrUpdateDiv"),
			area: ['800px', '400px'],
			success: function (layero, index) {
				//重新渲染表单
				form.render();
				//向表单中加载数据
				//给表单赋值
				form.val("dataFrm", {
					"MID": data.MID
					, "STATUS": data.STATUS
					, "REQUIREMENT": data.REQUIREMENT
					, "PLACE": data.PLACE
					, "TIME": data.TIME
					, "NOTICE": data.NOTICE
				});
				form.on('submit(doSubmit)', function (data) {
					data.field.method = "update";
					$.post('/Campus_meetingServlet', data.field, function (res) {
						if (res == "true") {
							layer.msg('修改成功', {icon: 6});
							$("#search").click();
							layer.close(index);
						} else {
							layer.msg('修改失败', {icon: 5});
						}
					});
				});

			}
		});

	}

	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$("#search").click(function () {
		//获取用户输入的数据
		var PLACE = $("#PLACE").val();
		//重载数据表格
		tableIns.reload({
			where: {//设定异步数据接口的额外参数，任意设
				'PLACE': PLACE
			}
		});
	});
});