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
			alert("검색하고자 하는 매장명을 입력해주세요.");
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
						var scount= $(this).find("scount").text();
						var newdiv = $('<div>').addClass("stampResult").attr('data-searchSnum',snum).attr("data-scount",scount).text(cname);
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
		$("#ajaxWindow").empty();
		var index = parseInt(e.target.getAttribute("data-searchSnum"))-1;
		var inner = $('.content:eq('+index+')').html();
		var dScount = e.target.getAttribute("data-scount");
		var dIndex = $('.content:eq('+index+') #coupon_Stamp').attr('class').substring(5);
		//제대로 가져와짐 이아래부터 수정된부분
		var width = $('body').prop('scrollWidth');
		var height = $('body').prop('scrollHeight');
		
		$("#blackScreen").css({
			"width": width,
			"height":height,
			"display": "block"
		});
		
		$("#ajaxWindow").css({
			"display":"block",
			"margin": "auto",
			"width": "400px",
			"height": "300px"
		});
		var text = "<div class='content' align='center' data-scount='"+dScount+"' data-index='"+dIndex+"'>";
		text += inner;
		text+= "</div>"
		$("#ajaxWindow").append(text);
		
		//
		if($('#ajaxWindow').find('.front').css('display')=="none") {
			$('#ajaxWindow').find('.front').css('display','block');
			$('#ajaxWindow').find('.back').css('display','none');
		}//
		
		$('#ajaxWindow .couponfont').removeClass('couponfont').attr('id','search_couponfont').html('<div id="search_close" onclick="closeWindow()">창닫기</div>');
		$('#resWindow').css('display','none');
	});
	
	function closeWindow() {
		$("#blackScreen").css("display","none");
		$("#ajaxWindow").css("display","none");
	}
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
						<input type="text" id="searchBy" placeholder="매장명을 입력하시면 스탬프 확인이 가능합니다."/>
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