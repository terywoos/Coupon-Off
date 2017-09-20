<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="DB" class="member.idChk">
	<jsp:setProperty property="*" name="DB"/>
	<%
		String Cidx = request.getParameter("Cidx");

		out.print(DB.idCheck(Cidx));
	%>
	</jsp:useBean>
