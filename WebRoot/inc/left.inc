<%@ page  pageEncoding="GB2312"%>
<%@ page import="bookshop.run.op_book" %>
<%@ page import="bookshop.book.bookclass" %>
<jsp:useBean id="book1" scope="page" class="bookshop.book.book" />
<jsp:useBean id="book_list1" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="classlist1" scope="page" class="bookshop.run.op_bookclass" />
<%String classid = request.getParameter("classid");
String classname ="";
String keyword = request.getParameter("keyword");
if (classid==null) classid="";
if (keyword==null) keyword="";
keyword = book_list1.to_String(keyword);
%>
<table width="140" border="0" cellspacing="1" cellpadding="1">
         <tr></tr>
         <hr width=100% size=5 noshade/>
          <tr>
            <td><b>����ͼ����ࣺ</b></td>
          </tr>
          <% if (classlist1.seachBookClass()){
				for (int i=0;i<classlist1.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist1.getClasslist().elementAt(i);
					if ( classid.equals(Integer.toString(bc.getId())) ) classname=bc.getClassName();
					%>
          <tr>

            <td align="center"><a href="booklist.jsp?classid=<%= bc.getId()%>"><%= bc.getClassName() %></a></td>

          </tr>
          <%		}
		} %>
         <b>���������</b>
      <ul type:square>
        <li><a href="booklist.jsp?publishId=1">�廪��ѧ������</a>
        <li><a href="booklist.jsp?publishId=2">���ӹ�ҵ������</a>
        <li><a href="booklist.jsp?publishId=3">�ߵȽ���������</a>
        <li><a href="booklist.jsp?publishId=4">��е��ҵ������</a>
      </ul>
      <hr width=100% size=5 noshade/>
		  <FORM name=form1 METHOD=POST ACTION="booklist.jsp">
          <tr>
            <td ><b>ͼ���ѯ��</b></td>

          </tr>
   </table>
   <table>
		      <tr>
            <td lign="right">�ؼ��֣�</td>
            <td><INPUT TYPE="text" NAME="keyword" size=8 maxlength=40 value="<%= keyword %>"></td>
          </tr>
          <tr>
		      <td lign="right">���:</td>
		      <td> <SELECT NAME="classid">
				<option value="">�������</option>

		  <%
				for (int i=0;i<classlist1.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist1.getClasslist().elementAt(i); %>
            <option value="<%= bc.getId()%>"><%= bc.getClassName() %></option>
          <%		}
%></SELECT>
		    </td>
          </tr>
           <tr>
            <td align="left">�۸�</td>
      <td><INPUT TYPE="text" NAME="from_price" value="0" size=6></td></tr>
           <tr><td align="left">����</td>
      <td><INPUT TYPE="text" NAME="to_price" value="200" size=6></td></tr>
<hr width=100% size=5 noshade/>
          <tr>
           <td>&nbsp;</td>
            <td align="center"><INPUT TYPE="submit" name="submit" size=10 value="��ѯ" ></td>
         </tr>
		  </FORM>
        </table>