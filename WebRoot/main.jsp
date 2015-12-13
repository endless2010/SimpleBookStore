<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<%@ page import="java.util.*" %>
<%@ page import="bookshop.book.*" %>
<%@ page import="bookshop.run.*" %>
<%@ page import="bookshop.util.*" %>
<%@ page session="true" %>
<jsp:useBean id="book" scope="page" class="bookshop.book.book" />
<jsp:useBean id="book_list" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="classlist" scope="page" class="bookshop.run.op_bookclass" />
<%

request.setCharacterEncoding("GB2312");
String pictureString="images/noimage.gif";
int pages=1;
final int pageSize=6;
String mesg = "";
if (request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
	String requestpage = request.getParameter("page");
	try {
		pages = Integer.parseInt(requestpage);
	} catch(Exception e) {
		mesg = "你要找的页码错误!";
	}
	book_list.setPage(pages);
}
%>
<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>		
<table width="100%" border="0" cellspacing="2" cellpadding="1">
  <tr><td width=30% rowspan=100 colspan=2 valign=top><%@ include file="inc/left4.inc" %></td>
  </tr>
  <% if (book_list.book_search2(request)) {
	if (book_list.getBooklist().size()>0 ){
		for (int i=0;i<pageSize;i++){
			book bk = (book) book_list.getBooklist().elementAt(i);
			if(bk.getPicture()!=null&&!bk.getPicture().equals("")){
			pictureString=bk.getPicture();
}%>
    <tr>
        <td rowspan=10><a href="buy.jsp?bookid=<%=bk.getId()%>" ><img src="<%=pictureString%>" width="180" height="240"></a></td>
       </tr>
        <tr><td align="left" width="120">图书名：</td>
        <td align=left><a href="buy.jsp?bookid=<%=bk.getId()%>" ><%= bk.getBookName() %></a></td>
      </tr>
      <tr>
        <td align="left" width="120">作者：</td>
        <td><%= bk.getAuthor() %></td>
      </tr>
      <tr>
        <td align="left" width="120">所属类别：</td>
        <td><%= bk.getClassname() %></td>
      </tr>
      <tr>
        <td align=left" width="120">出版社：</td>
        <td><%= bk.getPublish() %></td>
      </tr>
      <tr>
        <td align="left" width="120">书号：</td>
        <td><%= bk.getBookNo() %></td>
      </tr>
      <tr>
        <td align="left" width="120">定价：</td>
        <td><%= bk.getPrice() %>元</td>
      </tr>
      <tr>
        <td align="left" width="120">会员价：</td>
        <td><font color=blue><%= bk.getMemberPrice() %>元</font>
            <input type="hidden" name="soldprice"  value="<%=bk.getMemberPrice() %>"/>
        </td>
      </tr>
      <tr>
        <td align="left" width="120" valign="top">内容介绍：</td>
        <td><%= dataFormat.toHtml(bk.getContent()) %></td>
      </tr>
      <tr>
		 <td> <input type="hidden" name="bookid" value="<%=bk.getId()%>" ></td>
     <td align="left"><a href="buy.jsp?bookid=<%=bk.getId()%>" ><font color=red>购买</font></a>&nbsp;
        </td>
      </tr>
      <tr><td colspan=3><hr color=white width=100% size=5 noshade/></td></tr>
   <%
   pictureString="images/noimage.gif";}
   }
   } %>
  </table>
  
<%@include file="inc/tail.inc"%>
