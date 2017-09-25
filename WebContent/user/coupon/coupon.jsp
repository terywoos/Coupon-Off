<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/coupon.css?var=7"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<title>Insert title here</title>
<script>
	$(document).ready(function(){
	$(document).on("click",".content",function(){
		if($(this).find(".back").css("display") == "none"){
			$(this).find(".back").css("display","block");
			$(this).find(".front").css("display","none");
		}else if($(this).find(".front").css("display") == "none"){
			$(this).find(".front").css("display","block");
			$(this).find(".back").css("display","none");
		}
	});
	
		$("#shopInfo").click(function(){
		var width = $('body').prop('scrollWidth');
		var height = $('body').prop('scrollHeight');
		$("#blackScreen").css({
			"width" : width,
			"height" : height,
			"display" : "block"
		});

		$.ajax({
			url : "coupon/shopInfo.jsp",
			success : function(data){
				$("#ajaxWindow").empty();
				$("#ajaxWindow").append(data);
				$("#ajaxWindow").css({
					"display" : "block",
					"margin" : "auto",
					"width" : "800px",
					"height" : "400px"
				});
			}
		});
	});
	$	(document).on("click", ".close", function(){
		$("#blackScreen").css("display","none");
		$("#ajaxWindow").css("display","none");
	});

	
	$("#button").click(function(){
		var id = "<%=session.getAttribute("ID") %>"
		var Scount = "<%=session.getAttribute("stamps") %>"
			alert(Scount);
		})
	/*
	var stamp =1;
	if(stamp == 1){
	$('.stamp').css({'background-image' : 'url(../images/stampOn.png)'});
	}
	*/	
	var stamp;
	
	if(stamp < 11)
	{
		for(var i=0; i<=stamp; i++){
			$('.stamp div').eq(i).css('background-image','url(../images/stampOn.png)');
	}
	}else if(stamp = 11)
	{
			$('.stamp div').eq(i).css('background-image','url(../images/stampOff.png)');
	}
	});
</script>
</head>
<body>
	<div id="blackScreen">
		<div id="ajaxWindow"></div>
	</div>
	<div class=content>
		<div class="front">
			<div class="couponform">
				<div class="Clogo"></div>
				<div class="Cname"></div>
				<div class="Cinfo">
					<span>고객을 향한 진심 이디야 커피</span>
				</div>
				<div class="couponfont" onclick="event.cancelBubble=true;">
					<a href="#">예약</a>&nbsp&nbsp<a href="#" id="shopInfo">더보기</a>
				</div>
			</div>
		</div>

		<div class="back">
			<div class="couponbackform">
				<div class="stampform">
					<div class="stamp">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<button id="button">도장추가</button>
	</div>

</body>
</html>