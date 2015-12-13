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
<%@include file="../inc/adm_head.inc"%>
<table width="62%" align=center bgcolor=lightblue>
  <tr>
     <td width="150" align="center" rowspan=20>
     <%@include file="../inc/left3.inc"%>
     </td>
      <td align="center">
        <p><br><font color="#33FFCC"><b><font color="#0000FF">图书销售统计</font></b></font></p>
<%if (!mesg.equals("")) {%>
		out.println("<p><font color=red>" + mesg + "</font></p>");
            <td>该图书不存在</td>
            <td>该类图书不存在</td>
<%} else {   %>
        <table width="80%" border="1" cellspacing="2" cellpadding="1" bordercolor="white">
          <tr align="center" bgcolor="#DEF3CE">
            <td>图书名称</td>
            <td>销售数量</td>
          </tr>
	<%for (int i = 0; i<al.size();i++){
		String []result = (String [])al.get(i);	 
		String name=result[0];

		int bookid=book_list2.getBookid(name);

			%>
          <tr>
            <td><font color=blue><%=dataFormat.toString(result[0]) %></font></td>
            <td align="center"><%= result[1] %></td>
          </tr>
		<%}%>
        </table>
<%} %>
        <p>&nbsp;</p>
        </td>
   </tr>
 </table>
<%@include file="../inc/adm_tail.inc"%>