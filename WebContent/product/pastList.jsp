<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="pastList" class="products.PBlist" />
<% 
	String MId = (String)session.getAttribute("MId");
	String Cname = (String)session.getAttribute("Cname");
%>