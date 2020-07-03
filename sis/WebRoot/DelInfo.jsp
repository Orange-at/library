<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mypack.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除</title>
    
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
   <% int id = Integer.parseInt(request.getParameter("id"));//获取传递的参数的id
      getInfo getinfo = new getInfo(); 
      if(getinfo.delInfo(id)) //调用getinfo类中的delinfo方法删除对应参数
      {%>
	      <script> alert("删除成功");//弹出删除成功的对话框
	       window.location.href = "index.jsp";//向jsp页面传递参数并跳转
	      </script>
	      <%
	      }
	      else{
	      %><script> alert("删除失败");
	        window.history.back();
	        </script>
	      <%}
	     %>
  </body>
</html>
