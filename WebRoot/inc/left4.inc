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
<script language="javascript">

 function checkform() {
	if (document.form1.username.value=="" || document.form1.passwd.value==""){
		alert("�û���������Ϊ�գ�");
		return false;
	}
	return true;

  }
</script>
<table width="200" border="0" cellspacing="1" cellpadding="1">
      <form name="form1" method="post" action="login.jsp">
   		  <tr>
      <td width="60" align="left">�û�����<br>
      </td>
      <td width="120" align="left">
          <input type="text" name="username" size="16" maxlength="20">
        </td>
    </tr>
    <tr>
      <td width="60" align="left">��&nbsp;&nbsp;�룺</td>
      <td width="120" align="left">
          <input type="password" name="passwd" maxlength="20" size="16">
        </td>
    </tr>
    <tr>
      <td width="160" valign="top">
          <input type="submit" name="Submit" value="��¼" onclick="javascript:return(checkform());">
          <td align=left><a href="reg.jsp">ע��</a>
     <a href="find_password.jsp">��������</a>
        </td>
    </tr>
   <tr><td> <hr size=5 width=100% noshade/></td></tr>
    </form>
          <tr>
            <td colspan=2><b>����ͼ����ࣺ</b></td>
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
        
      <p><br/><a href="./main.jsp"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;��&nbsp;��&nbsp;��</a></b><br><br/>
             <b><a href="./hotsale.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;��&nbsp;��&nbsp;��</a></b><br><br/>
              <b><a href="./recommend_books.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;��&nbsp;��&nbsp;��</a></b><br>
      </p>
      
       <b>���������</b>
      <ul type:square>
        <li><a href="booklist.jsp?publishId=1">�廪��ѧ������</a>
        <li><a href="booklist.jsp?publishId=2">���ӹ�ҵ������</a>
        <li><a href="booklist.jsp?publishId=3">�ߵȽ���������</a>
        <li><a href="booklist.jsp?publishId=4">��е��ҵ������</a>
      </ul>
      <hr width=100% size=5 noshade/>
		
          <tr>
            <td ><b>ͼ���ѯ��</b></td>

          </tr>
   </table>
    <FORM name=form1 METHOD=POST ACTION="booklist.jsp"> 
   <table>
		      <tr>
            <td lign="right">�ؼ��֣�</td>
            <td><INPUT TYPE="text" NAME="keyword" size=8 maxlength=40 value="<%= keyword %>"></td>
          </tr>
          <tr>
		      <td align="right">���:</td>
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
            <td align="right">�۸�</td>
      <td><INPUT TYPE="text" NAME="from_price" value="0"></td></tr>
           <tr><td align="right">����</td>
      <td><INPUT TYPE="text" NAME="to_price" value="200"></td></tr>
          <tr>
           <td>&nbsp;</td>
            <td align="center"><INPUT TYPE="submit" name="submit" size=10 value="��ѯ" ></td>
         </tr>

        </table>
		  </FORM>