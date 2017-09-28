<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
	<jsp:useBean id="login" class="member.ULogin"/>
	<jsp:setProperty property="*" name="login"/>
	<%
		int res = login.login();
		String id = request.getParameter("MId");
		
	    if(res==1) {
			session.setAttribute("login", "affirmative");
			session.setAttribute("ID",id);
			session.setAttribute("stamps", login.getStamps());
			session.setAttribute("coupons", login.getCoupons());
		}
		out.print(res);
	%>
