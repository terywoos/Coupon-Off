<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/index.css"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		$("#login").click(function(){
			var width = $(window).width();
			var height = $(window).height();
			
			$("#blackScreen").css({
				"width": width,
				"height":height,
				"display": "block"
			});
			
		});
	});
</script>
<title>Couponoff</title>
</head>
<body>
		<div id="blackScreen"></div>
		<div class="top">
	      <%@include file="top.jsp"%>
	   </div>
	   <div class="search">
	      <%@include file="searchbar.jsp"%>
	   </div>
	   <div class="banners">
	      <span>배너</span>   
	   </div>
	   <section>
	   <div class="coupon">
	      <span>쿠폰</span>
	   </div>
	   </section>
	   <footer> 
	      <span>풋터</span>
	   </footer>
   </body>
</html>