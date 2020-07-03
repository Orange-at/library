<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mypack.*"%>
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
		if(confirm("确定要删除该书本信息？"))
		{
			window.location.href="DelInfo.jsp?id=" + a;
		}
	}
	</script>
	<link href="css/1.css" rel="stylesheet" type="text/css">
	<%
     getInfo getinfo = new getInfo();
     Vector v = getinfo.getInformation();
     int id = Integer.parseInt(request.getParameter("id"));	
       int recordCount = getinfo.size();
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
        <form method="post" action="AltInfo1.jsp?id=<%=id%>">
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
        <th>&nbsp;</th>
        <th>&nbsp;</th>
     </tr>
  <%
  //int j = 0;
  for(int i = pUtil.getFromIndex(); i < pUtil.getToIndex(); i++)
  {
     Info info =  getinfo.elementAt(v,i);
     if(info.getId() == id)
     {
  %>
  <tr>
  	<td><% out.println(info.getId());%></td>
  	<td><input type="text" value="<%=info.getEName()%>" name="EName" size="8"></td>
  	<td><input type="text" value="<%=info.getCName()%>" name="CName" size="8"></td>
  	<td><input type="text" value="<%=info.getNName()%>" name="NName" size="8"></td>
  	<td><input type="text" value="<%=info.getNum()%>" name="Num" size="8"></td>
  	<td><select name="Sex">
      <option value="是">是</option><option value="否">否</option></select></td>
    <td><input type="text" value="<%=info.getAge()%>" name="Age" size="4"></td>
    <td><textarea cols="10" rows="1" name="School" ></textarea></td>
     <td><input type=submit value="提交"></td>
     <td>&nbsp;</td>
  </tr>
    <%}else{ %>
  <tr>
     <td>
       <% out.println(info.getId());
       //   j++;
        %>
      </td>
      <td>
       <%
           out.println(info.getEName()); 
        %>
       </td>
      <td>
      <%
        out.println(info.getCName()); %>
      </td>
      <td>
      <% out.println(info.getNName()); %>
      </td>
      <td>
      <% out.println(info.getNum()); %>
      </td>
      <td>
      <% out.println(info.getSex()); %>
      </td>
      <td>
      <% out.println(info.getAge()); %>
      </td>
      <td>
      <% out.println(info.getSchool()); %>
      </td>
      <td>
      <a href="AltInfo.jsp?id=<%=info.getId()%>">修改</a>
      </td>
      <td>
      <a href="javascript:confirmdel('<%=info.getId()%>')">删除</a>
      </td>
      </tr>
      <%}
      } %>  
    </table>
    </form>
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
             <a href="AltInfo.jsp?page=1">首页</a>
             <a href="AltInfo.jsp?page=<%=(currentPage - 1)%>">上页</a>
             <a href="AltInfo.jsp?page=<%=(currentPage + 1)%>">下页</a>
             <a href="AltInfo.jsp?page=<%=pUtil.getPageCount()%>">末页</a></td>
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

