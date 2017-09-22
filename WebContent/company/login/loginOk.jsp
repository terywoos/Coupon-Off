<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="Login" class="member.CLogin">
	<%
		String Cidx = request.getParameter("Cidx");
		String Cpw = request.getParameter("Cpw");
		
		out.print(Login.CLogins(Cidx, Cpw));
		
		if(Login.CLogins(Cidx, Cpw).equals("Ok")){
			session.setAttribute("Cidx", Cidx);
			response.addCookie(new Cookie("Cidx", Cidx));
			session.setAttribute("Cnum", Login.getCnum());
		}
	%>
	</jsp:useBean>