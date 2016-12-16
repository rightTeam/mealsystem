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
   <td><a type="button" href="usermanage/list.do">员工管理</a></td>
  <td><a type="button" href="noticemanage/list.do">公告发布</a></td>
    <td><a type="button" href="menumanage/list.do">菜单管理</a></td>
     <td><a type="button" href="maincontroller/login.do">退出</a></td>
   <td>  <span>${username}</span></td>
   </tr>
   </table>
   
	<form action="usermanage/list.do?keywords=${keywords}" method="post"
		name="Form" id="Form">
		<button type="button" data-toggle="modal" data-target="#myaddModal"
			onclick="add()">新增/修改</button>
		<input type="submit" value="删除" onclick="del()">

		<table>
			<thead>
				<tr>
					<th class="center"></th>
					<th class="center">用户账号</th>
					<th class="center">用户密码</th>
					<th class="center">用户名</th>
					<th class="center">工作岗位</th>
					<th class="center">用户性别</th>
					<th class="center">用户电话</th>
					<th class="center">备注信息</th>
				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="center" style="width:35px;"><label
									class="pos-rel"><input type="checkbox" class="ace"
										id="zcheckbox" name="ids" value="${var.account}" /><span
										class="lbl"></span></label></td>
								<td>${var.account}</td>
								<td>${var.password}</td>
								<td>${var.name}</td>
								<td>${var.type}</td>
								<td>${var.sex}</td>
								<td>${var.phone}</td>
								<td>${var.remark}</td>
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
	<form action="usermanage/save.do" name="save" id="save" method="post">
	<div class="modal fade" id="myaddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增/修改</h4>
				</div>
				
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户账号</span> <input type="text"
							class="form-control  controllerinput" placeholder="用户账号" name="account" id="account">
					</div>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户密码</span> <input type="text"
							class="form-control controllerinput" placeholder="用户密码" name="password" id="password">
					</div>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户名</span> <input type="text"
							class="form-control controllerinput " placeholder="用户名" name="name"
								id="name">
					</div>
				</div>
				
				
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">工作岗位</span> 
						<input type="hidden" type="text"
							 id="type" name="type" value="">
						<select id="choicetype">
						<option id="waiter">服务员</option>
						<option id="kitchen">后厨人员</option>
						</select>
					</div>
				</div>
				<div class="modal-body">
				<input type="hidden" type="text"
							 id="sex" name="sex" value="">
					<div class="input-group">
						<span class="input-group-addon">用户性别</span> 
						<select id="choicesex">
						<option >男</option>
						<option >女</option>
						</select>
					</div>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">用户电话</span> <input type="text"
							class="form-control controllerinput" placeholder="用户电话" id="phone"
								name="phone" >
					</div>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">备注信息</span> <input type="text"
							class="form-control controllerinput" placeholder="备注信息" name="remark"
								id="remark">
					</div>
				</div>
				<input type="hidden" type="text"
							 id="choice" name="choice" value="save">
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="tosave()">添加</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
		function add(){
		var str='';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					if(str=='') str += document.getElementsByName('ids')[i].value;
					else str += ',' + document.getElementsByName('ids')[i].value;
				}
			}
			if(str==''){
			$("#myaddModal").modal();
				return;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>usermanage/goAdd.do',
			data : {
				account : str
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				document.getElementById("account").value = data.account;
				$("#account").attr("readonly","readonly");
				document.getElementById("password").value = data.password;
				//document.getElementById("type").value = data.type;
				$("#choicetype").children("option").each(function(){
				if($(this).attr("id")==data.type)
				{
				 $(this).attr("selected","selected");
				}
				});
				document.getElementById("name").value = data.name;
				//document.getElementById("sex").value = data.sex;
				$("#choicesex").children("option").each(function(){
				if($(this).val()==data.sex)
				{
				 $(this).attr("selected","selected");
				 }
				});
				document.getElementById("phone").value = data.phone;
				document.getElementById("remark").value = data.remark;
				$("#choice").val("update");
			$("#myaddModal").modal();//显示隐藏框
			}
		});
	}

	function tosave() {
		$("#type").val($("#choicetype").find("option:selected").attr("id"));
		$("#sex").val($("#choicesex").find("option:selected").val());	
		if($("#account").val()=='')
		{
		alert("请输入用户账号");
		toempty();
		return;
		}
		else if($("#password").val()=='')
		{
		alert("请输入密码");
		toempty();
		return;
		}
		else if($("#name").val()=='')
		{
		alert("请输入用户名");
		toempty();
		return;
		}
		$("#save").submit();
		$("#myaddModal").hide();
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
					account : str
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
				     location.href="usermanage/list.do";
				}
			});
		}

	}
	function toempty()
	{
	$(".controllerinput").each(function(){
	$(this).val('');
	});
	}
</script>

</html>
