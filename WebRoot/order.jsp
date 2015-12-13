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
		mesg = "��Ҫ�鿴�Ķ����嵥�����ڣ�";
} else {
	try {
		Id = Long.parseLong(request.getParameter("id"));
		if (!myIndentlist.getAllorder(indentNo)){
			mesg = "��Ҫ�鿴�Ķ����嵥�����ڣ�";
		}
	} catch (Exception e){
		mesg = "��Ҫ�鿴�Ķ����嵥�����ڣ�";
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
		<p>ͼ�鶩��<%= indentNo %>&nbsp;�嵥:</p>
          <table align=center width="100%" border="1" cellspacing="1" cellpadding="1" >
          <tr align="center">
           <td>ͼ������</td>
            <td>����</td>
            <td>ͼ�����</td>
            <td>����(Ԫ)</td>
            <td>��Ա��(Ԫ)</td>
            <td>����</td>
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
             <td><font color=red><%= idList.getSoldPrice() %>Ԫ</font></td>
           <td><%= idList.getAmount() %></td>
          </tr>
	<%
		}
                else	// ������ɾ��
                {
        %>
   	      <tr align="center">
            <td colspan="4">  ������ɾ�� </td>
             <td><font color=red><%= idList.getSoldPrice() %>Ԫ</font></td>
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
