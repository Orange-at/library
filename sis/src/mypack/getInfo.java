package mypack;

import java.sql.*;
import java.util.Vector;;

public class getInfo {     //����һ��getinfo����
	private String str;      //����һ��str�ַ���
	private Connection dbConn;         //����connection���󣬶���ӿ�dbconn
	private int i = 0;             //����һ������
	private Info info = new Info();    //��������һ��info�ķ���
	StuDB dbc = null;          //����һ��dbc������ֵΪ��
	
	
	
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

