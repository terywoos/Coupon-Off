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
		$("#top_login").click(function(){
			var width = $('body').prop('scrollWidth');
			var height = $('body').prop('scrollHeight');
			
			$("#blackScreen").css({
				"width": width,
				"height":height,
				"display": "block"
			});
			
			$.ajax({
				 url:"login/login.jsp",
				 success:function(data){
					$("#ajaxWindow").empty();
					$("#ajaxWindow").append(data);
					$("#ajaxWindow").css({
						"display":"block",
						"margin": "auto",
						"width": "550px",
						"height": "350px"
					});
				 }
			});
		});	
		
		$("#top_signUp").click(function(){
			//회원가입클릭 
			var width = $('body').prop('scrollWidth');
			var height = $('body').prop('scrollHeight');
			
			$("#blackScreen").css({
				"width": width,
				"height":height,
				"display": "block"
			});
			
			$.ajax({
				 url:"login/join.jsp",
				 success:function(data){
					$("#ajaxWindow").empty();
					$("#ajaxWindow").append(data);
					$("#ajaxWindow").css({
						"display":"block",
						"margin": "auto",
						"width": "500px",
						"height": "400px"
					});
				 }
			});
		});	
		
		$(document).on("click","#close",function() {
			$("#blackScreen").css("display","none");
			$("#ajaxWindow").css("display","none");
		});
		
		$(document).on("click","#login_signup",function() {
			var width = $('body').prop('scrollWidth');
			var height = $('body').prop('scrollHeight');
			
			$("#blackScreen").css({
				"width": width,
				"height":height,
				"display": "block"
			});
			
			$.ajax({
				 url:"login/join.jsp",
				 success:function(data){
					$("#ajaxWindow").empty();
					$("#ajaxWindow").append(data);
					$("#ajaxWindow").css({
						"display":"block",
						"margin": "auto",
						"width": "500px",
						"height": "400px"
					});
				 }
			});
		});
	});
	
	
</script>
<title>Couponoff</title>
</head>
<body>
		<div id="blackScreen">
			<div id="ajaxWindow"></div>
		</div>
		
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