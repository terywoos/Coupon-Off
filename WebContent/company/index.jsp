<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: 쿠폰오프 :::</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="../js/company.js"></script>
<link rel="stylesheet" type="text/css" href="../style/company.css"/>
</head>
<body>
	<div id="blackScreen">
		<div id="ajaxWindow"></div>
	</div>
	
	<header>
		<%@ include file="top.jsp" %>
		<%@ include file="search.jsp" %>
	</header>
	<section>
		<%@ include file="userView.jsp" %>
		<%@ include file="../product/list.jsp" %>
	</section>
	<footer></footer>
</body>
</html>