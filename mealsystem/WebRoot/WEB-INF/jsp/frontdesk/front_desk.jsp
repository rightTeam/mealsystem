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
<title>前台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="refresh" content="100;url=<%=basePath%>frontdesk/list.do"><!-- 自动刷新 -->
<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>

<body>
	<table id="navigation">
   <tr>
   <td><a type="button" href="frontdesk/list.do">前台</a></td>
   <td><a type="button" href="announcement/list.do">公告</a></td>
   <td><a type="button" href="kitchen/list.do">厨房</a></td>
  <td><a type="button" href="performance/list.do">管理</a></td>
   <td><a type="button" href="maincontroller/login.do">退出</a></td>
  <td>  <span>${username}</span></td>
   </tr>
   </table>
	<c:choose>
	<c:when test="${not empty varList}">
		<c:forEach items="${varList}" var="var" varStatus="vs">
		<table>
			<tr>
			<td>餐桌号:</td>
			<td>${var.t_number}</td>
			</tr>
			
			<tr>
			<td>是否空座: </td>
			<td>
			<c:choose>
					<c:when test="${var.t_isNull == '1'}">
				                                  是
				    </c:when>
					<c:otherwise>
				                                  否
				    </c:otherwise>
			</c:choose>
			</td>
			</tr>
			
			
			<tr><td>是否有情求:</td>
			<td>
			<c:choose>
				<c:when test="${var.t_isReq == '1'}">
				                   是
				</c:when>
				<c:otherwise>
				                   否
				</c:otherwise>
			</c:choose>
			</td>
			</tr>
			</table>
			<br><br>
		</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">
   $(document).ready(function(){
   		var a='${message}'
			if(a=="toreturn")
			{
			location.href="frontdesk/list.do";
			}
			else return;
   });
</script>
</html>
