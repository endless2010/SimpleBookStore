<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="/inc/head.inc"%>
<br>

  <form name="form1" method="post" action="login.jsp">
          <div align=center>�û���¼ </div>
          <br>
          <table width="300" border="0" cellspacing="1" cellpadding="1" align="center">
          <br>
            <tr>
              <td align="right">�û�����</td>
              <td>
                <input type="text" name="username" size="15" maxlength="25" value="test">
              </td>
            </tr>
            <tr>
              <td align="right">���룺</td>
              <td>
                <input type="password" name="passwd" size="15" maxlength="20" value="test">
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <input type="submit" name="Submit" value="��¼">

                <input type="reset" name="Submit2" value="ȡ��">
                <a href="find_password.jsp">�һ�����</a>
              </td>
            </tr>
             <tr>
           	<td colspan="2" align="center">
        	 <p>&nbsp;</p>
       		    �����û���test ���룺test
      		</td>
   	    </tr>
            <tr>
              <td colspan="2" align=center>������Ǳ�վ��Ա�����ڴ�<a href="reg.jsp">ע��</a>��</td>
            </tr>
         </table>
   </form>

<%@include file="inc/tail.inc"%>
