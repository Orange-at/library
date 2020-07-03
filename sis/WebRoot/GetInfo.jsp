<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mypack.*"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Student Information System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	function confirmdel(a)
	{
		if(confirm("确定要删除该图书信息？"))
		{
			window.location.href="DelInfo.jsp?id=" + a;
		}
	}
	</script>
	<link href="css/1.css" rel="stylesheet" type="text/css">
	<%
       int recordCount = 1;
       String pageStr = request.getParameter("page");
       int currentPage = 1;
  
   if (pageStr != null)        //非第一现实时
          currentPage = Integer.parseInt(pageStr);     //取得要显示的页面编号（页面从1开始  1 2 3 4 ...）  
          Pageutil pUtil = new Pageutil(10, recordCount, currentPage); //Pageutil(每页显示的条数 , 总共的条数 , 当前页面 )
	 %>

  </head>
  
  <body>
  <div id="container">
  	<div id="Header">
  	</div>
  	<div id="PageBody">
  		<div id="SiderBody">
  		<div id="login">
		<form id="user" name="user">
			<h3>欢迎登陆图书管理系统</h3>
			<a href="findpassword.html" mar>找回密码</a>
		</form>
		<form method="post" action="GetInfo.jsp">
		<input type="text" name="num">
		<input type="submit" value="通过编号或版号查询">	
		</form>
  		</div>
  		</div>
  		
  		<div id="MainBody"> 
 	    <table id="student">
    <tr>
    	<th><img src="img/bianhao.png" alt="编号"/></th>
   	    <th>英文书名</th>
    	<th>中文书名</th>
    	<th>作者</th>
    	<th>版号</th>
   	    <th>电子书</th>
        <th>价格</th>
        <th>出版商</th>
     </tr>
  <%
  //int j = 0;
  	 String num = request.getParameter("num");
	 String str = "select * from students where Num=" + num;
	 StuDB stu = new StuDB();
	 Connection dbCon = stu.getConnection();

	 
	 try{
	  	    Statement stmt = dbCon.createStatement();
	  	    ResultSet rs = stmt.executeQuery(str);
	  	    while(rs.next()){
	  	    	String stuid = rs.getString("Id");
	  	    	%><tr>
	  	    	<td><%out.println(stuid); 
	  	    	String ename = rs.getString("EnName");%></td>
	  	    	<td><%out.println(ename); 
	 			String cname = rs.getString("ChName");%></td>
	 			<td><%out.println(cname); %></td>
	 			<td><%String nname = rs.getString("NiName");
	 			      out.println(nname);%></td>
	 			<td><%String numb = rs.getString("Num");
	 			      out.println(numb);%></td>
	 			<td><%String sex = rs.getString("Sex");
	 		      	  out.println(sex); %></td>
	       	    <td><%String age = rs.getString("Age");
	              	  out.println(age);%></td>
	            <td><%String school = rs.getString("School");
	                  out.println(school);%></td>
	                <%  }     
	 }catch(Exception e){
			System.err.println(e);
			System.out.println("哈哈 数据库出错啦！");
		}finally{
			try{
				stu.closeConnection(dbCon);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
       %>
      </tr> 
    </table>
      <table align="center">
      <tr ><td width=100% bgcolor="#eeeeee" colspan=4 align="center"> 
                                记录总数<%=pUtil.getRecordCount()%>条 
    当前页/总页数
                                <%
    if(currentPage>=pUtil.getPageCount()) //已经到达最大
                                {
                                currentPage=pUtil.getPageCount();
                                out.print(currentPage); }
                                else if(currentPage<=0)       // 已经到达最小
                                {currentPage=1;
                                out.print("1");}
                                else out.print(currentPage); 
                                %>  
            /<%=pUtil.getPageCount()%>每页显示<%=pUtil.getPageSize()%>条 
             <a href="GetInfo.jsp?page=1">首页</a>
             <a href="GetInfo.jsp?page=<%=(currentPage - 1)%>">上页</a>
             <a href="GetInfo.jsp?page=<%=(currentPage + 1)%>">下页</a>
             <a href="GetInfo.jsp?page=<%=pUtil.getPageCount()%>">末页</a></td>
            </tr> 
    </table>
    <div align="right"><a href="index.jsp">返回首页</a></div>
	</div>
	</div>
	<div class="clear" />
	<div id="Footer">
	图书管理系统 2020
	</div>
	</div>
 </body>
</html>

