layui.use(['form', 'laydate', 'table', 'laytpl', 'jquery', 'element'], function() {
	var form = layui.form;
	var $ = layui.jquery;
	var laydate = layui.laydate;
	var laytpl = layui.laytpl;
	var table = layui.table;
	element = layui.element,
		//绑定时间选择器
		laydate.render({
			elem: '#startTime'
		})
	laydate.render({
		elem: '#endTime'
	})

//渲染数据表格
	//社会简历表
	var tableIns1 = table.render({
		elem: '#socialResume',
		title: '社会简历表',
		url: '../../json/resume/resume.json',
		toolbar: 'default',
		page: true, //分页
		height: 'full-100',
		cellMinWidth: 100,
		limit: 20, //每页显示的条数
		cols: [
			[{
					type: 'checkbox',
					fixed: 'left'
				},
				{
					field: 'resume_id',
					title: '简历编号',
					align: 'center',
					fixed: 'left'
				},
				{
					field: 'seeker_id',
					title: '搜寻编号',
					align: 'center'
				},
				{
					field: 'NAME',
					title: '姓名',
					align: 'center',
					edit: 'text'
				},
				{
					field: 'IDCARD',
					title: '身份证号',
					align: 'center',
					sort: "true",
					edit: 'text'
				},
				{
					field: 'SEX',
					title: '性别',
					align: 'center'
				},
				{
					field: 'NATIONALITY',
					title: '民族',
					align: 'center'
				},
				{
					field: 'POLITIC_STATUS',
					title: '政治面貌',
					align: 'center'
				},
				{
					field: 'HEIGHT',
					title: '身高',
					align: 'center',
					sort: "true",
				},
				{
					field: 'WEIGHT',
					title: '体重',
					align: 'center',
					sort: "true",
				},
				{
					field: 'BIRTHDAY',
					title: '出生年月',
					align: 'center',
					sort: "true",
				},
				{
					field: 'HEALTH',
					title: '健康状况',
					align: 'center'
				},
				{
					field: 'BIRTHPLACE',
					title: '籍贯',
					align: 'center'
				},
				{
					field: 'ADDRESS',
					title: '家庭住址',
					align: 'center'
				},
				{
					field: 'HUKOU',
					title: '户口所在地',
					align: 'center'
				},
				{
					field: 'MARITAL_STATUS',
					title: '婚姻状况',
					align: 'center'
				},
				{
					field: 'COMPANY_NAME',
					title: '现工作单位',
					align: 'center'
				},
				{
					field: 'OCCUPATION',
					title: '职位或职称',
					align: 'center'
				},
				{
					field: 'RESEARCH',
					title: '现从事行业',
					align: 'center'
				},
				{
					field: 'WORK_YEAR',
					title: '工作年限',
					align: 'center'
				},
				{
					field: 'DEGREE',
					title: '学位',
					align: 'center'
				},
				{
					field: 'COLLEGE',
					title: '毕业学校',
					align: 'center'
				},
				{
					field: 'MAJOR_TYPE',
					title: '专业分类',
					align: 'center'
				},
				{
					field: 'MAJOR_NAME',
					title: '专业名称',
					align: 'center'
				},
				{
					field: 'GRADUATEDATE',
					title: '毕业时间',
					align: 'center'
				},
				{
					field: 'EDUCATION_MODE',
					title: '培养方式',
					align: 'center'
				},
				{
					field: 'FIRST_LANG_NAME',
					title: '第一语种',
					align: 'center'
				},
				{
					field: 'COMPUTER_LEVEL',
					title: '计算机水平',
					align: 'center'
				},
				{
					field: 'EXPECTED_SALARY',
					title: '期望月薪',
					align: 'center'
				},
				{
					field: 'EXPECTED_JOB_TYPE',
					title: '岗位意向',
					align: 'center'
				},
				{
					field: 'EXPECTED_WORK_REGION',
					title: '期望工作地区',
					align: 'center'
				},
				{
					field: 'PHONE',
					title: '电话',
					align: 'center'
				},
				{
					field: 'MOBILE',
					title: '手机',
					align: 'center'
				},
				{
					field: 'EMAIL',
					title: '电子邮箱',
					align: 'center'
				},
				{
					field: 'MAIL_ADD',
					title: '通讯地址',
					align: 'center'
				},
				{
					field: 'POSTCODE',
					title: '邮政编码',
					align: 'center'
				},

				{
					field: 'SELF_EVAL',
					title: '自我评价',
					align: 'center'
				},
				{
					field: 'SKILL',
					title: '职业技能与特长',
					align: 'center'
				},
				{
					field: 'JOB_NAME',
					title: '职业名称',
					align: 'center'
				},
				{
					field: 'STORE_DATE',
					title: '发布日期',
					align: 'center'
				},
				{
					fixed: 'right',
					title: '操作',
					width: 200,
					toolbar: '#socialResumeBar',
					align: 'center'
				}

			]
		]
	});
	//监听工具条
	table.on('tool(demo1)', function(obj) {
		var data = obj.data;
		var layEvent = obj.event;
		var mainIndex;
		if (layEvent === 'detail') {
			fun1(data);
	
		} else if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {
				obj.del();
				layer.close(index);
			});
		} else if (layEvent === 'edit') {
			layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});
	//打开查看的弹出层
	function fun1(data) {
		mainIndex = layer.open({
			type: 2,
			title: '查看用户详细信息',
			content: 'detailSocial.html',
			area: ['1000px', '600px'],
			success: function(layero,index) {
				var body = layer.getChildFrame('body', index);
				//清空表单数据       
				var children = $(body.find("form")).find("input");
				for(var i = 0; i<children.length;i++){
					$(children[i]).val(data[children[i].name]);
				}
			}
		})
	}
	// 校园简历表
	var tableIns2 = table.render({
		elem: '#campusResume',
		title: '校园简历表',
		url: '../../json/resume/resume.json',
		toolbar: 'default',
		page: true, //分页
		totalRow: true, //合计行
		height: 'full-100',
		cellMinWidth: 100,
		limit: 20, //每页显示的条数
		cols: [
			[{
					type: 'checkbox',
					fixed: 'left'
				},
				{
					field: 'student_id',
					title: 'id编号',
					align: 'center'
				},
				{
					field: 'seeker_id',
					title: '搜寻编号',
					align: 'center'
				},
				{
					field: 'NAME',
					title: '姓名',
					align: 'center',
					edit: 'text'
				},
				{
					field: 'IDCARD',
					title: '身份证号',
					align: 'center',
					sort: "true",
					edit: 'text'
				},
				{
					field: 'SEX',
					title: '性别',
					align: 'center'
				},
				{
					field: 'NATIONALITY',
					title: '民族',
					align: 'center'
				},
				{
					field: 'POLITIC_STATUS',
					title: '政治面貌',
					align: 'center'
				},
				{
					field: 'HEIGHT',
					title: '身高',
					align: 'center',
					sort: "true",
				},
				{
					field: 'WEIGHT',
					title: '体重',
					align: 'center',
					sort: "true",
				},
				{
					field: 'BIRTHDAY',
					title: '出生年月',
					align: 'center',
					sort: "true",
				},
				{
					field: 'HEALTH',
					title: '健康状况',
					align: 'center'
				},
				{
					field: 'BIRTHPLACE',
					title: '籍贯',
					align: 'center'
				},
				{
					field: 'ADDRESS',
					title: '家庭住址',
					align: 'center'
				},
				{
					field: 'DEGREE',
					title: '最高学历',
					align: 'center'
				},
				{
					field: 'COLLEGE',
					title: '婚姻状况',
					align: 'center'
				},
				{
					field: 'MAJOR_TYPE',
					title: '专业分类',
					align: 'center'
				},
				{
					field: 'MAJOR_NAME',
					title: '专业名称',
					align: 'center'

				},
				{
					field: 'RESEARCH',
					title: '现从事行业',
					align: 'center'
				},
				{
					field: 'GRADUATEDATE',
					title: '毕业时间',
					align: 'center'
				},
				{
					field: 'EDUCATION_MODE',
					title: '培养方式',
					align: 'center'
				},
				{
					field: 'FIRST_LANG_NAME',
					title: '第一语种',
					align: 'center'
				},
				{
					field: ' FIRST_LANG_LEVEL  ',
					title: '第一语种水平',
					align: 'center'
				},
				{
					field: 'SECOND_LANG_NAME',
					title: '第一语种',
					align: 'center'
				},
				{
					field: 'SECOND_LANG_LEVEL',
					title: '第二语种水平',
					align: 'center'
				},
				{
					field: ' COMPUTER_LEVEL',
					title: '计算机水平',
					align: 'center'
				},
				{
					field: ' EXPECTED_SALARY',
					title: '期望月薪',
					align: 'center'

				},
				{
					field: 'EXPECTED_JOB_TYPE',
					title: '岗位意向',
					align: 'center'
				},
				{
					field: ' EXPECTED_WORK_REGION',
					title: '期望工作地区',
					align: 'center'
				},
				{
					field: 'PHONE',
					title: '电话',
					align: 'center'
				},
				{
					field: 'MOBILE',
					title: '手机',
					align: 'center'

				},
				{
					field: 'EMAIL',
					title: '电子邮箱',
					align: 'center'
				},
				{
					field: 'MAIL_ADD',
					title: '通讯地址',
					align: 'center'
				},
				{
					field: 'POSTCODE',
					title: '邮政编码',
					align: 'center'
				},
				{
					field: 'STUDY_EXPER',
					title: '学习经历',
					align: 'center'
				},
				{
					field: 'WORK_EXPER',
					title: '社会实践经历',
					align: 'center'
				},
				{
					field: 'SELF_EVAL',
					title: '自我评价',
					align: 'center'

				},
				{
					field: 'SKILL',
					title: '职业技能与特长',
					align: 'center'
				},
				{
					field: 'JOB_NAME',
					title: '职业名称',
					align: 'center'

				},
				{
					field: 'Student_JOB_ID',
					title: '工作编号',
					align: 'center'

				},
				{
					field: 'STORE_DATE',
					title: '发布日期',
					align: 'center'
				},
				{
					field: 'stutas',
					title: ' 是否入库  ',
					align: 'center'

				},
				{
					field: 'constraint PK_STUDENT',
					title: '是否入人才库',
					align: 'center'
				},
				{
					fixed: 'right',
					title: '操作',
					width: 200,
					toolbar: '#campusResumeBar',
					align: 'center'
				}

			]
		]
	});
	//监听工具条
	table.on('tool(demo2)', function(obj) {
		var data = obj.data;
		var layEvent = obj.event;
		var mainIndex;
		if (layEvent === 'detail') {
			fun2(data);
	
		} else if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {
				obj.del();
				layer.close(index);
			});
		} else if (layEvent === 'edit') {
			layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});
	//打开查看的弹出层
	function fun2(data) {
		mainIndex = layer.open({
			type: 2,
			title: '查看用户详细信息',
			content: 'detailSocial.html',
			area: ['1000px', '600px'],
			success: function(layero,index) {
				var body = layer.getChildFrame('body', index);
				//清空表单数据       
				var children = $(body.find("form")).find("input");
				for(var i = 0; i<children.length;i++){
					$(children[i]).val(data[children[i].name]);
				}
			}
		})
	}
	//人员简历表seeker
	var tableIns3 = table.render({
		elem: '#seeker',
		title: '求职者',
		url: '../../json/resume/resume.json',
		toolbar: 'default',
		page: true, //分页
		totalRow: true, //合计行
		height: 'full-100',
		cellMinWidth: 100,
		limit: 20, //每页显示的条数
		cols: [
			[{
					type: 'checkbox',
					fixed: 'left'
				},
				{
					field: 'seeker_id',
					title: '求职者',
					align: 'center'
				},
				{
					field: 'student_id',
					title: '学生编号',
					align: 'center'
				},
				{
					field: 'studyexpr_id',
					title: '经历编号',
					align: 'center',
					edit: 'text'
				},
				{
					field: 'details_id',
					title: '详情',
					align: 'center',
					sort: "true",
					edit: 'text'
				},
				{
					field: 'RID',
					title: '工作编号',
					align: 'center',
					sort: "true",
					edit: 'text'
				}, {
					field: 'resume_id',
					title: '简历编号',
					align: 'center',
					sort: "true",
					edit: 'text'
				},
				{
					field: 'seeker_name',
					title: '求职者姓名',
					align: 'center',
					edit: 'text'
				},
				{
					field: 'seeker_password',
					title: '求职者密码',
					align: 'center',
					edit: 'text'
				},
				{
					fixed: 'right',
					title: '操作',
					width: 200,
					toolbar: '#seekerBar',
					align: 'center'
				}

			]
		]
	});
//监听工具条
	table.on('tool(demo3)', function(obj) {
		var data = obj.data;
		var layEvent = obj.event;
		var mainIndex;
		if (layEvent === 'detail') {
			fun3(data);

		} else if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {
				obj.del();
				layer.close(index);
			});
		} else if (layEvent === 'edit') {
			layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});
	//打开查看的弹出层
	function fun3(data) {
		mainIndex = layer.open({
			type: 2,
			title: '查看用户详细信息',
			content: 'detailSocial.html',
			area: ['1000px', '600px'],
			success: function(layero,index) {
				var body = layer.getChildFrame('body', index);
				//清空表单数据       
				var children = $(body.find("form")).find("input");
				for(var i = 0; i<children.length;i++){
					$(children[i]).val(data[children[i].name]);
				}
			}
		})
	}



	//人员教育和培训经历表talent_studyexpr
	var tableIns4 = table.render({
		elem: '#studyexpr',
		title: '人员教育和培训经历表',
		url: '../../json/resume/resume.json',
		toolbar: 'default',
		page: true, //分页
		totalRow: true, //合计行
		height: 'full-100',
		cellMinWidth: 150,
		limit: 20, //每页显示的条数
		cols: [
			[{
					type: 'checkbox',
					fixed: 'left'
				},
				{
					field: 'studyexpr_id',
					title: '教育编号',
					align: 'center'
				},
				{
					field: 'seeker_id',
					title: '求职者id',
					align: 'center'
				},
				{
					field: 'studyTime11',
					title: '开始学习时间1',
					align: 'center'
				},
				{
					field: 'studyTime12',
					title: '结束学习时间1',
					align: 'center'
				},
				{
					field: 'studyTime21',
					title: '开始学习时间2',
					align: 'center'
				},
				{
					field: 'studyTime22',
					title: '结束学习时间2',
					align: 'center'
				},
				{
					field: 'studyTime31',
					title: '开始学习时间3',
					align: 'center'
				},
				{
					field: 'studyTime32',
					title: '结束学习时间3',
					align: 'center'
				},
				{
					field: ' school1 ',
					title: '学校/培训单位1',
					align: 'center'
				},
				{
					field: 'School2',
					title: '学校/培训单位2',
					align: 'center'
				},
				{
					field: 'School3',
					title: '学校/培训单位3',
					align: 'center'
				},
				{
					field: 'major1',
					title: '专业/培训项目1',
					align: 'center'
				},
				{
					field: 'major2',
					title: '专业/培训项目2',
					align: 'center'
				},
				{
					field: 'major3',
					title: '专业/培训项目3',
					align: 'center'
				},
				{
					field: 'degree1',
					title: '学历/证书',
					align: 'center'
				},
				{
					field: 'degree2',
					title: '学历/证书',
					align: 'center'
				},
				{
					field: 'Degree3',
					title: '学历/证书',
					align: 'center'
				},
				{
					fixed: 'right',
					title: '操作',
					width: 200,
					toolbar: '#studyexprBar',
					align: 'center'
				}

			]
		]
	});


//监听工具条
	table.on('tool(demo4)', function(obj) {
		var data = obj.data;
		var layEvent = obj.event;
		var mainIndex;
		if (layEvent === 'detail') {
			fun4(data);

		} else if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {
				obj.del();
				layer.close(index);
			});
		} else if (layEvent === 'edit') {
			layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});
	//打开查看的弹出层
	function fun4(data) {
		mainIndex = layer.open({
			type: 2,
			title: '查看用户详细信息',
			content: 'detailSocial.html',
			area: ['1000px', '600px'],
			success: function(layero,index) {
				var body = layer.getChildFrame('body', index);
				//清空表单数据       
				var children = $(body.find("form")).find("input");
				for(var i = 0; i<children.length;i++){
					$(children[i]).val(data[children[i].name]);
				}
			}
		})
	}


	//人员工作经历表talent_workexpr
	var tableIns5 = table.render({
		elem: '#workexpr',
		title: '求职者',
		url: '../../json/resume/resume.json',
		toolbar: 'default',
		page: true, //分页
		totalRow: true, //合计行
		height: 'full-100',
		cellMinWidth: 150,
		limit: 20, //每页显示的条数
		cols: [
			[{
					type: 'checkbox',
					fixed: 'left'
				},

				{
					field: 'RID',
					title: '工作编号',
					align: 'center'

				},
				{
					field: 'seeker_id',
					title: '求职者id',
					align: 'center'

				},
				{
					field: 'workTime11',
					title: '开始工作时间',
					align: 'center'

				},
				{
					field: 'workTime12',
					title: '结束工作时间',
					align: 'center'

				},
				{
					field: 'workTime21',
					title: '开始工作时间',
					align: 'center'

				},
				{
					field: 'workTime22',
					title: '结束工作时间',
					align: 'center'

				},
				{
					field: 'workTime31',
					title: '开始工作时间',
					align: 'center'

				},
				{
					field: 'workTime32',
					title: '结束工作时间',
					align: 'center'

				},
				{
					field: 'workTime41',
					title: '开始工作时间',
					align: 'center'

				},
				{
					field: 'workTime42',
					title: '结束工作时间',
					align: 'center'

				},
				{
					field: 'company1',
					title: '工作单位1',
					align: 'center'

				},
				{
					field: 'company2',
					title: '工作单位2',
					align: 'center'

				},
				{
					field: 'company3',
					title: '工作单位3',
					align: 'center'

				},
				{
					field: 'company4',
					title: '工作单位4',
					align: 'center'

				},
				{
					field: 'industry1',
					title: '所属行业1',
					align: 'center'

				},
				{
					field: 'industry2',
					title: '所属行业2',
					align: 'center'

				},
				{
					field: 'industry3',
					title: '所属行业3',
					align: 'center'

				},
				{
					field: 'industry4',
					title: '所属行业4',
					align: 'center'

				},
				{
					field: ' department1',
					title: '工作部门1',
					align: 'center'

				},
				{
					field: ' department2',
					title: '工作部门2',
					align: 'center'
				}, {
					field: ' department3',
					title: '工作部门3',
					align: 'center'

				}, {
					field: ' department4',
					title: '工作部门4',
					align: 'center'

				}, {
					field: 'position1',
					title: '职务1',
					align: 'center'
				}, {
					field: 'position2',
					title: '职务2',
					align: 'center'
				}, {
					field: 'position3',
					title: '职务3',
					align: 'center'
				}, {
					field: 'position4',
					title: '职务4',
					align: 'center'
				}, {
					field: 'fruit1 ',
					title: '业绩1',
					align: 'center'
				},
				{
					field: 'fruit2 ',
					title: '业绩2',
					align: 'center'
				},
				{
					field: 'fruit3 ',
					title: '业绩3',
					align: 'center'
				},
				{
					field: 'fruit4 ',
					title: '业绩',
					align: 'center'
				},
				{
					fixed: 'right',
					title: '操作',
					width: 200,
					toolbar: '#workexprBar',
					align: 'center'
				}

			]
		]
	});



	//监听头部工具栏事件
	table.on("toolbar(userTable)", function(obj) {
		switch (obj.event) {
			case 'add':
				openAddUser();
				break;
			case 'batchDelete':
				layer.msg('批量删除');
				break;
		};
	});


	//监听工具条
	table.on('tool(demo5)', function(obj) {
		var data = obj.data;
		var layEvent = obj.event;
		var mainIndex;
		if (layEvent === 'detail') {
			fun5(data);
	
		} else if (layEvent === 'del') {
			layer.confirm('真的删除行么', function(index) {
				obj.del();
				layer.close(index);
			});
		} else if (layEvent === 'edit') {
			layer.alert('编辑行：<br>' + JSON.stringify(data))
		}
	});
	//打开查看的弹出层
	function fun5(data) {
		mainIndex = layer.open({
			type: 2,
			title: '查看用户详细信息',
			content: 'detailSocial.html',
			area: ['1000px', '600px'],
			success: function(layero,index) {
				var body = layer.getChildFrame('body', index);
				//清空表单数据       
				var children = $(body.find("form")).find("input");
				for(var i = 0; i<children.length;i++){
					$(children[i]).val(data[children[i].name]);
				}
			}
		})
	}

	//打开添加窗口 弹层
	var url;
	var mainIndex;

	function openAddUser() {
		mainIndex = layer.open({
			type: 1, //页面层
			title: '添加用户',
			content: layui.jquery("#saveOrUpdateDiv"),
			area: ['800px', '400px'],

		});
	}
	//打开编辑窗口 弹层
	function openUpdateUser(data) {
		console.log(data);
		//	alert(data);
		mainIndex = layer.open({
			type: 1,
			title: '修改用户',
			content: layui.jquery("#saveOrUpdateDiv"),
			area: ['800px', '400px'],
			success: function(index) {
				form.val("dataFrm", JSON.parse(JSON.stringify(data)));
			}
		});

	};

	//保存
	form.on("submit(doSubmit)", function(obj) {
		//序列化表单数据
		var params = $("#dataFrm").serialize();
		//alert(params);
		//发起异步请求
		$.post("index.jsp", params, function(obj) {
			layer.msg(obj);
			//关闭弹出层
			layer.close(mainIndex)
			//刷新数据 表格
			tableIns.reload();
		});
	});
});
