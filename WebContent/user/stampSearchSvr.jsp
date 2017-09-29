<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="Search.Stamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="function" class="Search.Stamp"/>
 <% 
	String text = request.getParameter("text");
 	ArrayList<Stamp> list = (ArrayList<Stamp>)session.getAttribute("stamps");
 	ArrayList<Stamp> Stamps = function.searchStamps(text, list);
 %>
 <content>
<% 
	for(Stamp st: Stamps) {
%>
	<stamp>
		<cname><%=st.getCName()%></cname>
		<snum><%=st.getSNum()%></snum>
	</stamp>
<%
	}
%>
</content>


