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
<script language="javascript" type="text/javascript" src="<%= basePath%>static/js/My97DatePicker/WdatePicker.js"></script>
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
   <button type="button" onclick="update()">更新营业额</button>
   <button type="button" onclick="query()">查询营业额</button>
   <form action="performance/list.do?" method="post"
		name="Form" id="Form">
	<input type="text" id="one" name="onetime"  class="Wdate"  value="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /> ：
    <input type="text" id="two" name="twotime"  class="Wdate"  varlue=""onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /> 
		<input type="hidden" type="text" id="goupdate" name="message" value=""/>
		<table>
			<thead>
				<tr>
					<th class="center">年份</th>
					<th class="center">营业额</th>
				</tr>
				<c:choose>
					<c:when test="${not empty listyear}">
						<c:forEach items="${listyear}" var="var" varStatus="vs">
							<tr>
								<td>${var.p_mode}</td>
								<td>${var.p_generates}</td>
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
		<table>
			<thead>
				<tr>
					<th class="center">月份</th>
					<th class="center">营业额</th>
				</tr>
				<c:choose>
					<c:when test="${not empty listmonth}">
						<c:forEach items="${listmonth}" var="var" varStatus="vs">
							<tr>
								<td>${var.p_mode}</td>
								<td>${var.p_generates}</td>
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
	<c:choose>
<c:when test="${not empty query}">
	<table>
				<tr>
					<th class="center">查询结果</th>
				</tr>
				<tr>
					<th class="center">时间</th>
					<th class="center">营业额</th>
				</tr>
						<c:forEach items="${query}" var="var" varStatus="vs">
							<tr>
								<td>${var.o_time}</td>
								<td>${var.o_piece}</td>
							</tr>
						</c:forEach>
		</table>
</c:when>
</c:choose>
				</div>
			</div>

		</div>
	</form>
</body>
<script type="text/javascript">
	$().ready()
	{
	var mes='${mes}'
	if(mes=='success')
	{
	alert("更新营业额成功");
	}
	else if(mes=='queryfalses')
	alert("无查询数据，请重新输入");
	}
	function update()
	{
	$("#goupdate").val("update");
	$("#Form").submit();
	}		
	function query()
	{
	if($("#one").val()!=""&&$("#one").val()!=""&&$("#one").val()<=$("#two").val())
	{$("#goupdate").val("query");
	$("#Form").submit();}
	else alert("请输入正确日期")
	}

</script>

</html>
