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
   <td><a type="button" href="maincontroller/index.do">前台</a></td>
   <td><a type="button" href="noticemanage/list.do">公告</a></td>
   <td><a type="button" href="kitchen/list.do">厨房</a></td>
  <td><a type="button" href="maincontroller/login.do">管理</a></td>
  <td>  <span>${username}</span></td>
   </tr>
   </table>
 
   
   
   
   
   
   
   
   
</body>
<script type="text/javascript">
	

</script>

</html>
