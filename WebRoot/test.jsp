<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*"%> 
<html> 
<body> 
<%Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance(); 
String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=bookstore"; 
//pubsΪ������ݿ�� 
String user="sa"; 
String password="sa"; 
Connection conn= DriverManager.getConnection(url,user,password); 
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select * from test"; 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {%> 
���ĵ�һ���ֶ�����Ϊ��<%=rs.getString(1)%> 
���ĵڶ����ֶ�����Ϊ��<%=rs.getString(2)%> 
<%}%> 
<%out.print("���ݿ�����ɹ�����ϲ��");%> 
<%rs.close(); 
stmt.close(); 
conn.close(); 
%> 
</body> 
</html> 

