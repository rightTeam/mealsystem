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
<title>My JSP 'notice_list.jsp' starting page</title>

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
   
	<form action="noticemanage/list.do?keywords=${keywords}" method="post"
		name="Form" id="Form">
		<input type="text" placeholder="这里输入关键词" name="keywords"> <input
			type="submit" value="查询">

		<button type="button" data-toggle="modal" data-target="#myaddModal"
			onclick="add()">发布</button>
		<button type="button" data-toggle="modal" onclick="edit()">修改</button>

		<input type="submit" value="删除" onclick="del()">

		<table>
			<thead>
				<tr>
					<th class="center"></th>
					<th class="center">公告标题</th>
					<th class="center">公告内容</th>
					
					<th class="center">公告发布者</th>
					<th class="center">公告发布时间</th>
					

				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="center" style="width:35px;"><label
									class="pos-rel"><input type="checkbox" class="ace"
										id="zcheckbox" name="ids" value="${var.N_ID}" /><span
										class="lbl"></span></label></td>
								<td>${var.N_TITLE}</td>
								<td>${var.N_CONTENT}</td>
								
								<td>${var.N_USER}</td>
								<td>${var.N_TIME}</td>
							
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
	<form action="noticemanage/add.do" name="save" id="save" method="post">
	<div class="modal fade" id="myaddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发布</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon"></span>公告标题<input type="text"
							class="form-control" placeholder="公告标题" name="n_title0" id="n_title0">
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">公告内容</span> <input type="text"
							class="form-control" placeholder="公告内容" name="n_content0"
								id="n_content0" >
					</div>
				</div>

				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">公告发布者</span> <input type="text"
							class="form-control" placeholder="公告发布者" name="n_user0"
								id="n_user0">
					</div>
				</div>
				
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">公告发布时间</span> <input type="text"
							class="form-control" placeholder="公告发布时间" name="n_time0"
								id="n_time0">
					</div>
				</div>
				
				
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="tosave()">发布</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" >取消</button>
				</div>
			</div>
		</div>
	</div>
</form>


	<!-- editModel -->
	<form action="noticemanage/saveEdit.do" name="saveedit" id="saveedit" method="post">
		<div class="modal fade" id="myeditModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" class="form-control" placeholder="公告id"
				name="n_id" id="n_id" value="">
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
							<span class="input-group-addon"></span>公告标题 <input type="text"
								class="form-control" placeholder="公告标题 " name="n_title" id="n_title"
								value="">
						</div>
					</div>


					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">公告内容 </span> <input type="text"
								class="form-control" placeholder="公告内容 " name="n_content"
								id="n_content">
						</div>
					</div>

					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">公告发布者 </span> <input type="text"
								class="form-control" placeholder="公告发布者 " name="n_user"
								id="n_user">
						</div>
					</div>
					
					
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">公告发布时间 </span> <input type="text"
								class="form-control" placeholder="公告发布时间 " name="n_time"
								id="n_time">
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
				url: '<%=basePath%>noticemanage/goAdd.do',
			data : {
				DATA_IDS : str
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				console.log("进来结果处理了" + data);
				/*$("#mname").attr("value",result.M_NAME);               */
				document.getElementById("n_title").value = data.n_title;
				document.getElementById("n_content").value = data.n_content;
				document.getElementById("n_user").value = data.n_user;
				document.getElementById("n_time").value = data.n_time;
				
				document.getElementById("n_id").value = data.n_id;
				//document.getElementById("m_add_time").value=data.m_add_time;
				
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
				url: '<%=basePath%>noticemanage/isNumber.do',
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
				url: '<%=basePath%>noticemanage/delAll.do',
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
