<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%@ page import="bookshop.book.message" %>
<%@ page import="java.util.*" %>
<%@ page import="bookshop.util.*" %>
<%@ page import="bookshop.book.user" %>
<jsp:useBean id="user1" scope="page" class="bookshop.run.op_user" />
<jsp:useBean id="myMessage" scope="page" class="bookshop.run.op_message" />
<%
if (session.getAttribute("userid")==null || session.getAttribute("userid")==""){
	response.sendRedirect("login.jsp?msg=nologin");
} %>

<%
String uid=(String)session.getAttribute("userid");
int id=0;
String username="";
try{
id=Integer.parseInt(uid);
if(user1.getUserinfo(id)){
user userinfo = (user) user1.getUserlist().elementAt(0);
 username=userinfo.getUserName();
}

}
catch(Exception e){}
	Date d=new Date();
	String time=d.toLocaleString();
String submit= request.getParameter("submit");
if(submit!=null&&!submit.equals("")){
   String content=(String)request.getParameter("user_content");
    message theMessage=new message();
    theMessage.setUserid(id);
    theMessage.setUsername(username);
    theMessage.setMessage(dataFormat.toGb(content)); 
    theMessage.setTime(time);
    System.out.println("a");
    myMessage.setMessage(theMessage);
     System.out.println("a");
    if(myMessage.insert())
  response.sendRedirect("message_ok.jsp");
} %>

<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>

<script language="javascript">

</script>
 
 <input type=hidden name="user_id" value="<%=id %>">
  <input type=hidden name="user_name" value="<%=username %>">
 <table width=80% align=center>
<form id="form1" action="add_message.jsp"><TEXTAREA name="user_content" id="user_content" ROWS="20" COLS="100">留言：</TEXTAREA><br>
<tr><td align=right><input type=submit name="submit" value="提交"></td>
     <td align=left><a href="add_message.jsp">取消</a></td></tr>
 </form></table>
<%@include file="inc/tail.inc"%>