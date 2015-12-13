<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>

<%@ page session="true" %>
<%@ page import="bookshop.book.*" %>
<%@ page import="bookshop.util.*" %>
<%@ page import="bookshop.run.*" %>
<jsp:useBean id="book_list" scope="page" class="bookshop.run.op_book" />
<jsp:useBean id="book_recommend" scope="page" class="bookshop.run.op_recommend" />

<%@ include file="../inc/adm_head.inc"%>
<%book bk=null;
 %>
 <font color=lightblue size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推荐成功</font>
 <a href="adm_book.jsp">返回</a>
<% String idStr=request.getParameter("id"); 
   int id=Integer.parseInt(idStr);
   book_recommend.insert(id);
 %>  
 <form action="../recommend_books.jsp">
 <input type="hidden" name="id" value="<%=id%>"/>
  </form>
<%@ include file="../inc/adm_tail.inc" %>
