<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>

<%@ page session="true" %>
<jsp:useBean id="login" scope="page" class="bookshop.run.login" />
<%
String mesg = "";

if( request.getParameter("username")!=null && !request.getParameter("username").equals("")){
	String username =request.getParameter("username");
	String passwd = request.getParameter("passwd");
	username = new String(username.getBytes("ISO8859-1"));
	passwd = new String(passwd.getBytes("ISO8859-1"));
	login.setUsername(username);
	login.setPasswd(passwd);
	out.print(username+passwd);
	if(username==null||username==""||passwd==null||passwd==""){
	%>
	<% }
	else if (login.excute()){
		session.setAttribute("username",username);
		String userid = Long.toString(login.getUserid());
		session.setAttribute("userid",userid);
		response.sendRedirect("booklist.jsp");
		%>
<%
	}else {
	mesg = "登录出错！"	;
	}
}
%>
<%@include file="/inc/head.inc"%>

<script language="javascript">

 function checkform() {
	if (document.form1.username.value=="" || document.form1.passwd.value==""){
		alert("用户名或密码为空！");
		return false;
	}
	return true;

  }

</script>
<div align=center>用户登录 </div>
          <br>
<% if (!mesg.equals("")){
						out.println("<p>" + mesg + "</p>");}%>

  <form name="form1" method="post" action="login.jsp">
    <table width="400" border="0" cellspacing="1" cellpadding="1" align="center">
    <tr>
      <td width="147" align="right">用户名：<br>
      </td>
      <td width="246" valign="top">
          <input type="text" name="username" size="16" maxlength="25">
        </td>
    </tr>
    <tr>
      <td width="147" align="right">密码：</td>
      <td width="246" valign="top">
          <input type="password" name="passwd" maxlength="20" size="16">
        </td>
    </tr>
    <tr>
      <td width="147" align="right">&nbsp;</td>
      <td width="246" valign="top">
          <input type="submit" name="Submit" value="登录" onclick="javascript:return(checkform());">
          <input type="reset" name="Submit2" value="取消">
        </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <p>&nbsp;</p>
        测试用户：test 密码：test
      </td>
    </tr>
    <tr>

      <td colspan="2" align="center">
        <p>&nbsp;</p>
        <p>如果你还不是本站用户，请在此<a href="reg.jsp">注册</a></p>
      </td>
    </tr>
  </table>
    </form>
 <%@include file="/inc/tail.inc"%>
