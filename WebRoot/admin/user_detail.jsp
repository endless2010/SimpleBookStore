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
			mesg = "Ҫ��ѯ���û���Ϣ������";
		}
	} catch(Exception e) {
		mesg = "���û��Ų�����!";
	}
}

if (request.getParameter("action")!=null && request.getParameter("action").equals("del")){
	try{
		long id = Long.parseLong(request.getParameter("userid"));
		if (user.delete(id)) {
			mesg = "ɾ�������ɹ�";
		} else {
			mesg = "ɾ����������";
		}
	} catch (Exception e) {
		mesg = "��Ҫɾ�����û��Ŵ���";
	}
}

%>

<%@include file="../inc/head.inc" %>
<body bgcolor="#FFCC99" text="#000000" onload="javascript:window.focus();">
<div align="center">


        <p>�û���ϸ���:</p>
		<% if (!mesg.equals("")){
			out.println("<font color=red>"+ mesg +"</font><br><br>");
		} else {
			user userinfo = (user)user.getUserlist().elementAt(0);
		%>
	<table width="95%" border="0" cellspacing="1" cellpadding="1" bordercolor="#2DAE2D">
	  <tr><td align=right width=40%>�û���:</td><td><%= userinfo.getUserName() %></td></tr>
	  <tr><td align=right width=40%>�û�����:</td><td><%= userinfo.getNames() %></td></tr>
	  <tr><td align=right width=40%>�Ա�:</td><td><%= userinfo.getSex() %></td></tr>
	  <tr><td align=right width=40%>��ϵ��ַ:</td><td><%= userinfo.getAddress() %></td></tr>
	  <tr><td align=right width=40%>��ϵ�绰:</td><td><%= userinfo.getPhone() %></td></tr>
	  <tr><td align=right width=40%>�ʱ�:</td><td><%= userinfo.getPost() %></td></tr>
	  <tr><td align=right width=40%>�����ʼ�:</td><td><%= userinfo.getEmail() %></td></tr>
	  <tr><td align=right width=40%>�û�����:</td><td><%= userinfo.getUserPoint() %></td></tr>
	  <tr><td align=right width=40%>ע����Դ:</td><td><%= userinfo.getRegIpAddress() %></td></tr>
	  <tr><td align=right width=40%>ע��ʱ��:</td><td><%= userinfo.getRegTime() %></td></tr>
  
  <br>
  <tr><td align=right><a href="user_modify.jsp?userid=<%= userinfo.getId()%>">�޸�</a></td>
  <td align=left><a href="user_detail.jsp?action=del&userid=<%=userinfo.getId() %>" onclick="return(confirm('�����Ҫɾ������û�?'))">ɾ��</a></td></tr>
<%}%>
</table>
  <br>
</div>
</body>
<%@include file="../inc/tail.inc" %>
