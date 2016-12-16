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
 
 <c:forEach items="${maxList}" var="var" varStatus="vs">
 <textarea rows="3" cols="30">
 ${var.n_content }
 
 </textarea>
 <br>
</c:forEach>

<table>
			<thead>
				<tr>
					<th class="center"></th>
					<th class="center">标题</th>
					<th class="center">内容</th>
					<th class="center">通知人</th>
					<th class="center">通知时间</th>
				</tr>

				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="center" style="width:35px;"><label
									class="pos-rel"><input type="checkbox" class="ace"
										id="zcheckbox" name="ids" value="${var.n_id}" /><span
										class="lbl"></span></label></td>
								<td>${var.n_title}</td>
								<td>${var.n_content}</td>
								<td>${var.n_user}</td>
								<td>${var.n_time}</td>
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
</body>
</html>
