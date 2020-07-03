<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mypack.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	function confirmdel(a) //利用confirm()函数生成一个信息弹出框
	{
		if(confirm("确定要删除该图书信息？"))//弹出框中的内容
		{
			window.location.href="DelInfo.jsp?id=" + a;//连接到delinfo界面，并传递对应参数
		}
	}
	</script>
    <link href="css/1.css" rel="stylesheet" type="text/css">
  </head>
  
 
  <body>

  <div id="container">
  	<div id="Header"></div>
	<div id="PageBody">
		<div id="SiderBody">
		<div id="login">
		<form id="user" name="user">
			<h3>欢迎登陆图书管理系统</h3>
			
			<a href="findpassword.html" mar>找回密码</a>
		</form>
		<form method="post" action="GetInfo.jsp">
		<input type="text" name="num">
		<input type="submit" value="通过编号或者版号查询查询">	
		</form>
		</div>
		</div>
	    <div id="MainBody">
	    <form method="post" action="AddInfo.jsp">
	    <table id="student">
	    <tr>
	    	<th> <img src="img/bianhao.png" alt="编号"/> </th>
	        <th>英文书名</th>
	        <th>中文书名</th>
	        <th>作者</th>
	        <th>版号</th>
	        <th>实体书</th>
	        <th>价格</th>
	        <th>出版商</th>
	        <th>修改</th>
       		<th>删除</th>
	    <tr>
	          <%
  getInfo getinfo = new getInfo();
  Vector v = getinfo.getInformation();
  int recordCount = getinfo.size();
  String pageStr = request.getParameter("page");
  int currentPage = 1;
  
   if (pageStr != null)        //非第一现实时
          currentPage = Integer.parseInt(pageStr);     //取得要显示的页面编号（页面从1开始  1 2 3 4 ...）  
          Pageutil pUtil = new Pageutil(10, recordCount, currentPage); //Pageutil(每页显示的条数 , 总共的条数 , 当前页面 )
  
  //int j = 0;
  for(int i = pUtil.getFromIndex(); i < pUtil.getToIndex(); i++)
  {
     Info info =  getinfo.elementAt(v,i);
  %>
      <tr>
        <td><% out.println(info.getId());
       //   j++;
        %>
        </td>
        <td><%
           out.println(info.getEName()); 
        %>
        </td>
        <td><%
        out.println(info.getCName()); %>
        </td>
        <td><% out.println(info.getNName()); %>
        </td>
        <td><% out.println(info.getNum()); %>
        </td>
        <td><% out.println(info.getSex()); %>
        </td>
        <td><% out.println(info.getAge()); %>
        </td>
        <td><% out.println(info.getSchool()); %>
        </td>
        <td><a href="AltInfo.jsp?id=<%=info.getId()%>">修改</a> </td>
        <td><a href="javascript:confirmdel('<%=info.getId()%>')">删除</a> </td>
      </tr>
      <%} %>
  
       <tr>  
        <td height="42">添加</td>
        <td><input type="text" value="" name="EName" size="8" /></td>
        <td><input type="text" name="CName" size="8" /></td>
        <td><input type="text" name="NName" size="8" /></td>
        <td><input type="text" name="Num" size="8" /></td>
        <td><select name="Sex">
            <option value="是">是</option>
          <option value="否">否</option>
        </select></td>
        <td><input type="text" name=Age size="4" /></td>
        <td><textarea cols="10" rows="1" name=School></textarea></td>
        <td><input name="submit" type=submit value="添加"></td>
        <td><input name="reset" type=reset value="清空"></td>        
      </tr>
  
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
             <a href="index.jsp?page=1">首页</a>
             <a href="index.jsp?page=<%=(currentPage - 1)%>">上页</a>
             <a href="index.jsp?page=<%=(currentPage + 1)%>">下页</a>
             <a href="index.jsp?page=<%=pUtil.getPageCount()%>">末页</a></td>
            </tr> 
    </table>
	</div>
	</div>
<div class="clear" />
<div id="Footer">
图书管理系统 2020
</div>
</div>
</body>
</html>

