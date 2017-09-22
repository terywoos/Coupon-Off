<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("ID");
	session.removeAttribute("login");
	response.sendRedirect("../index.jsp");
%>