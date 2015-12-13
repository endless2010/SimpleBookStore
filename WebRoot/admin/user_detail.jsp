<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%
if (session.getAttribute("admin")==null || session.getAttribute("admin")==""){
	response.sendRedirect("error.htm");
} %>
<%@ page import="bookshop.book.*" %>
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user" />
<%
long userid=0;
String mesg = "";

if (request.getParameter("userid")!=null && !request.getParameter("userid").equals("")) {
	try {
		userid = Long.parseLong(request.getParameter("userid"));
		//out.print(userid);
				if (!user.getUserinfo(userid)) {
			mesg = "要查询的用户信息不存在";
		}
	} catch(Exception e) {
		mesg = "该用户号不存在!";
	}
}

if (request.getParameter("action")!=null && request.getParameter("action").equals("del")){
	try{
		long id = Long.parseLong(request.getParameter("userid"));
		if (user.delete(id)) {
			mesg = "删除操作成功";
		} else {
			mesg = "删除操作出错";
		}
	} catch (Exception e) {
		mesg = "你要删除的用户号错误";
	}
}

%>

<%@include file="../inc/head.inc" %>
<body bgcolor="#FFCC99" text="#000000" onload="javascript:window.focus();">
<div align="center">


        <p>用户详细情况:</p>
		<% if (!mesg.equals("")){
			out.println("<font color=red>"+ mesg +"</font><br><br>");
		} else {
			user userinfo = (user)user.getUserlist().elementAt(0);
		%>
	<table width="95%" border="0" cellspacing="1" cellpadding="1" bordercolor="#2DAE2D">
	  <tr><td align=right width=40%>用户名:</td><td><%= userinfo.getUserName() %></td></tr>
	  <tr><td align=right width=40%>用户真名:</td><td><%= userinfo.getNames() %></td></tr>
	  <tr><td align=right width=40%>性别:</td><td><%= userinfo.getSex() %></td></tr>
	  <tr><td align=right width=40%>联系地址:</td><td><%= userinfo.getAddress() %></td></tr>
	  <tr><td align=right width=40%>联系电话:</td><td><%= userinfo.getPhone() %></td></tr>
	  <tr><td align=right width=40%>邮编:</td><td><%= userinfo.getPost() %></td></tr>
	  <tr><td align=right width=40%>电子邮件:</td><td><%= userinfo.getEmail() %></td></tr>
	  <tr><td align=right width=40%>用户积分:</td><td><%= userinfo.getUserPoint() %></td></tr>
	  <tr><td align=right width=40%>注册来源:</td><td><%= userinfo.getRegIpAddress() %></td></tr>
	  <tr><td align=right width=40%>注册时间:</td><td><%= userinfo.getRegTime() %></td></tr>
  
  <br>
  <tr><td align=right><a href="user_modify.jsp?userid=<%= userinfo.getId()%>">修改</a></td>
  <td align=left><a href="user_detail.jsp?action=del&userid=<%=userinfo.getId() %>" onclick="return(confirm('你真的要删除这个用户?'))">删除</a></td></tr>
<%}%>
</table>
  <br>
</div>
</body>
<%@include file="../inc/tail.inc" %>
