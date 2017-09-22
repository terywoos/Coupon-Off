<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="search" class="Search.StampSearch"/>
 <% 

	 	request.setCharacterEncoding("UTF-8"); 
	 	search.setText(request.getParameter("text"));
	 	ArrayList<String> list = search.makeList();
	 	session.setAttribute("list",list);
	
 %>


