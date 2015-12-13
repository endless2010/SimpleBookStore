<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<jsp:useBean id="msg" scope="page" class="bookshop.run.op_message" />

<%
String idStr=request.getParameter("getId");

int id=Integer.parseInt(idStr);
 if(msg.delete(id)){

 }
 %>
 <%@include file="../inc/adm_head.inc"%>
<%@include file="../inc/adm_tail.inc"%>