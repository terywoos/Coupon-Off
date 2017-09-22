<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
	<jsp:useBean id="login" class="member.ULogin"/>
	<jsp:setProperty property="*" name="login"/>
	<%
		String res = login.login(); 
		String id = request.getParameter("MId");
		if(res.equals("success")) {
			session.setAttribute("login", "affirmative");
			session.setAttribute("ID",id);
		}
		out.print(res);
	%>
