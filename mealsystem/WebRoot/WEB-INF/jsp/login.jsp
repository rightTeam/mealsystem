<i><%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	 <table id="navigation">
   <tr>
  <td ><a type="button" href="maincontroller/index.do">首页</a> </td>
   </tr>
   </table>
	<form action="loadcontroller/load.do">
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="登陆"></td>
			<td colspan="2"><input type="reset" value="清空"></td>
			</tr>
		</table>
	</form>
</body>
	</html> </i>
	
	<script type="text/javascript">
	$().ready()
	{
	var msg='${pd.msg}'
	if(msg!="")
	{
	alert("用户名或密码错误")
	}
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>