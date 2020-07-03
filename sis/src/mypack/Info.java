package mypack;

public class Info {
     private int Id;
     private String EnName = null;
     private String ChName = null;
     private String NiName = null;
     private String Num = null;
     private String Sex = null;
     private int Age;
     private String School = null;
     
     public int getId(){
    	 return Id;
     }
     
     public String getEName(){
    	 return EnName;
     }
     
     public String getCName(){
    	 return ChName;
     }
     
     public String getNName(){
    	 return NiName;
     }
     
     public String getNum(){
    	 return Num;
     }
     
     public String getSex(){
    	 return Sex;
     }
    
     public int getAge(){
    	 return Age;
     }
     
     public String getSchool(){
    	 return School;
     }
     
     public void setId(int id){
    	 Id = id;
     }
     
     public void setEnName(String ename){
    	 EnName = ename;
     }
     
     public void setChName(String cname){
    	 ChName = cname;
     }
     
     public void setNiName(String nname){
    	 NiName = nname;
     }
     
     public void setNum(String num){
    	 Num = num;
     }
     
     public void setSex(String sex){
    	 Sex = sex;
     }
     
     public void setAge(int age){
    	 Age = age;
     }
     
     public void setSchool(String school){
    	 School = school;
     }
}
