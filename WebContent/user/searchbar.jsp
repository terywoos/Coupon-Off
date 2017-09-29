<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/searchbar.css"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>	
	$(document).on("submit","#searchForm",function(e) {
		e.preventDefault();
		var text = $("#searchBy").val();
		if(text=="") {
			alert("검색하고자 하는 매장명, 매장위치를 입력해주세요.");
			return false;
		} else {
			$.ajax({
				type:"GET",
				url: "stampSearchSvr.jsp",
				dataType: 'xml',
				data: {
					text: text
				},
				success : function(data) {
					$("#searchBy").val("");
					$("#resWindow").empty();
					$("#resWindow").css("display","none");
					$(data).find('stamp').each(function() {
						var cname = $(this).find("cname").text();
						var snum = $(this).find("snum").text();
						var newdiv = $('<div>').addClass("stampResult").attr('data-searchSnum',snum).text(cname);
						//$("#resWindow").append(newdiv).css("display","block");
						$("#resWindow").append(newdiv).css({
							"display":"block",
							"top":"100%",
							"transition": "top 50ms"
						});
					})
				}
			});
		}
	});
	
	$(document).on("click",".stampResult",function(e) {
		var index = parseInt(e.target.getAttribute("data-searchSnum"))-1;
		alert($('.content:eq('+index+')').html());
		//제대로 가져와짐
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="container" align="center">
		<div id="searchbar">
			<div id="searchbar_text">스탬프검색 : </div>
			<div id="searchbar_bar">
				<form method="get" id="searchForm">
					<div id="searchbar_innerContainer">
						<input type="text" id="searchBy" placeholder="검색하고자 하는 매장명, 매장위치를 입력하세요."/>
						<div id="resWindow">
			
						</div>
					</div>
					<input type="submit" id="doSearch" value="검색"/>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>