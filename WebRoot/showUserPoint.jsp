<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page session="true" %>
<%@ page import="bookshop.run.op_buy" %>
<%@ page import="bookshop.book.order" %>
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user" />

<%
String mesg = "";

String Uid = (String) session.getAttribute("userid");
if(Uid==null||Uid.equals(""))
{
   response.sendRedirect("login.jsp?msg=nologin");
}
int point=0;
try {
	point=user.getUserPoint(Uid);
} catch (Exception e) {
	mesg = "出现不可预知错误!";
}
%>

<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>



      <td align="center">
        <p><br><font color="#33FFCC"><b><font color="#0000FF">用户积分等级</font></b></font></p>
<%if (!mesg.equals("")) {
		out.println("<p><font color=red>" + mesg + "</font></p>");
} else {   %>
        <table width="80%" border="1" cellspacing="2" cellpadding="1" bordercolor="white">
          <tr align="center" bgcolor="#DEF3CE">
            <td>您的积分是</td>
            <td><%=point%> </td>
          </tr>
          <tr align="center" bgcolor="#DEF3CE">
            <td>您是</td>
            <td>
<%
                if(point<100)out.print("<img src=images/art1.gif>");
                else if(point>100&&point<=200)out.print("<img src=images/art1.gif><img src=images/art1.gif>");
                else if(point>200&&point<=300)out.print("<img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif>");
                else if(point>300&&point<=400)out.print("<img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif>");
                else if(point>400)out.print("<img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif><img src=images/art1.gif>");
%>级会员
            </td>
          </tr>
        </table>
<%} %>
        <p>&nbsp;</p>
        </td>


<%@include file="inc/tail.inc"%>