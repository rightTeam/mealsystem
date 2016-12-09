<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'user_list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>

<body>
 <table id="navigation">
   <tr>
   <td><a type="button" href="frontdesk/list.do">前台</a></td>
   <td><a type="button" href="performance/list.do">业绩信息</a></td>
   <td><a type="button" href="usermanage/list.do">员工信息</a></td>
  <td><a type="button" href="noticemanage/list.do">公告发布</a></td>
    <td><a type="button" href="menumanage/list.do">菜单管理</a></td>
     <td><a type="button" href="maincontroller/login.do">退出</a></td>
   <td>  <span>${username}</span></td>
   </tr>
   </table>
   
	<form action="usermanage/list.do?keywords=${keywords}" method="post"
		name="Form" id="Form">
		<input type="text" placeholder="这里输入关键词" name="keywords"> <input
			type="submit" value="查询">

		<button type="button" data-toggle="modal" data-target="#myaddModal"
			onclick="add()">添加</button>
		<button type="button" data-toggle="modal" onclick="edit()">修改</button>

		<input type="submit" value="删除" onclick="del()">

		<table>
			<thead>
				<tr>
					<th class="center"></th>
					<th class="center">用户账号</th>
					<th class="center">用户名</th>
					<th class="center">用户性别</th>
					<th class="center">用户电话</th>
					<th class="center">用户类型</th>
					<th class="center">备注信息</th>
					

				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="center" style="width:35px;"><label
									class="pos-rel"><input type="checkbox" class="ace"
										id="zcheckbox" name="ids" value="${var.U_ID}" /><span
										class="lbl"></span></label></td>
								<td>${var.A_NAME}</td>
								<td>${var.U_NAME}</td>
								<td>${var.U_SEX}</td>
								<td>${var.U_PHONE}</td>
								<td>${var.U_TYPE}</td>
								<td>${var.U_REMARK}</td>
								
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</thead>

		</table>
	</form>


	<!-- addModal -->
	<form action="usermanage/add.do" name="save" id="save" method="post">
	<div class="modal fade" id="myaddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户账号</span> <input type="text"
							class="form-control" placeholder="用户账号" name="a_name0" id="a_name0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户名</span> <input type="text"
							class="form-control" placeholder="用户名" name="u_name0"
								id=" u_name0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户性别</span> <input type="text"
							class="form-control" placeholder="用户性别" name=" u_sex0"
								id=" u_sex0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户电话</span> <input type="text"
							class="form-control" placeholder="用户电话" id="u_phone0"
								name="u_phone0" onchange="isNumber()">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户类型</span> <input type="text"
							class="form-control" placeholder="用户类型" id="u_type0"
								name="u_type0">
					</div>
				</div>


				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">备注信息</span> <input type="text"
							class="form-control" placeholder="备注信息" name="u_remark0"
								id="u_remark0">
					</div>
				</div>


				

			

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="tosave()">添加</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</form>


	<!-- editModel -->
	<form action="usermanage/saveEdit.do" name="saveedit" id="saveedit" method="post">
		<div class="modal fade" id="myeditModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" class="form-control" placeholder="用户名id"
				name="u_id" id="u_id" value="">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改</h4>
					</div>

					<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户账号</span> <input type="text"
							class="form-control" placeholder="用户账号" name="a_name" id="a_name">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户名</span> <input type="text"
							class="form-control" placeholder="用户名" name="u_name"
								id=" u_name">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户性别</span> <input type="text"
							class="form-control" placeholder="用户性别" name=" u_sex"
								id=" u_sex">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户电话</span> <input type="text"
							class="form-control" placeholder="用户电话" id="u_phone"
								name="u_phone" >
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户类型</span> <input type="text"
							class="form-control" placeholder="用户类型" id="u_type"
								name="u_type">
					</div>
				</div>


				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">备注信息</span> <input type="text"
							class="form-control" placeholder="备注信息" name="u_remark"
								id="u_remark">
					</div>
				</div>

					

					<div class="modal-footer">

						<!-- <button type="button" class="btn btn-primary" onclick="saveEdit()" name="保存修改"/> -->
						<!-- function ddd(){$('#myeditModal').hide();} -->
						<a class="btn btn-mini btn-primary"  onclick="saveEdit()">保存修改</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>

		</div>
	</form>
</body>
<script type="text/javascript">
		function edit(){
		var str='';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					if(str=='') str += document.getElementsByName('ids')[i].value;
					else str += ',' + document.getElementsByName('ids')[i].value;
				}
			}
			if(str==''){
			alert("没有选中数据");
				return;
			}
			if(str.length>1){
			alert("只能修改一个");
			return;
			}
			
			$.ajax({
				type: "POST",
				url: '<%=basePath%>usermanage/goAdd.do',
			data : {
				DATA_IDS : str
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				console.log("进来结果处理了" + data);
				/*$("#mname").attr("value",result.M_NAME);               */
					document.getElementById("u_id").value = data.u_id;
				document.getElementById("a_name").value = data.a_name;
				document.getElementById("u_name").value = data.u_name;
				document.getElementById("u_sex").value = data.u_sex;
				document.getElementById("u_phone").value = data.u_phone;
				document.getElementById("u_type").value = data.u_type;
				document.getElementById("u_remark").value = data.u_remark;
			
				//document.getElementById("m_add_time").value=data.m_add_time;
				//document.getElementById("m_add_user").value = data.m_add_user;
				//document.getElementById("m_image").value = data.m_image;
			}
		});
		$('#myeditModal').modal();
	}

	function saveEdit() {
		$("#saveedit").submit();
		$("#myeditModal").hide();
	}
	
	
	function add() {
		$("#myaddModal").modal();//显示隐藏框
	}
	
	function tosave() {
	//提交并隐藏隐藏框
		$("#save").submit();
		$("#myaddModal").hide();
	}
	
	
	//判断是不是数字
		function isNumber(){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>usermanage/isNumber.do',
				data: {number:$("#u_phone0").val()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("isExist" != data.result){
						alert("您输入的不是数字，请重新输入");
						console.log(data.resultValue);
						document.getElementById("u_phone0").value=data.resultValue;
					}
				}
			});
		}
		
		
		
	
		
		function del(){
		var str='';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					if(str=='') str += document.getElementsByName('ids')[i].value;
					else str += ',' + document.getElementsByName('ids')[i].value;
				}
			}
			if(str==''){
			alert("没有选中数据");
				return;
			}
			if(window.confirm("您确定要删除吗？")){
				$.ajax({
				type: "POST",
				url: '<%=basePath%>usermanage/delAll.do',
				data : {
					DATA_IDS : str
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
				     alert("删除成功");
				}
			});
		}

	}
</script>

</html>
