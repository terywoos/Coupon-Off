<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="top">
	<div id="logo"><img src="../images/logo.png"></div>
	<div id="topBtns">
	<%if(session.getAttribute("Cidx") == null){ %>
		<a href="login/login.jsp">로그인</a> | ID/PASS찾기 | <a href="login/member.jsp">회원가입</a>
	<%}else{ %>
		환영합니다. <%=session.getAttribute("Cidx")%> 사업자 님! | 로그아웃	
	<%} %>	
	</div>
</div>