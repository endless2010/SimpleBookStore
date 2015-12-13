<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="/inc/head.inc"%>
<br>

  <form name="form1" method="post" action="login.jsp">
          <div align=center>用户登录 </div>
          <br>
          <table width="300" border="0" cellspacing="1" cellpadding="1" align="center">
          <br>
            <tr>
              <td align="right">用户名：</td>
              <td>
                <input type="text" name="username" size="15" maxlength="25" value="test">
              </td>
            </tr>
            <tr>
              <td align="right">密码：</td>
              <td>
                <input type="password" name="passwd" size="15" maxlength="20" value="test">
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <input type="submit" name="Submit" value="登录">

                <input type="reset" name="Submit2" value="取消">
                <a href="find_password.jsp">找回密码</a>
              </td>
            </tr>
             <tr>
           	<td colspan="2" align="center">
        	 <p>&nbsp;</p>
       		    测试用户：test 密码：test
      		</td>
   	    </tr>
            <tr>
              <td colspan="2" align=center>如果不是本站会员，请在此<a href="reg.jsp">注册</a>。</td>
            </tr>
         </table>
   </form>

<%@include file="inc/tail.inc"%>
