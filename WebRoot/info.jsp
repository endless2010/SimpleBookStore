<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%
String username = (String)session.getAttribute("username");
if ( username == null || username.equals("") ){
	response.sendRedirect("login.jsp?msg=nologin");
}
%>
<%@ page import="bookshop.run.op_buy" %>
<%@ page import="bookshop.book.order" %>
<jsp:useBean id="my_order"  scope="page" class="bookshop.run.op_buy" />

<%
order order=null;
String mesg = "";
String Uid = (String) session.getAttribute("userid");
long uid = 0;
try {
	uid = Long.parseLong(Uid);
} catch (Exception e) {
	uid =0;
	mesg = "��δ��¼����&nbsp;&nbsp;  [<a href=\"login.jsp\">��¼</a>]  &nbsp;&nbsp;��!";
}
if (!my_order.getOrder(uid))
	mesg = "���ڱ�վ��û�й����ͼ�顣"	;
%>


<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%@include file="/inc/head.inc"%>
<%@include file="/inc/sub.inc"%>



      <td align=center>
        <p><br><font color="#33FFCC"><b><font color="#0000FF">���Ķ�����Ϣ</font></b></font></p>

<%if (!mesg.equals("")) {
		out.println("<p><font color=red>" + mesg + "</font></p>");
} else {   %>
        <table width="80%" border="1" cellspacing="2" cellpadding="1" bordercolor="white">
          <tr align="center" bgcolor="#DEF3CE">
            <td>������</td>
            <td>�ύʱ��</td>
            <td>�ܽ��</td>
            <td>����</td>
            <td>����</td>
            <td>����</td>
          </tr>
	<%for (int i = 0; i<my_order.getAllorder().size();i++){
		order = (order) my_order.getAllorder().elementAt(i);
			%>
          <tr>
            <td><font color=red><%=order.getOrderId() %></font></td>
            <td align="center"><%= order.getSubmitTime() %></td>
            <td align="center"><%= order.getTotalPrice() %></td>
            <td align="center">
			<% if (order.getIsPayoff() )
					out.print("�Ѹ���");
				else
					out.print("δ��");
			%></td>
            <td align="center">
			<% if (order.getIsSales())
					out.print("�ѷ���");
				else
					out.print("δ����");
			%></td>
            <td align="center"><a href="order.jsp?id=<%= order.getId() %>&orderno=<%=order.getOrderId() %>" >�鿴</a></td>
          </tr>
		<%}%>
        </table>
<%} %>
        <p>&nbsp;</p>
        </td>


<%@include file="/inc/tail.inc"%>
