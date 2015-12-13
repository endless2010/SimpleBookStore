r<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<%@ page session="true" %>
<%@ page import="bookshop.book.book" %>
<jsp:useBean id="book" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="shop" scope="page" class="bookshop.run.op_buy" />
<jsp:useBean id="user" scope="page" class="bookshop.run.op_user" />
<%@ include file="inc/head.inc" %>
<%@ include file="inc/sub.inc" %>
<%
String mesg = "";
String submits = request.getParameter("Submit");
int Id=0;
String imageString="images/noimage.gif";
if (submits!=null && !submits.equals("")){
	if (shop.addnew(request)){
		mesg = "��Ҫ��ͼ���Ѿ�������Ĺ��ﳵ�У�лл";
 } else if (shop.getIsEmpty()){
		mesg = "���ͼ���������㣡ֻʣ"+shop.getLeaveBook()+"��";
	} else {
		mesg = "��ʱ���ܹ���";
	}
}else {
	if (request.getParameter("bookid")==null || request.getParameter("bookid").equals("")) {
			mesg = "��Ҫ�����ͼ�鲻���ڣ�";
	} else {
		try {
			Id = Integer.parseInt(request.getParameter("bookid"));
			if (!book.getOnebook(Id)){
				mesg = "��Ҫ�����ͼ�鲻���ڣ�";
			}
		} catch (Exception e){
			mesg = "��Ҫ�����ͼ�鲻���ڣ�";
		}
	}
}
%>
<script language="javascript">
function check()
{
	if (document.form1.amount.value<1){
		alert("��Ĺ�������������");
		document.form1.amount.focus();
		return false;
	}
	return true;
}
</script>
<link rel="stylesheet" href="books.css" type="text/css">

<body bgcolor="#FFCC99" text="#000000""><div align="center">
  <p>������껶ӭ��<font color="#CC0066">ѡ��ͼ��</font>��</p>
   <% if(!mesg.equals("")){
		out.println(mesg);
	  } else {
		book bk = (book) book.getBooklist().elementAt(0);
                float fMemberPrice = (((int)(10*(bk.getPrice()*user.getUserRate((String) session.getAttribute("userid"))))/10.0f));
	if(bk.getPicture()!=null&&!bk.getPicture().equals("")) imageString=bk.getPicture();
	%>
  <table width="90%" border="0" cellspacing="2" cellpadding="1">
  <tr><td rowspan=20><%@ include file="inc/left.inc" %><br></td>
  </tr>
    <form name="form1" method="post" action="buy.jsp">
    <tr>
        <td rowspan=10><img src="<%=imageString%>" width=120 height=160 alt="picture"></td>
      </tr>
      <tr>
        <td align="left">ͼ������<%= bk.getBookName() %></td>
      </tr>
      <tr>
        <td align="left">���ߣ�<%= bk.getAuthor() %></td>
      </tr>
      <tr>
        <td align="left">�����磺<%= bk.getPublish() %></td>
      </tr>
      <tr>
        <td align="left">�г��ۣ�<%= bk.getPrice() %>Ԫ</td>
      </tr>
      <tr>
        <td align="left">��Ա�ۣ�<font color="red"><%= fMemberPrice %>Ԫ</font>
        <input type="hidden" name="soldprice"  value="<%= fMemberPrice %>"/>
        </td>
      </tr>
      <tr>
        <td align="left">��飺<%= bk.getContent() %></td>
      </tr>
      <tr align="left">
        <td>����Ҫ��������
          <input type="text" name="amount" maxlength="4" size="3" value="1"> ��</td>
      </tr>
      <tr align="center">
        <td>
		  <input type="hidden" name="bookid" value="<%=Id %>">
          <input type="submit" name="Submit" value="�� ��"  onclick="return(check());">
          <input type="reset" name="Reset" value="ȡ ��">
        </td>
      </tr>
    </form>
  </table>
  </table>
<%} %>
</div>
</body>
<%@ include file="inc/tail.inc" %>