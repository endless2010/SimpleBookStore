<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>

<%@ page session="true" %>

<jsp:useBean id="book_recommend" scope="page" class="bookshop.run.op_recommend" />

<%@ include file="../inc/adm_head.inc"%>
 


<% 
   String idStr=request.getParameter("bookid"); 
   int id=Integer.parseInt(idStr);
   if(book_recommend.delete(id)){
 %>  
  
  <font color=lightblue size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ȡ���Ƽ��ɹ�</font>
 <a href="adm_book.jsp">����</a>
 <%} else{%>
   
   <font color=lightblue size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ȡ���Ƽ�ʧ��
   <br/>�鼮û�б��Ƽ�</font>
 <a href="adm_book.jsp">����</a>
 
 <%} %>
<%@ include file="../inc/adm_tail.inc" %>
