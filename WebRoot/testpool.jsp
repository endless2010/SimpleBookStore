<html>

<%@page contentType="text/html;charset=gb2312"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<body>
this is a tomcat datasource pool example <br>


<% 

InitialContext ctx=null;
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
DataSource ds = null;
try
{


 ctx=new InitialContext();
if(ctx==null)throw new Exception("û��ƥ��������Ļ���");

ds=(DataSource)ctx.lookup("java:comp/env/jdbc/SqlServermidp");
if(ds==null)throw new Exception("û��ƥ������ݿ�");
 conn = ds.getConnection();



 stmt = conn.createStatement();
String strSql = " select * from test";
 rs = stmt.executeQuery(strSql);
              
        


while(rs.next()) 
{ 
out.println(rs.getString(1)); %><br> 
<% 
} 
out.println("���ݿ����ӳɹ�!!!"); 
}
catch(Exception e)
{
out.println(e.toString());
}

finally
{
if(rs!=null)
rs.close();
if(stmt!=null)
stmt.close();
if(conn!=null)
conn.close();
if(ctx!=null)
ctx.close();
}

%>
</body>
</html>
