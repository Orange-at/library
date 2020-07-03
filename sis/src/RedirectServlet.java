import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RedirectServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,
	                    HttpServletResponse response)
	            throws IOException,ServletException{
	  
	  // 此处添加若干代码
		String name=request.getParameter("username");
		String word=request.getParameter("password");
	  if(name.equals("admin")&&word.equals("password")){
	     response.sendRedirect("welcome.html");
	  }else{
	     response.sendRedirect("error.html");
	  }
	}
	public void init() throws ServletException{
	}
	
}
