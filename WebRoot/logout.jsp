<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312"%>
<%
session.removeAttribute("userid");
response.sendRedirect("login.jsp?msg=logout");
%>
