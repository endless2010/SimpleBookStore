<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<%@ page import="bookshop.book.book" %>
<%@ page import="bookshop.util.dataFormat" %>
<jsp:useBean id="book" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user"/>
<%
String s="images/noimage.gif";
String mesg = "";
int Id=0;
if (request.getParameter("bookid")==null || request.getParameter("bookid").equals("")) {
		mesg = "你要查看的图书不存在！";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("bookid"));
		if (!book.getOnebook(Id)){
			mesg = "你要查看的图书不存在！";
		}
	} catch (Exception e){
		mesg = "你要查看的图书不存在！";
	}
}

%>

<html>
<head>
<title>网上书店　查看图书资料</title>
<%@ include file="inc/head.inc" %>
<%@ include file="inc/sub.inc" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function check()
{
	if (document.form1.amount.value<1){
		alert("你的购买数量有问题");
		document.form1.amount.focus();
		return false;
	}
	return true;
}

</script>
<link rel="stylesheet" href="books.css" type="text/css">
</head>

<body bgcolor="#FFCC99" text="#000000" >
<div align="center">
  <p>网上书店欢迎你<font color="#CC0066">选购图书</font>！</p>
  <% if(!mesg.equals("")){
		out.println(mesg);
	  } else {
		book bk = (book) book.getBooklist().elementAt(0);
                float fMemberPrice = (((int)(10*(bk.getPrice()*user.getUserRate((String) session.getAttribute("userid"))))/10.0f));
     
     if(bk.getPicture()!=null&&!bk.getPicture().equals(""))
      s=bk.getPicture();
     System.out.println(s);
	%>
  <table width="90%" border="0" cellspacing="2" cellpadding="1">
  <tr><td rowspan=20><%@ include file="inc/left.inc" %></td>
  </tr>
    <form name="form1" method="post" action="buy.jsp">
    <tr>
        <td rowspan=10><img src="<%=s%>" width="120" height="180"></td>
       </tr>
        <tr><td align="right" width="120">图书名：</td>
        <td><%= bk.getBookName() %></td>
      </tr>
      <tr>
        <td align="right" width="120">作者：</td>
        <td><%= bk.getAuthor() %></td>
      </tr>
      <tr>
        <td align="right" width="120">所属类别：</td>
        <td><%= bk.getClassname() %></td>
      </tr>
      <tr>
        <td align="right" width="120">出版社：</td>
        <td><%= bk.getPublish() %></td>
      </tr>
      <tr>
        <td align="right" width="120">书号：</td>
        <td><%= bk.getBookNo() %></td>
      </tr>
      <tr>
        <td align="right" width="120">市场价：</td>
        <td><%= bk.getPrice() %>元</td>
      </tr>
      <tr>
        <td align="right" width="120">会员价：</td>
        <td><font color=red><%= fMemberPrice %>元</font>
            <input type="hidden" name="soldprice"  value="<%= fMemberPrice %>"/>
        </td>
      </tr>
      <tr>
        <td align="right" width="120" valign="top">内容介绍：</td>
        <td><%= dataFormat.toHtml(bk.getContent()) %></td>
      </tr>
      <tr>
        <td align="right" width="120" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right" width="120" valign="top">购买：</td>
        <td>
          <input type="text" name="amount" maxlength="5" size="3" value="1">
          本</td>
      </tr>
      <tr>
        <td align="right" width="120" valign="top">&nbsp;</td>
        <td>
		  <input type="hidden" name="bookid" value="<%=Id %>" >
          <input type="submit" name="Submit" value="购买" onclick="return(check());">
          <input type="reset" name="reset" value="取消">
        </td>
      </tr>
    </form>
  </table>
<% } %>
</div>
</body>
<%@include file="inc/tail.inc" %>
</html>
