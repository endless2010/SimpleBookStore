<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*"%> 
<html> 
<body> 
<%
//����jdbc-odbc��������
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

//ͨ������Դ���ӣ�
String url ="jdbc:odbc:bookstore";String login = "sa";String password ="sa";
Connection conn = DriverManager.getConnection(url,login,password);

//ͨ����������IP���ӣ�
//String url = "jdbc:odbc:Driver={SQL Server};Server=127.0.0.1;uid=sa;pwd=sa;Database=bookstore";

//Connection conn = DriverManager.getConnection(url);
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select * from test"; 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {%> 
���ĵ�һ���ֶ�����Ϊ��<%=rs.getString(1)%> <br>
���ĵڶ����ֶ�����Ϊ��<%=rs.getString(2)%> <br>
<%}%> 
<%out.print("���ݿ�����ɹ�����ϲ��");%> 
<%rs.close(); 
stmt.close(); 
conn.close(); 
%> 
</body> 
</html> 
