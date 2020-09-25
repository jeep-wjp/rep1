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
		url: '/StudentServlet?method=' + method  //数据接口
		,
		elem: '#resumeTable' //渲染的目标对象
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
					field: 'RID',
					title: '编号',
					align: 'center'
				},{
					field: 'NAME',
					title: '姓名',
					align: 'center'
				},{
					field: 'IDCARD',
					title: '身份证号',
					align: 'center'
				}, {
					field: 'SEX',
					title: '性别',
					align: 'center'
				}, {
					field: 'NATIONALITY',
					title: '民族',
					align: 'center'
				}, {
					field: 'POLITIC_STATUS',
					title: '政治面貌',
					align: 'center'
				}, {
					field: 'BIRTHDAY',
					title: '出生年月',
					edit:'text',
					align: 'center'
				},{
					field: 'HEALTH',
					title: '健康状况',
					align: 'center'
				},{
					field: 'BIRTHPLACE',
					title: '籍贯',
					align: 'center'
				},{
					field: 'ADDRESS',
					title: '家庭住址',
					align: 'center'
				},{
					field: 'COLLEGE',
					title: '毕业学校',
					align: 'center'
				},{
					field: 'GRADUATEDATE',
					title: '毕业时间',
					edit:'text',
					align: 'center'
				},{
					field: 'STUDY_EXPER',
					title: '学习经历',
					align: 'center'
				},{
					field: 'WORK_EXPER',
					title: '社会实践经历',
					align: 'center'
				},{
					field: 'SELF_EVAL',
					title: '自我评价',
					align: 'center'
				},{
					field: 'EXPECTED_SALARY',
					title: '期望月薪',
					align: 'center'
				},{
					field: 'EXPECTED_JOB_TYPE',
					title: '岗位类型',
					align: 'center'
				}
				,{
					field: 'EXPECTED_WORK_REGION',
					title: '期望工作地',
					align: 'center'
				},{
					field: 'PHONE',
					title: '电话',
					align: 'center'
				},{
					field: 'EMAIL',
					title: '邮箱',
					align: 'center'
				},{
					field: 'MAIL_ADD',
					title: '通讯地址',
					align: 'center'
				}
			
			]
		]
	});
	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$("#search").click(function () {
		alert("sss");
		//获取用户输入的数据
		var name = $("#name").val();
		var IDCARD = $("#IDCARD").val();

		//重载数据表格
		tableIns.reload({
			where: {//设定异步数据接口的额外参数，任意设
				'NAME': name,
				'IDCARD':IDCARD
			}
		});
	});
	//监听是否入库操作
	/*form.on('switch(stutasDemo)', function(obj){
	   	layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
	});*/
})