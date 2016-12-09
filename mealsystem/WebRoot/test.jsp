<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script type="text/javascript"  src="static/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript"  src="static/js/bootstrap.js"></script>
   
  </head>
  
  <body>
    <!-- Button trigger modal -->
<button type="button"  data-toggle="modal" data-target="#myModal">
    Launch demo modal
</button>
<button type="button" data-toggle="modal" data-target="#myModal">Launch modal</button>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜名</span>
				  <input type="text" class="form-control" placeholder="菜名">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">价格</span>
				  <input type="text" class="form-control" placeholder="价格">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜品描述</span>
				  <input type="text" class="form-control" placeholder="菜品描述">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜品销售量</span>
				  <input type="text" class="form-control" placeholder="菜品销售量">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜品材料</span>
				  <input type="text" class="form-control" placeholder="菜品材料">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜品编号</span>
				  <input type="text" class="form-control" placeholder="菜品编号">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜单添加时间</span>
				  <input type="text" class="form-control" placeholder="菜单添加时间">
				</div>
            </div>
            
            <div class="modal-body">
                <div class="input-group">
				  <span class="input-group-addon">菜单添加人</span>
				  <input type="text" class="form-control" placeholder="菜单添加人">
				</div>
            </div>
				  
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
  </body>
  
</html>
