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
   <td><a type="button" href="maincontroller/index.do">首页</a></td>
   <td><button type="button" onclick="meal()">菜单</button></td>
   <td><button type="button" onclick="indent()">订单</button></td>
  <td><a type="button" href="maincontroller/login.do">登陆</a></td>
   </tr>
   </table>
	<form action="choicemeal/list.do?keywords=${keywords}" method="post"
		name="Form" id="Form">
		<table id="mealtable">
			<thead>
				<tr>
					<th class="center">菜单名</th>
					<th class="center">菜单价格</th>
					<th class="center">菜单图片</th>
				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td>${var.M_NAME}</td>
								<td>${var.M_PIECE}</td>
								<td><img  src="/pic/${var.M_IMAGE}"  width=50px height=50px/>
								<td><input type="button"  class="buttonclick" value="下单" id="${var.M_ID}"></td>
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
	<form action="choicemeal/add.do" name="save" id="indentform" method="post" >
	<div class="modal fade" id="indent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">餐桌号</span> 
				<input type="text" class="form-control" name="t_number" id="t_number" value="10" style="width: 50px;">
				<input  type="hidden" type="text"  id="o_meal_id" name="o_meal" value="">
					</div>
				</div>
				<div class="modal-main">
				</div>
				
				<div class="modal-footer">
						<span class="input-group-addon">总价：</span> 
				<input type="text" class="form-control" name="o_piece" id="o_piece" value="10" style="width: 50px;">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="tosave()">提交订单</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" >取消</button>
				</div>
			</div>
		</div>
	</div>
</form>


</body>
<script type="text/javascript">
		$(document).ready(function(){
  			var a='${message}'
			if(a=="query")
			{
			$("#Form").submit();
			}
			else return;
			});

		var  totalprices="0";
		$(".buttonclick").on("click",function(){
		var id=$(this).attr("id");
		var i=$(this).parent().index();
		var main=$(this).parent().parent().children().eq(i-1).html();
		var piece=$(this).parent().parent().children().eq(1).text();
	$(".modal-main").append('<div class="modal-body">'
						+'<div class="input-group">'
					+main+'<span class="input-group-addon">'+$(this).parent().parent().children().eq(0).text()+'</span> '
							+'<span class="input-group-addon">单价：</span> '
							+'<input type="text"  class="ids" value="'+id+'">'
			+	'<input type="text" class="form-control ipiece"  name="m_name'+id+'" id="m_name'+id+'" value="'+$(this).parent().parent().children().eq(1).text()+'">'
							+'<span class="spanadd input-group-addon ">+</span>'
							 +'<input type="text" class="form-control inumber"  name="m_name0'+id+'" id="m_name0'+id+'" value="1">'
							 +'<span class="input-group-addon spanreduce">-</span>'
				+'<button type="button" class="todelete">删除</button>'+
					'</div>'
			+	'</div>');
		totalprices=parseInt(totalprices)+parseInt(piece);
		$("#o_piece").val(totalprices);
		
		});
		$(".modal-main").on("click",".spanadd",function(){
		$(this).next().val(parseInt($(this).next().val())+1);
		var piece=parseInt($("#o_piece").val())+parseInt($(this).prev().val());
		$("#o_piece").val(piece);
		});
		
		$(".modal-main").on("click",".spanreduce",function(){
		if($(this).prev().val()=='0')
		{
		alert("数量为0");
		return;
		}
		$(this).prev().val(parseInt($(this).prev().val())-1);
		var a=$(this).prevAll(".ipiece").val();
		var piece=parseInt($("#o_piece").val())-parseInt(a);
		$("#o_piece").val(piece);
		});
		
		$(".modal-main").on("click",".todelete",function(){
		var a=$(this).prevAll(".ipiece").val();
		var b=$(this).prevAll(".inumber").val();	
		var piece=parseInt($("#o_piece").val())-parseInt(a*b);
		$("#o_piece").val(piece);
		$(this).parent().parent().empty();
		});
		
		
		
		
		
	var a=0;
	function indent() {
		if(a==0)
		{$("#indent").modal();
		a==1;
		}//显示隐藏框
		else{
		$("#indent").hide();
		a=0;
		}
		}
		
		function tosave(){
		var ids="";
		$(".ids").each(function()
		{
			ids=ids+$(this).val()+",";
			
		});
		ids=ids.substr(0,ids.length-1);
		$("#o_meal_id").val(ids);
		$("#indentform").submit();
		
		
		
		
		
		
		
		
		}
		
	

</script>

</html>
