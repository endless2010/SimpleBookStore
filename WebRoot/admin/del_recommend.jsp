<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>

<%@ page session="true" %>

<jsp:useBean id="book_recommend" scope="page" class="bookshop.run.op_recommend" />

<%@ include file="../inc/adm_head.inc"%>
 


<% 
   String idStr=request.getParameter("bookid"); 
   int id=Integer.parseInt(idStr);
   if(book_recommend.delete(id)){
 %>  
  
  <font color=lightblue size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;取消推荐成功</font>
 <a href="adm_book.jsp">返回</a>
 <%} else{%>
   
   <font color=lightblue size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;取消推荐失败
   <br/>书籍没有被推荐</font>
 <a href="adm_book.jsp">返回</a>
 
 <%} %>
<%@ include file="../inc/adm_tail.inc" %>
