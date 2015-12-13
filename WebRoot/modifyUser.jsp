<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%
if (session.getAttribute("userid")==null || session.getAttribute("userid")==""){
	response.sendRedirect("login.jsp?msg=nologin");
} %>
<%@ page import="bookshop.book.*" %>
<jsp:useBean id="user1" scope="page" class="bookshop.run.op_user" />
<%
long userid=0;
String mesg = "";
long id=0;
String submit = request.getParameter("submit");
String Uid = (String) session.getAttribute("userid");
try{
id=Long.parseLong(Uid);
}catch(Exception e){
mesg="出现错误";
}
if (submit!=null && !submit.equals("")){
	if(user1.update(request)){
		mesg = "用户资料修改成功！";
	}else {
		mesg = "对不起，你提交的参数有错误!"+  user1.getMessage();;
	}
	}

%>

<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="books.css" type="text/css">
<script language="javascript">

function checkform() {
	if (document.form1.username.value==""){
		alert("用户名不能为空");
		document.form1.username.focus();
		return false;
	}
	if (document.form1.passwd.value==""){
		alert("用户密码不能为空");
		document.form1.passwd.focus();
		return false;
	}
	if (document.form1.passwd.value!=document.form1.passconfirm.value){
		alert("确认密码不相符！");
		document.form1.passconfirm.focus();
		return false;
	}

	return true;
}

</script>
<body bgcolor="#FFCC99" text="#000000">
<div align="center">
        <p>修改用户资料:</p>
		<% if (!mesg.equals("")){
			out.println("<font color=red>"+ mesg +"</font><br><br>");
		} else {
			if(user1.getUserinfo(id)){
            user userinfo = (user) user1.getUserlist().elementAt(0);
		%>
	<table width="95%" border="0" cellspacing="0" cellpadding="0" bordercolor="#2DAE2D">
	<tr><td bordercolor="white" rowspan=20 ><%@include file="inc/left.inc" %></td></tr>
	<FORM name="form1" METHOD=POST ACTION="modifyUser.jsp">
	  <tr><td align=left width=100>用户名</td>
	    <td><%=userinfo.getUserName() %></td></tr>
	  <tr><td align=left width=100>用户密码:</td>
		<td><input type="password" name="passwd" maxlength="20" size="14" value="<%= userinfo.getPassWord() %>" ></td></tr>
	  <tr><td align=left width=100>确认密码:</td>
		<td><input type="password" name="passconfirm" maxlength="20" size="14" value="<%= userinfo.getPassWord() %>" ></td></tr>
	  <tr><td align=left width=100>用户真名</td>
		<td> <input type="text" name="names" maxlength="20" size="14" value="<%= userinfo.getNames() %>" ></td></tr>
	  <tr><td align=left width=100>性别</td>
	    <td><select name="sex">
            <option <% if (userinfo.getSex().equals("男")) out.print("selected"); %> >男</option>
            <option <% if (userinfo.getSex().equals("女")) out.print("selected"); %> >女</option>
          </select>
			</td></tr>
	  <tr><td align=left width=100>联系地址</td>
		<td><input type="text" name="address" maxlength="150" size="40" value="<%= userinfo.getAddress() %>" ></td></tr>
	  <tr><td align=left width=100>联系电话</td>
		<td><input type="text" name="phone" maxlength="25" size="16" value="<%= userinfo.getPhone() %>" ></td></tr>
	  <tr><td align=left width=100>邮编</td>
		<td><input type="text" name="post" maxlength="8" size="8" value="<%= userinfo.getPost() %>" ></td></tr>
	  <tr><td align=left width=100>电子邮件</td>
		<td><input type="text" name="email" maxlength="50" size="25" value="<%= userinfo.getEmail() %>" ></td></tr>
	  <tr><td align=left width=100>&nbsp;</td>
		<td><INPUT TYPE="hidden" name="userid" value="<%= userinfo.getId() %>">
			<INPUT TYPE="submit" name="submit" value="修改" onclick="return(checkform());">
			<INPUT TYPE="reset" name="reset" value="取消"></td></tr>
	</FORM>
  </table>
  <br>
<%}}%>
  <br>
</div>
</body>
<%@include file="inc/tail.inc"  %>
