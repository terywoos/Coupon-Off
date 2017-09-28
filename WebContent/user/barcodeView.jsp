<%@page import="Coupon.Coupon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		String src = (String)request.getParameter("src"); //경로 없으니까... 임의로 하자..
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/barcodeView.css"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		$(document).on("click","#close",function() {
			$("#blackScreen").css("display","none");
			$("#ajaxWindow").css("display","none");
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="barcodeView_container">
		<div id="barcodeView_upper">
			<div id="close"></div>
		</div>
		<div id="barcodeView_lower">
			<img id="barcodeView_barcode" src='<%=src%>' width='450px' height='200px'/>
		</div>
	</div>
</body>
</html>