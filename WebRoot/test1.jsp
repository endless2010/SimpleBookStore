<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*"%> 
<html> 
<body> 
<%
//加载jdbc-odbc驱动程序
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

//通过数据源连接：
String url ="jdbc:odbc:bookstore";String login = "sa";String password ="sa";
Connection conn = DriverManager.getConnection(url,login,password);

//通过机器名或IP连接：
//String url = "jdbc:odbc:Driver={SQL Server};Server=127.0.0.1;uid=sa;pwd=sa;Database=bookstore";

//Connection conn = DriverManager.getConnection(url);
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select * from test"; 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {%> 
您的第一个字段内容为：<%=rs.getString(1)%> <br>
您的第二个字段内容为：<%=rs.getString(2)%> <br>
<%}%> 
<%out.print("数据库操作成功，恭喜你");%> 
<%rs.close(); 
stmt.close(); 
conn.close(); 
%> 
</body> 
</html> 
