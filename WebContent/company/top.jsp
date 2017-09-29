<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="top" style="background-color: white">
	<div id="logo"><img src="../images/logo.png" width="200px"></div>
	<div id="topBtns">
	<%if(session.getAttribute("Cidx") == null){ %>
		<a href="#" id="top_login">로그인</a> | ID/PASS찾기 | <a href="#" id="top_member">회원가입</a>
	<%}else{ %>
		환영합니다. <%=session.getAttribute("Cidx")%> 사업자 님! | <a href="login/logout.jsp">로그아웃</a>	
	<%} %>	
	</div>
</div>