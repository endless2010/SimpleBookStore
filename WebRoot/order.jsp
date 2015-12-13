<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%@ page session="true" %>
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user" />

<%
String username = (String)session.getAttribute("username");
if ( username == null || username.equals("") ){
	response.sendRedirect("login.jsp?msg=nologin");
}
%>
<%@ page import="bookshop.book.book "%>
<%@ page import="bookshop.util.*" %>
<%@ page import="bookshop.book.allorder" %>
<%@ page import="bookshop.run.op_book" %>
<jsp:useBean id="myIndentlist" scope="page" class="bookshop.run.op_buy" />
<jsp:useBean id="mybook" scope="page" class="bookshop.run.op_book" />
<%
String mesg = "";
long Id=0;
String indentNo = request.getParameter("orderno");
if( (indentNo==null)|| indentNo.equals("")) {
		mesg = "你要查看的订单清单不存在！";
} else {
	try {
		Id = Long.parseLong(request.getParameter("id"));
		if (!myIndentlist.getAllorder(indentNo)){
			mesg = "你要查看的订单清单不存在！";
		}
	} catch (Exception e){
		mesg = "你要查看的订单清单不存在！";
	}
}

%>

<%@include file="inc/head.inc" %>
<%@include file="inc/sub.inc" %>

<link rel="stylesheet" href="books.css" type="text/css">
<body bgcolor="#FFCC99" text="#000000" onload="javascript:window.focus();" >
<div align="center">

  <% if(!mesg.equals("")){ 
		out.println(mesg); 
	  } else { 
	%>
		<p>图书订单<%= indentNo %>&nbsp;清单:</p>
          <table align=center width="100%" border="1" cellspacing="1" cellpadding="1" >
          <tr align="center">
           <td>图书名称</td>
            <td>作者</td>
            <td>图书类别</td>
            <td>单价(元)</td>
            <td>会员价(元)</td>
            <td>数量</td>
          </tr>
	<%
	for (int i=0; i<myIndentlist.getOrder_list().size();i++){
		allorder idList = (allorder) myIndentlist.getOrder_list().elementAt(i);
		//out.print(idList.getBookNo());
		if (mybook.getOnebook((int)idList.getBookNo()) ){
			book bk = (book) mybook.getBooklist().elementAt(0);
	%>
	      <tr align="center">
            <td><%= bk.getBookName() %></td>
            <td><%= bk.getAuthor() %></td>
            <td><%= bk.getClassname() %></td>
            <td><%= bk.getPrice() %></td>
             <td><font color=red><%= idList.getSoldPrice() %>元</font></td>
           <td><%= idList.getAmount() %></td>
          </tr>
	<%
		}
                else	// 此书已删除
                {
        %>
   	      <tr align="center">
            <td colspan="4">  此书已删除 </td>
             <td><font color=red><%= idList.getSoldPrice() %>元</font></td>
           <td><%= idList.getAmount() %></td>
          </tr>
        <%
                }
	}%>
		</table>
<% } %>
</div>
</body>
<%@include file="inc/tail.inc" %>
