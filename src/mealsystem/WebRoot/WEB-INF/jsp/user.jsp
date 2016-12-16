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
<meta http-equiv="refresh" content="10;url=<%=basePath%>choicemeal/ispay.do?t_number=${pd.t_number}"> <!--自动刷新 -->
<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>

<body>
 <table id="navigation">
 <form action="choicemeal/list.do?t_number=${pd.t_number}" method="post"
		name="Form" id="Form">
		<input  type="hidden" type="text"  id="t_number" name="t_number" value="${pd.t_number}">
		</form>
   <tr>
   <ta><span>${pd.t_number}</span>
   <td><button type="button"  onclick="sendask()">买单</button></td>
   <td><button type="button" onclick="meal()">下单</button></td>
   </tr>
   </table>
</body>
<script type="text/javascript">
	 $(document).ready(function(){
	 var ispay='${mes}';
	 if(ispay=='ispay')
	 {
	 alert("已完成买单，谢谢惠顾");
	 location.href="maincontroller/index.do";
	 }
	 });
		function sendask(){
		
		var number=$("#t_number").val();
		alert(number)
			$.ajax({
				type: "POST",
				url: '<%=basePath%>choicemeal/sendask.do',
			data : {
				t_number : number
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
			alert("已发出请求，请稍等！")
			}
		});
	}
	function meal(){
	
	$("Form").submit();
	
	}
	
	

</script>

</html>
