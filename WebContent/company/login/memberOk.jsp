<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="member" class="member.Member">
	<jsp:setProperty property="*" name="member"/>
	<%
		String Cidx = request.getParameter("Cidx");
		String Cpw = request.getParameter("Cpw");
		String Cname = request.getParameter("Cname");
		String Cregion = request.getParameter("Cregion");
		String Cphone = request.getParameter("Cphone");
		String Cemail = request.getParameter("Cemail");
		
		out.print(member.memberOk(Cidx, Cpw, Cname, Cregion, Cphone, Cemail));
	%>
	</jsp:useBean>
