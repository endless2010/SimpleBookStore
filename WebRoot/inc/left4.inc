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
		alert("用户名或密码为空！");
		return false;
	}
	return true;

  }
</script>
<table width="200" border="0" cellspacing="1" cellpadding="1">
      <form name="form1" method="post" action="login.jsp">
   		  <tr>
      <td width="60" align="left">用户名：<br>
      </td>
      <td width="120" align="left">
          <input type="text" name="username" size="16" maxlength="20">
        </td>
    </tr>
    <tr>
      <td width="60" align="left">密&nbsp;&nbsp;码：</td>
      <td width="120" align="left">
          <input type="password" name="passwd" maxlength="20" size="16">
        </td>
    </tr>
    <tr>
      <td width="160" valign="top">
          <input type="submit" name="Submit" value="登录" onclick="javascript:return(checkform());">
          <td align=left><a href="reg.jsp">注册</a>
     <a href="find_password.jsp">忘记密码</a>
        </td>
    </tr>
   <tr><td> <hr size=5 width=100% noshade/></td></tr>
    </form>
          <tr>
            <td colspan=2><b>本店图书分类：</b></td>
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
        
      <p><br/><a href="./main.jsp"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新&nbsp;书&nbsp;上&nbsp;架</a></b><br><br/>
             <b><a href="./hotsale.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热&nbsp;门&nbsp;书&nbsp;籍</a></b><br><br/>
              <b><a href="./recommend_books.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店&nbsp;长&nbsp;推&nbsp;荐</a></b><br>
      </p>
      
       <b>出版社分类</b>
      <ul type:square>
        <li><a href="booklist.jsp?publishId=1">清华大学出版社</a>
        <li><a href="booklist.jsp?publishId=2">电子工业出版社</a>
        <li><a href="booklist.jsp?publishId=3">高等教育出版社</a>
        <li><a href="booklist.jsp?publishId=4">机械工业出版社</a>
      </ul>
      <hr width=100% size=5 noshade/>
		
          <tr>
            <td ><b>图书查询：</b></td>

          </tr>
   </table>
    <FORM name=form1 METHOD=POST ACTION="booklist.jsp"> 
   <table>
		      <tr>
            <td lign="right">关键字：</td>
            <td><INPUT TYPE="text" NAME="keyword" size=8 maxlength=40 value="<%= keyword %>"></td>
          </tr>
          <tr>
		      <td align="right">类别:</td>
		      <td> <SELECT NAME="classid">
				<option value="">所有类别</option>

		  <%
				for (int i=0;i<classlist1.getClasslist().size();i++){
					bookclass bc = (bookclass) classlist1.getClasslist().elementAt(i); %>
            <option value="<%= bc.getId()%>"><%= bc.getClassName() %></option>
          <%		}
%></SELECT>
		    </td>
          </tr>
       <tr>
            <td align="right">价格：</td>
      <td><INPUT TYPE="text" NAME="from_price" value="0"></td></tr>
           <tr><td align="right">到：</td>
      <td><INPUT TYPE="text" NAME="to_price" value="200"></td></tr>
          <tr>
           <td>&nbsp;</td>
            <td align="center"><INPUT TYPE="submit" name="submit" size=10 value="查询" ></td>
         </tr>

        </table>
		  </FORM>