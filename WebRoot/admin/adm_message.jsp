<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%@ page import="bookshop.book.message" %>
<%@ page import="java.util.*" %>
<%@ page import="bookshop.util.*" %>
<jsp:useBean id="msg" scope="page" class="bookshop.run.op_message" />
<jsp:useBean id="book" scope="page" class="bookshop.book.book" />

<%@include file="../inc/adm_head.inc"%>
<table align=center width=62% border=1 cellspacing="1" cellpadding="1" >
<%
if(msg.getAllMessage()){
int number=msg.getNum();
for(int i=0;i<number;i++){
message theMessage=(message)msg.getMessageList().elementAt(i);
 %>    
 <form name="form2" action="delete_message.jsp">
         <input type=hidden name="getId" value="<%=theMessage.getId()%>"/>
        <tr align="center" bgcolor="#DEF3CE">
          <td width=20% align=center><%=i+1%></td>
          <td width=20% align=center><%= theMessage.getUsername()%></td>
            <td width=20% align="center"><%= dataFormat.toHtml(theMessage.getMessage()) %></td>
          <TD width=20%><input type="submit" id="submit" value="É¾³ý"></TD>

          </tr>
</form>
<%
}
}%>
  <TR><TD colspan=3 align=center>
 </table>
<%@include file="../inc/tail.inc" %>
