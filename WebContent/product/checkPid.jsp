<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="DB" class="products.PidChk">
	<jsp:setProperty property="*" name="DB"/>
	<%
		String Pidx = request.getParameter("pIdx");
		String Cidx = (String)session.getAttribute("Cidx");

		out.print(DB.idCheck(Pidx,Cidx));
	%>
	</jsp:useBean>
