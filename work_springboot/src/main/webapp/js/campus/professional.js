layui.use(['jquery', 'table', 'layer', 'laypage', 'element', 'form','laydate'], function() {
	var $ = layui.jquery,
		table = layui.table, //表格
		layer = layui.layer, //弹层
		laypage = layui.laypage,
		element = layui.element,
		laydate=layui.laydate,
		form = layui.form;
	//渲染表格
	var tableIns = table.render({
		elem: '#professional_table' //渲染的目标对象
			,
		url: '/Student_jobServlet?method='+method //数据接口
			,
		title: '招聘专业表' //数据导出来的标题
			,
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
					field: 'NAME',
					title: '专业名称'
				}, {
					field: 'DEGREE',
					title: '学历要求',
					align: 'center'
				}, {
					field: 'SEX',
					title: '性别要求',
					align: 'center'
				}, {
					field: 'JOB_AREA',
					title: '工作地点',
					align: 'center'
				}, {
					field: 'PERSONS',
					title: '需求人数',
					align: 'center'
				}, {
					field: 'JOB_TYPE',
					title: '岗位类型',
					align: 'center'
				},{
					field: 'NOTE',
					title: '聘用状态',
					align: 'center'
				},{
					fixed: 'right',
					toolbar: '#professional_Bar',
					width: 220,
					align: 'center'
				}
			]
		]
	});
	laydate.render({
		elem: '#birthday',
		trigger: 'click'
	});
	laydate.render({
		elem: '#time',
		trigger: 'click'
	});
	//监听行工具事件
	table.on('tool(professional_table)', function(obj) {
	
		var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		if (layEvent === 'apply') { 
			openApply();
		} 
	});
	

	//打开申请窗口 弹层

	
	function openApply() {
		layer.open({
			type: 1, //页面层
			title: '添加',
			content: $("#apply"),
			area: ['800', '550'],
			success: function (layero, index) {
				//layer.iframeAuto(index);
				//重新渲染表单
				form.render();
				form.on('submit(doSubmit)', function (data) {
					data.field.method = "add";
					$.post('/Student_jobServlet', data.field, function (res) {
						if (res == "true") {
							layer.msg('申请成功', {icon: 6});
							$("#search").click();
							layer.close(index);
						} else {
							layer.msg('申请失败', {icon: 5});
						}
					});
				});
			}
		});
	}
	
	//民族下拉菜单
	var nations = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族",
			"土家族", "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族", "土族",
			"达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族", "俄罗斯族", "鄂温克族",
			"德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"
		];
	var option = "";
	for(var i = 0; i <
		nations.length; i++) {
		option += '<option value="' + (i + 1) + '">' + nations[i] + '</option>';
	}
	$(option).appendTo("#nation");
	//隔行变色
	$(function(){
		$("tr:gt(0):even").css("background","#f5f5f5");
		$("tr:gt(0):odd").css("background","white");
	});
	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$("#search").click(function () {
		//获取用户输入的数据
		var job_type = $("#job_type").val();
		//重载数据表格
		tableIns.reload({
			where: {//设定异步数据接口的额外参数，任意设
				'job_type': job_type
			}
		});
	});

})