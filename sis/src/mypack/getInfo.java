package mypack;

import java.sql.*;
import java.util.Vector;;

public class getInfo {     //定义一个getinfo的类
	private String str;      //定义一个str字符串
	private Connection dbConn;         //声明connection对象，定义接口dbconn
	private int i = 0;             //定义一个整数
	private Info info = new Info();    //声明定义一个info的方法
	StuDB dbc = null;          //声明一个dbc变量，值为空
	
	
	
	public Vector getInformation(){	
		str = "select * from students";
		Vector StuInfo = new Vector();
		try{
			dbc = new StuDB();
			dbConn = dbc.getConnection();
			Statement stmt = dbConn.createStatement();
			ResultSet rs = stmt.executeQuery(str);
			while(rs.next()){
				Info info = new Info();
				info.setId(Integer.parseInt(rs.getString("Id")));
				info.setEnName(rs.getString("EnName"));
				info.setChName(rs.getString("ChName"));
				info.setNiName(rs.getString("NiName"));
				info.setNum(rs.getString("Num"));
				info.setSex(rs.getString("Sex"));
				info.setAge(Integer.parseInt(rs.getString("Age")));
				info.setSchool(rs.getString("School"));
				
				StuInfo.add(info);
				i++;
			}
		}catch(Exception e){
			System.err.println(e);
			System.out.println("tushu");
		}finally{
			try{
				dbc.closeConnection(dbConn);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	return StuInfo;
	}
	
	public int size(){
		return i;
	}
	
	public Info elementAt(Vector order, int i) {
		return (Info) order.elementAt(i);
	}
	
	public boolean delInfo(int id)
	{
		str = "delete from students where Id = " + id;
		try{
			dbc = new StuDB();
			dbConn = dbc.getConnection();
			Statement stmt = dbConn.createStatement();
			stmt.execute(str);
			dbConn.close();
			return true;
			}catch(Exception e){
			e.printStackTrace();
			return false;
		}	
    }
	
	public boolean altInfo(int id,String ename,String cname,String nname,String num,String sex,int age,String school){
		str = "update students set EnName='" + ename + "',ChName='" + cname + "',NiName='"+nname+"',Num='" + num + "',Sex='" + sex + "',Age=" + age + ",School='" + school + "' where Id=" + id;
		try{
			dbc = new StuDB();
			dbConn = dbc.getConnection();
			Statement stmt = dbConn.createStatement();
			stmt.execute(str);
			dbConn.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean addInfo(String ename,String cname,String nname,String num,String sex,int age,String school){
		str = "insert into students(EnName,ChName,NiName,Num,Sex,Age,School)values('"+ename+"','"+cname+"','"+nname+"','"+num+"','"+sex+"',"+age+",'"+school+"')";
		try{
			dbc = new StuDB();
			dbConn = dbc.getConnection();
			Statement stmt = dbConn.createStatement();
			stmt.execute(str);
			dbConn.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}

