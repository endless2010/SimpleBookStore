<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user" />
<jsp:useBean id="login" scope="page" class="bookshop.run.login" />
<%
String mesg = "";
String submit = request.getParameter("Submit");

if (submit!=null && !submit.equals("")) {
   String username=request.getParameter("username");
	if(login.check(username)) {
     response.sendRedirect("reg_wrong.jsp");
    }else{
     
		if(user.add(request)){
		session.setAttribute("username",user.getUserName());
		session.setAttribute( "userid", Long.toString( user.getUserid() ) );
		response.sendRedirect("info.jsp?action=regok");

	} else if (!user.getMessage().equals("")) {
		mesg = user.getMessage();
	} else
		mesg = "ע��ʱ���ִ������Ժ�����";
     }
     }
%>
<SCRIPT language="JavaScript">
function check()
{
   if(checkspace(document.userinfo.username.value)) {
	document.userinfo.username.focus();
    alert("�û�������Ϊ�գ����������룡");
	return false;
  }
    if(checkspace(document.userinfo.username.value) || document.userinfo.username.value.length< 4) {
	document.userinfo.username.focus();
    alert("�û������Ȳ���С��4�����������룡");
	return false;
  }
    if(checkspace(document.userinfo.passwd.value) || document.userinfo.passwd.value.length < 6) {
	document.userinfo.userpassword.focus();
    alert("���볤�Ȳ���С��6�����������룡");
	return false;
  }
    if(document.userinfo.passwd.value != document.userinfo.passconfirm.value) {
	document.userinfo.passwd.focus();
	document.userinfo.passwd.value = '';
	document.userinfo.passconfirm.value = '';
    alert("������������벻ͬ�����������룡");
	return false;
  }

 if(document.userinfo.email.value.length!=0)
  {
    if (document.userinfo.email.value.charAt(0)=="." ||        
         document.userinfo.email.value.charAt(0)=="@"||       
         document.userinfo.email.value.indexOf('@', 0) == -1 || 
         document.userinfo.email.value.indexOf('.', 0) == -1 || 
         document.userinfo.email.value.lastIndexOf("@")==document.userinfo.email.value.length-1 || 
         document.userinfo.email.value.lastIndexOf(".")==document.userinfo.email.value.length-1)
     {
      alert("Email��ַ��ʽ����ȷ��");
      document.userinfo.email.focus();
      return false;
      }
   }
 else
  {
   alert("Email����Ϊ�գ�");
   document.userinfo.email.focus();
   return false;
   }

}


function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</SCRIPT>
<%@include file="/inc/head.inc"%>
<form name="userinfo" method="post" action="reg.jsp">
  <%if (!mesg.equals("")) out.println("<p><font color=#ff0000>"+ mesg + "</font></p>");%>
    <table width="450" border="0" cellspacing="1" cellpadding="1" align=center>
 <tr></tr>
      <tr>
        <td colspan="2" align="center"><b><font color="#0000FF">�û�ע��</font></b></td>
      </tr>
     <tr></tr>
      <tr>
        <td width="171" align="right">�û��������Ȳ�С��4����</td>
        <td width="272">
          <input type="text" name="username" maxlength="20" size="14" >
        </td>
      </tr>
      <tr>
        <td width="171" align="right">���루���Ȳ�С��6����</td>
        <td width="272">
          <input type="password" name="passwd" maxlength="20" size="14">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">ȷ�����룺</td>
        <td width="272">
          <input type="password" name="passconfirm" maxlength="20" size="14">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">��ʵ������</td>
        <td width="272">
          <input type="text" name="names" maxlength="20" size="14">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">�Ա�</td>
        <td width="272">
          <select name="sex">
            <option>��</option>
            <option>Ů</option>
          </select>
        </td>
      </tr>
      <tr>
        <td width="171" align="right">��ϵ��ַ��</td>
        <td width="272">
          <input type="text" name="address" maxlength="150" size="40">
        </td>
      </tr>
	  <tr>
        <td width="171" align="right">��ϵ�ʱࣺ</td>
        <td width="272">
          <input type="text" name="post" maxlength="8" size="8">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">��ϵ�绰��</td>
        <td width="272">
          <input type="text" name="phone" maxlength="25" size="16">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">�����ʼ���</td>
        <td width="272">
          <input type="text" name="email" maxlength="50" size="25">
        </td>
      </tr>
      <tr>
        <td width="171" align="right">&nbsp; </td>
        <td width="272">
          <input type="submit" name="Submit" value="ע��" onclick="return check();">
          <input type="reset" name="reset" value="ȡ��">
        </td>
      </tr>
    </table>
  </form>

<%@include file="/inc/tail.inc"%>

