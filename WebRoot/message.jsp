<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%@ page import="bookshop.book.message" %>
<%@ page import="java.util.*" %>
<%@ page import="bookshop.util.*" %>
<jsp:useBean id="msg" scope="page" class="bookshop.run.op_message" />
<jsp:useBean id="book" scope="page" class="bookshop.book.book" />

<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>
<table width=100% border=1 cellspacing="1" cellpadding="1" >
<tr>
<th>���</th>
<th>�û���</th>
<th>����</th>
<th>����ʱ��</th></tr>
<%
if(msg.getAllMessage()){
int number=msg.getNum();
for(int i=0;i<number;i++){
message theMessage=(message)msg.getMessageList().elementAt(i);
 %>    
    <tr align="center" bgcolor="#DEF3CE">
       <td width=20% align=center><%=i+1%></td>
       <td width=20% align=center><%= theMessage.getUsername()%></td>
       <td width=20% align="center"><%= dataFormat.toHtml(theMessage.getMessage()) %></td>
       <td width=20% align=center><%=theMessage.getTime()%></td>
   </tr>

<%
}
}%>
  <TR><TD colspan=3 align=center>
  <A href="add_message.jsp">��Ҫ����</A></TD></TR>
 </table>

 <table width="90%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td align="right">�ܼƽ��Ϊ<%=msg.getNum()%>��&nbsp;
             </td>
          </tr>
 </table>
 
 <%@include file="inc/tail.inc" %>