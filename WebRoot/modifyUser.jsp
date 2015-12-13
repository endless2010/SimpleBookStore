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
mesg="���ִ���";
}
if (submit!=null && !submit.equals("")){
	if(user1.update(request)){
		mesg = "�û������޸ĳɹ���";
	}else {
		mesg = "�Բ������ύ�Ĳ����д���!"+  user1.getMessage();;
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
		alert("�û�������Ϊ��");
		document.form1.username.focus();
		return false;
	}
	if (document.form1.passwd.value==""){
		alert("�û����벻��Ϊ��");
		document.form1.passwd.focus();
		return false;
	}
	if (document.form1.passwd.value!=document.form1.passconfirm.value){
		alert("ȷ�����벻�����");
		document.form1.passconfirm.focus();
		return false;
	}

	return true;
}

</script>
<body bgcolor="#FFCC99" text="#000000">
<div align="center">
        <p>�޸��û�����:</p>
		<% if (!mesg.equals("")){
			out.println("<font color=red>"+ mesg +"</font><br><br>");
		} else {
			if(user1.getUserinfo(id)){
            user userinfo = (user) user1.getUserlist().elementAt(0);
		%>
	<table width="95%" border="0" cellspacing="0" cellpadding="0" bordercolor="#2DAE2D">
	<tr><td bordercolor="white" rowspan=20 ><%@include file="inc/left.inc" %></td></tr>
	<FORM name="form1" METHOD=POST ACTION="modifyUser.jsp">
	  <tr><td align=left width=100>�û���</td>
	    <td><%=userinfo.getUserName() %></td></tr>
	  <tr><td align=left width=100>�û�����:</td>
		<td><input type="password" name="passwd" maxlength="20" size="14" value="<%= userinfo.getPassWord() %>" ></td></tr>
	  <tr><td align=left width=100>ȷ������:</td>
		<td><input type="password" name="passconfirm" maxlength="20" size="14" value="<%= userinfo.getPassWord() %>" ></td></tr>
	  <tr><td align=left width=100>�û�����</td>
		<td> <input type="text" name="names" maxlength="20" size="14" value="<%= userinfo.getNames() %>" ></td></tr>
	  <tr><td align=left width=100>�Ա�</td>
	    <td><select name="sex">
            <option <% if (userinfo.getSex().equals("��")) out.print("selected"); %> >��</option>
            <option <% if (userinfo.getSex().equals("Ů")) out.print("selected"); %> >Ů</option>
          </select>
			</td></tr>
	  <tr><td align=left width=100>��ϵ��ַ</td>
		<td><input type="text" name="address" maxlength="150" size="40" value="<%= userinfo.getAddress() %>" ></td></tr>
	  <tr><td align=left width=100>��ϵ�绰</td>
		<td><input type="text" name="phone" maxlength="25" size="16" value="<%= userinfo.getPhone() %>" ></td></tr>
	  <tr><td align=left width=100>�ʱ�</td>
		<td><input type="text" name="post" maxlength="8" size="8" value="<%= userinfo.getPost() %>" ></td></tr>
	  <tr><td align=left width=100>�����ʼ�</td>
		<td><input type="text" name="email" maxlength="50" size="25" value="<%= userinfo.getEmail() %>" ></td></tr>
	  <tr><td align=left width=100>&nbsp;</td>
		<td><INPUT TYPE="hidden" name="userid" value="<%= userinfo.getId() %>">
			<INPUT TYPE="submit" name="submit" value="�޸�" onclick="return(checkform());">
			<INPUT TYPE="reset" name="reset" value="ȡ��"></td></tr>
	</FORM>
  </table>
  <br>
<%}}%>
  <br>
</div>
</body>
<%@include file="inc/tail.inc"  %>
