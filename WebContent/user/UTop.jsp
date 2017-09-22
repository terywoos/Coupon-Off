<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String user = (String)session.getAttribute("ID"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/top.css"></link>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		
		
	});
</script>
</head>
<body>
	<div id="topbar" align="center">
		<div id="top_logo"></div>
		<div id="Utop_container">
			<a href="#" id="top_login"><%=user %>님 안녕하세요.</a>
			<a href="#" id="top_signUp">쿠폰함</a>
			<a href="login/signoutSvr.jsp" id="signout">로그아웃</a>
		</div>
	</div>
</body>
</html>