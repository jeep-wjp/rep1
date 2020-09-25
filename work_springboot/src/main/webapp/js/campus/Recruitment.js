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
		elem: '#Recruitment_table' //渲染的目标对象
			,
		url: '../../json/campus/Recruitment.json' //数据接口
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
					field: 'TIME',
					title: '举办时间',
					align: 'center'
				}, {
					field: 'address',
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
					field: 'NOTICE',
					title: '备注',
					align: 'center'
				},{
					fixed: 'right',
					toolbar: '#details',
					title: '查看',
					width: 220,
					align: 'center'
				}
			]
		]
	});
	
})