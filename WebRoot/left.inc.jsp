<%@ page  pageEncoding="GB2312"%>
<%@ page import="java.util.*" %>
<%@ page import="bookshop.book.bookclass" %>
<%@ page import="bookshop.book.book"%>
<jsp:useBean id="classlist" scope="page" class="bookshop.run.op_bookclass" />

<%String classid = request.getParameter("classid");
String classname ="";
String keyword = request.getParameter("keyword");
if (classid==null) classid="";
if (keyword==null) keyword="";
//keyword = book_list.to_String(keyword);
%>
<table width="140" border="0" cellspacing="1" cellpadding="1">
         <tr></tr>
          <tr>
            <td align="center"><b>本店图书分类：</b></td>
          </tr>
          <% if (classlist.seachBookClass()){
				for (int i=0;i<classlist.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist.getClasslist().elementAt(i);
					if ( classid.equals(Integer.toString(bc.getId())) ) classname=bc.getClassName();
					%>
          <tr>

            <td align="center"><a href="booklist.jsp?classid=<%= bc.getId()%>"><%= bc.getClassName() %></a></td>

          </tr>
          <%		}
		} %>


		  <FORM name=form1 METHOD=POST ACTION="booklist.jsp">
          <tr>

            <td align="center"><b>图书查询：</b></td>

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
				for (int i=0;i<classlist.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist.getClasslist().elementAt(i); %>
            <option value="<%= bc.getId()%>"><%= bc.getClassName() %></option>
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
