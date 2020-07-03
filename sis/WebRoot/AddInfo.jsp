<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="mypack.*" %>
<%@ page import="java.lang.Object" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加页面</title>
    
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
    <%  
    String ename = request.getParameter("EName");
      //out.println("英文书名：" + ename);
      
      String cname = request.getParameter("CName");
      //out.println("中文书名：" + cname);
      
      String nname = request.getParameter("NName");
      //out.println("作者：" + nname);
      
      String num = request.getParameter("Num");
      //out.println("版号：" + num);
      String sex = request.getParameter("Sex");
      //out.println("实体书：" + sex);
      
      int age = Integer.parseInt(request.getParameter("Age"));
      //out.println("价格：" + age);
      
      String school = request.getParameter("School");
      //out.println("出版商：" + school);
      
       getInfo getinfo = new getInfo();
       if(getinfo.addInfo(ename,cname,nname,num,sex,age,school))
        {
        %>
	     <script> alert("添加成功");
	       window.location.href = "index.jsp";
	      </script>
	
	  <%    }
	      else{
	      %><script> alert("添加失败");
	        window.history.back();
	        </script>
	      <%}
	       %>
  </body>
</html>
