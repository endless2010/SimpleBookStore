<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<jsp:useBean id="find_Password" scope="page" class="bookshop.run.op_user" />



<%String message="";
String find=request.getParameter("find");
System.out.println(find);

if(find!=null&&!find.equals("")){
message="�����û������������!";
String username=request.getParameter("username");
String email=request.getParameter("email");
if(username==null) username="";
if(email==null) email="";
System.out.println(request.getParameter("username"));
//System.out.println(email+".........");

String password=find_Password.findPassword(username,email);
if(!password.equals("")) message="��������Ϊ��"+password+"���μ�!";
}%>

<%@include file="inc/head.inc"%>

<form name="form1" method="post" action="find_password.jsp">
<table width=40% align=center>
<tr><td colspan=2 align=center><font color=red size=5><%=message %></font></td></tr>
<tr><td colspan=2 align=center>�һ�����</td></tr>
<tr><td>�û�����</td>
<td><input type="text" name="username" id="username"/></td></tr>
<tr><td>���䣺</td>
<td><input type="text" name="email" id="email"/></td></tr>
<tr><td rowspan=2 align=right><input type="submit" name="find" value="����˴��һ�"/></td></tr>
</table>
</form>
<%@include file="inc/tail.inc"%>