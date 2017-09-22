<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="Search" class="searchs.Search">
	<%
		String MPhoneNum = request.getParameter("MPhoneNum");
	
		
		out.print(Search.UserSearch(MPhoneNum));
		
		
		if(Search.UserSearch(MPhoneNum).equals("Ok")){
			session.setAttribute("MName", Search.getMName());
			session.setAttribute("MPoint", Search.getMPoint());
			session.setAttribute("MId", Search.getMId());
		}
	%>
	</jsp:useBean>
