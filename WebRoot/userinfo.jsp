<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page session="true" %>
<%@ page import="bookshop.run.op_buy" %>
<%@ page import="bookshop.book.order" %>
<%@ page import="bookshop.book.*" %>
<jsp:useBean id="user1" scope="page" class="bookshop.run.op_user" />

<%
String mesg = "";
String id="";
String name="";
String passwd="";
String phone="";
String sex="";
String post="";
int point=0;
String email="";
String address="";
long id1=0;
String Uid = (String) session.getAttribute("userid");
if(Uid==null||Uid.equals(""))
{
   response.sendRedirect("login.jsp?mesg=nologin");

}

try{
id1=Long.parseLong(Uid);
if(user1.getUserinfo(id1)){
user userinfo = (user) user1.getUserlist().elementAt(0);
 id=userinfo.getUserName();
 name=userinfo.getNames();
 passwd=userinfo.getPassWord();
 phone=userinfo.getPhone();
 sex=userinfo.getSex();
 post=userinfo.getPost();
 point=userinfo.getUserPoint();
 email=userinfo.getEmail();
address=userinfo.getAddress();
}
} catch (Exception e) {
	mesg = "出现错误!";
}
%>
<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>

        <p><br><font color="#33FFCC"><b><font color="#0000FF">用户资料：</font></b></font></p>
<%if (!mesg.equals("")) {
		out.println("<p><font color=red>" + mesg + "</font></p>");
} else {   %>
        <table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="white">
        <tr><td rowspan=20 ><%@include file="inc/left.inc" %></td></tr>
          <tr align="center" bgcolor="#DEF3CE">
            <td>欢迎您：</td>
            <td><%=id%> </td>
          </tr>
          <tr align="center" bgcolor="#DEF3CE">
                        <td>姓名</td>
            <td><%=name%></td></tr><tr align="center" bgcolor="#DEF3CE">
                        <td>密码</td>
            <td><%=passwd%></td></tr><tr align="center" bgcolor="#DEF3CE">
                        <td>性别</td>
            <td><%=sex%></td></tr><tr align="center" bgcolor="#DEF3CE">
                        <td>联系方式</td>
            <td><%=phone%></td></tr><tr align="center" bgcolor="#DEF3CE">
                        <td>电子邮箱</td>
            <td><%=email%></td></tr><tr align="center" bgcolor="#DEF3CE">
                        <td>地址</td>
            <td><%=address%></td></tr><tr align="center" bgcolor="#DEF3CE">
                         <td>邮编</td>
            <td><%=post%></td></tr><tr align="center" bgcolor="#DEF3CE">
                          <td>积分</td>
            <td><%=point%></td></tr>
        <tr><td align="center" colspan=2><a href="modifyUser.jsp?userid="<%=id1 %>">修改资料</a><td></tr></table>
<%} %>
        <p>&nbsp;</p>
        </td>
<%@include file="inc/tail.inc"%>