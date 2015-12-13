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

int pages=1;
String mesg = "";
if (request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
	String requestpage = request.getParameter("page");
	try {
		pages = Integer.parseInt(requestpage);
	} catch(Exception e) {
		mesg = "��Ҫ�ҵ�ҳ�����!";
	}
	book_list.setPage(pages);
}
%>
<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%@include file="inc/head.inc"%>
<%@include file="inc/sub.inc"%>
<table width="778">
  <tr>
     <td width="150" align="center">
     <%@include file="inc/left.inc"%>
     </td>
     <td width="600">
          <p align="center"><b><font color="#0000FF">�������ͼ��<%= classname %>�б�
          
          </font></b></p>
		      <%if (!keyword.equals("")) out.println("<p ><font color=#ff0000>��Ҫ���ҹ���&nbsp;" + keyword + "&nbsp;��ͼ������</font></p>"); %>
          <table width="100%" border="1" cellspacing="1" cellpadding="1" bordercolor="white">
          <tr align="center" bgcolor="#DEF3CE">
            <td>ͼ������</td>
            <td>����</td>
            <td>ͼ�����</td>
            <td>������</td>
            <td>����</td>
            <td>��Ա��</td>
            <td width=110>ѡ��</td>
          </tr>
<% if (book_list.book_search(request)) {
	if (book_list.getBooklist().size()>0 ){
		for (int i=0;i<book_list.getBooklist().size();i++){
			book bk = (book) book_list.getBooklist().elementAt(i);%>
          <tr>
          <td>  <a href="detail.jsp?bookid=<%=bk.getId()%>"><%= bk.getBookName() %></a></td>
            <td align="center"><%= bk.getAuthor() %></td>
            <td align="center"><%= bk.getClassname() %></td>
            <td align="center"><%= bk.getPublish() %></td>
            <td align="center"><%= bk.getPrice() %>Ԫ</td>
            <td align="center"><%= bk.getMemberPrice() %>Ԫ</td>
            <td align="center"><a href="buy.jsp?bookid=<%=bk.getId()%>" >����</a>&nbsp;
			<a href="detail.jsp?bookid=<%=bk.getId() %>" >��ϸ����</a></td>
          </tr>
<%		}
	}else {
		if (keyword.equals("")){
			out.println("<tr><td align='center' colspan=6>&nbsp;��ʱû�д���ͼ������</td></tr>");
		} else {
			out.println("<tr><td align='center' colspan=6>&nbsp;û����Ҫ���ҵ�&nbsp;" + keyword + "&nbsp;���ͼ��</td></tr>")	;
			
		}
	}
} else {%>
          <tr>
            <td align="center" colspan=6>&nbsp;��ʱû�д���ͼ������
            <br>
           </td>
          </tr>
<% } %>
<%=book_list.sqlStr%>
        </table>
        <table width="90%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td align="right">�ܼƽ��Ϊ<%= book_list.getRecordCount() %>������ǰҳ��<%= book_list.getPage() %>ҳ��<a href="booklist.jsp?classid=<%= classid%>&keyword=<%= keyword %>">��ҳ</a>&nbsp;
              <% if (book_list.getPage()>1) {%>
              <a href="booklist.jsp?page=<%= book_list.getPage()-1 %>&classid=<%= classid%>&keyword=<%= keyword %>">��һҳ</a>&nbsp;
              <% } %>
              <% if (book_list.getPage()<book_list.getPageCount()) {%>
              <a href="booklist.jsp?page=<%= book_list.getPage()+1 %>&classid=<%= classid%>&keyword=<%= keyword %>">��һҳ</a>&nbsp;
              <% } %>
              <a href="booklist.jsp?page=<%= book_list.getPageCount() %>&classid=<%= classid%>&keyword=<%= keyword %>">δҳ</a>&nbsp;</td>
          </tr>
        </table>
        <!-- < %=book_list.sqlStr % > -->
      </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<%@include file="inc/tail.inc"%>
