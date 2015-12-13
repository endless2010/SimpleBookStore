<%@ page language="java" contentType="text/html;charset=gb2312" pageEncoding="gb2312"%> 
<%@ page session="true" %>

<%@ page import="java.util.*" %>
<%@ page import="bookshop.book.order" %>
<%@ page import="bookshop.book.*"%>
<%@ page import="bookshop.util.dataFormat"%>
<jsp:useBean id="book_list2" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="classlist2" scope="page" class="bookshop.run.op_bookclass" />
<jsp:useBean id="sale2" scope="page" class="bookshop.run.op_sale_statistics" />

<%
String mesg = "";
ArrayList al=new ArrayList();
String Uid = (String) session.getAttribute("userid");
String pictureString="images/noimage.gif";
long uid = 0;
try {

	al=sale2.getSaleNumOrder( request.getParameter("classid"),request.getParameter("keyword"));
} catch (Exception e) {
	mesg = "出现错误!";
}
%>


<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>
<table width="100%" border="0" cellspacing="2" cellpadding="1">
  <tr><td width=30% rowspan=100 colspan=2 valign=top><%@ include file="inc/left4.inc" %></td>
  </tr>
<%
       for (int i = 0; i<al.size();i++){
        	 	String []result = (String [])al.get(i);	
        	  String name=result[0];
     	int bookid=book_list2.getBookid(name);
	
			%>
  <% 
		if(book_list2.getOnebook(bookid)){
		book bk = (book) book_list2.getBooklist().elementAt(0);
			if(bk.getPicture()!=null&&!bk.getPicture().equals("")){
			pictureString=bk.getPicture();
}%>
    <tr>
        <td rowspan=10><a href="buy.jsp?bookid=<%=bk.getId()%>" ><img src="<%=pictureString%>" width="180" height="240"></a></td>
       </tr>
          <tr>
        <td align="left" width="120"><font color=red>销售数量：</font></td>
        <td><font color=red><%=result[1] %></font></td>
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
        <td align="left" width="120" valign="top">内容介绍：</td>
        <td><%= dataFormat.toHtml(bk.getContent()) %></td>
      </tr>
      <tr>
		 <td> <input type="hidden" name="bookid" value="<%=bk.getId()%>" ></td>
     <td align="left"><a href="buy.jsp?bookid=<%=bk.getId()%>" ><font color=red>购买</font></a>&nbsp;
        </td>
      </tr>
      <tr><td><br/><hr color=white width=100% size=5 noshade/></td></tr>
   <%
   pictureString="images/noimage.gif";}
   }
  %>
  </table>

<%@include file="inc/tail.inc"%>