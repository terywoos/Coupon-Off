<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="check" class="member.UIdChk"/>
	<jsp:setProperty property="MId" name="check"/>
	<%
		boolean res = check.check();
		if(res)
			out.print("accepted");
		else 
			out.print("rejected");
	%>