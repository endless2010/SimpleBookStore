<%@ page  pageEncoding="GB2312" %>
<%@ page import="bookshop.util.dataFormat"%>
<%@ page import="java.util.*" %>
<%@ page import="bookshop.book.order" %>
<%@ page import="bookshop.book.*"%>
<%@ page import="bookshop.util.dataFormat"%>
<jsp:useBean id="book_list1" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="classlist1" scope="page" class="bookshop.run.op_bookclass" />
<jsp:useBean id="sale1" scope="page" class="bookshop.run.op_sale_statistics" />
<%String classid = request.getParameter("classid");
String classname ="";
String keyword = request.getParameter("keyword");
if (classid==null) classid="";
if (keyword==null) keyword="";
keyword = book_list1.to_String(keyword);
%>
<table width="140" border="0" cellspacing="1" cellpadding="1">
         <tr></tr>
          <tr>
            <td align="center"><b>按图书分类查询：</b></td>
          </tr>
          <% if (classlist1.seachBookClass()){
				for (int i=0;i<classlist1.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist1.getClasslist().elementAt(i);
					if ( classid.equals(Integer.toString(bc.getId())) ) classname=bc.getClassName();
					%>
          <tr>

            <td align="center"><a href="showSaleStatistics.jsp?classid=<%= bc.getId()%>"><%=dataFormat.toString(bc.getClassName()) %></a></td>

          </tr>
          <%		}
		} %>
<b>出版社分类</b>
      <ul type:square>
        <li><a href="../booklist.jsp?publishId=1">清华大学出版社</a>
        <li><a href="../booklist.jsp?publishId=2">电子工业出版社</a>
        <li><a href="../booklist.jsp?publishId=3">高等教育出版社</a>
        <li><a href="../booklist.jsp?publishId=4">机械工业出版社</a>
      </ul>

		  <FORM name=form1 METHOD=POST ACTION="showSaleStatistics.jsp">
          <tr>

            <td align="center"><b>按图书查询：</b></td>

          </tr>
   </table>
   <table>
		      <tr>
            <td lign="right">关键字：</td>
            <td><INPUT TYPE="text" NAME="keyword" size=8 maxlength=40 value="<%= keyword %>"></td>
          </tr>
          <tr>
		      <td lign="right">类别:</td>
		      <td> <SELECT NAME="classid">
				<option value="">所有类别</option>

		  <%
				for (int i=0;i<classlist1.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist1.getClasslist().elementAt(i); %>
            <option value="<%= bc.getId()%>"><%= dataFormat.toString(bc.getClassName()) %></option>
          <%		}
%></SELECT>
		    </td>
          </tr>

          <tr>
           <td>&nbsp;</td>
            <td align="center"><INPUT TYPE="submit" name="submit" value="查询" ></td>
         </tr>
		  </FORM>
        </table>
