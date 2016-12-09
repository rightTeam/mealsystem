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
<title>My JSP 'menu_list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/jquery-3.1.1.min.js"></script>
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
	<form action="menumanage/list.do?keywords=${keywords}" method="post"
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
					<th class="center">菜单名</th>
					<th class="center">菜单价格</th>
					<th class="center">菜单描述</th>
					<th class="center">菜单销售量</th>
					<th class="center">菜单材料</th>
					<th clasee="center">菜品类别</th>
					<th class="center">菜单图片</th>
					<th class="center">菜单添加时间</th>
					<th class="center">添加菜单人</th>

				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="center" style="width:35px;"><label
									class="pos-rel"><input type="checkbox" class="ace"
										id="zcheckbox" name="ids" value="${var.M_ID}" /><span
										class="lbl"></span></label></td>
								<td>${var.M_NAME}</td>
								<td>${var.M_PIECE}</td>
								<td>${var.M_DESCRIBE}</td>
								<td>${var.M_SALE}</td>
								<td>${var.M_DATA}</td>
								<td>${var.M_CLASSIFY}</td>
								<td><img src="/pic/${var.M_IMAGE}"  width=50px height=50px/>
								<td>${var.M_ADD_TIME}</td>
								<td>${var.M_ADD_USER}</td>
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
	<form action="menumanage/add.do" name="save" id="save" method="post" enctype="multipart/form-data">
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
						<span class="input-group-addon">菜名</span> <input type="text"
							class="form-control" placeholder="菜名" name="m_name0" id="m_name0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">价格</span> <input type="text"
							class="form-control" placeholder="价格" name="m_piece0"
								id="m_piece0" onchange="isNumber2()">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">菜品描述</span> <input type="text"
							class="form-control" placeholder="菜品描述" name="m_describe0"
								id="m_describe0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">菜品销售量</span> <input type="text"
							class="form-control" placeholder="菜品销售量" id="m_sale0"
								name="m_sale0" onchange="isNumber()">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">菜品材料</span> <input type="text"
							class="form-control" placeholder="菜品材料" id="m_data0"
								name="m_data0">
					</div>
				</div>
				<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜品类别</span> <input type="text"
								class="form-control" placeholder="菜品类别" id="m_classify0"
								name="m_classify0">
						</div>
					</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">菜单图片</span>
						 <input type="file"	class="form-control" placeholder="菜单图片" name="pictureFile" id="m_image0">
					</div>
				</div>


				

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">菜单添加人</span> <input type="text"
							class="form-control" placeholder="菜单添加人" name="m_add_user0" id="m_add_user0">
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
	<form action="menumanage/saveEdit.do" name="saveedit" id="saveedit" method="post">
		<div class="modal fade" id="myeditModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" class="form-control" placeholder="菜名id"
				name="m_id" id="m_id" value="">
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
							<span class="input-group-addon">菜名</span> <input type="text"
								class="form-control" placeholder="菜名" name="m_name" id="m_name"
								value="">
						</div>
					</div>


					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">价格</span> <input type="text"
								class="form-control" placeholder="价格" name="m_piece"
								id="m_piece">
						</div>
					</div>

					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜品描述</span> <input type="text"
								class="form-control" placeholder="菜品描述" name="m_describe"
								id="m_describe">
						</div>
					</div>

					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜品销售量</span> <input type="text"
								class="form-control" placeholder="菜品销售量" id="m_sale"
								name="m_sale">
						</div>
					</div>

					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜品材料</span> <input type="text"
								class="form-control" placeholder="菜品材料" id="m_data"
								name="m_data">
						</div>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜品类别</span> <input type="text"
								class="form-control" placeholder="菜品类别" id="m_classify"
								name="m_classify">
						</div>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜单图片</span> <input type="text"
								class="form-control" placeholder="菜单图片" name="m_image"
								id="m_image">
						</div>
					</div>

					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">菜单添加人</span> <input type="text"
								class="form-control" placeholder="菜单添加人" name="m_add_user" id="m_add_user">
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
				url: '<%=basePath%>menumanage/goAdd.do',
			data : {
				DATA_IDS : str
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				console.log("进来结果处理了" + data);
				/*$("#mname").attr("value",result.M_NAME);               */
				document.getElementById("m_name").value = data.m_name;
				document.getElementById("m_data").value = data.m_data;
				document.getElementById("m_describe").value = data.m_describe;
				document.getElementById("m_sale").value = data.m_sale;
				document.getElementById("m_piece").value = data.m_piece;
				document.getElementById("m_id").value = data.m_id;
				//document.getElementById("m_add_time").value=data.m_add_time;
				document.getElementById("m_add_user").value = data.m_add_user;
				document.getElementById("m_image").value = data.m_image;
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
				url: '<%=basePath%>menumanage/isNumber.do',
				data: {number:$("#m_sale0").val()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("isExist" != data.result){
						alert("您输入的不是数字，请重新输入");
						console.log(data.resultValue);
						document.getElementById("m_sale0").value=data.resultValue;
					}
				}
			});
		}
		
		
		
		//判断是不是数字
		function isNumber2(){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>menumanage/isNumber.do',
				data: {number:$("#m_piece0").val()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("isExist" != data.result){
						alert("您输入的不是数字，请重新输入");
						console.log(data.resultValue);
						document.getElementById("m_piece0").value=data.resultValue;
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
				url: '<%=basePath%>menumanage/delAll.do',
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
