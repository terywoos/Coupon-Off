<%@page import="Search.Stamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/coupon.css?var=1"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$(document).on("click",".content",function(){
			if($(this).find(".back").css("display") == "none"){
				$(this).find(".back").css("display","block");
				$(this).find(".front").css("display","none");
				var scount = $(this).attr('data-scount');
				var index = $(this).attr('data-index');
				var str = ".stamp"+index + " div";
				if(scount < 12)
				{
					for(var i=1; i<=scount; i++){
						$(str).eq(i-1).css('background-image','url(../images/stampOn.png)');
				}
				}else if(scount = 12)
				{
						$(str).eq(i-1).css('background-image','url(../images/stampOff.png)');
				}
			}else if($(this).find(".front").css("display") == "none"){
				$(this).find(".front").css("display","block");
				$(this).find(".back").css("display","none");
			}
		});
		
		load('#form', '2');
		$(".button").on("click", function(){
			load('#form', '1', '#btn');
		});
		$('.button2').on("click", function(){
			less('#form', '1', '#btn');
		});
	});
	
	function shopInfo() {
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
	}
	
	$(document).on("click", ".close", function(){
			$("#blackScreen").css("display","none");
			$("#ajaxWindow").css("display","none");
	});
	function load(id, cnt, btn){
		var list = id + " .load:not(.active)";
		var length = $(list).length;
		var total_cnt;
		//alert(length);
		if(cnt <= length){
			total_cnt = cnt;
		}else {
			total_cnt = length;
			
		alert("확인된 Stamp가 없습니다.");
		}
		//alert(length);
		 $(list + ":lt(" + total_cnt + ")").removeClass("less").addClass("active");
	}
	function less(id, cnt, btn){
		var list = id + " .load.active";
		var length = $(list).length;
		var now_cnt;

		if(length == 2){
			now_cnt = length;
			alert("못줄임");
		}else{
			if(cnt <= length){
				now_cnt = cnt;
				//alert(length);
			
			}
			 $(list + ":last(" + now_cnt+ ")").removeClass("active").addClass("less");
				
		}
		//alert(now_cnt);
		
	}
</script>
</head>
<body>
	<div id="blackScreen">
		<div id="ajaxWindow"></div>
	</div>
	<div id="form" class="more">
		<%
			if(session.getAttribute("ID")==null) {
				
			} else {
				ArrayList<Stamp> couponTempList = (ArrayList<Stamp>)session.getAttribute("stamps");
		%>
			
		<% for(int i=0; i<=couponTempList.size()/3; i++) { %>
			<div id="row<%=i%>" class="rows load">
		<%  
				for(int j=i*3; j<i*3+3; j++) {  
					try {
						Stamp couponTempStamp = couponTempList.get(j);
						String cname = couponTempStamp.getCName();
						int scount = couponTempStamp.getSCount();
						int cnum = couponTempStamp.getCNum();
						String cintro = couponTempStamp.getCintro();
						String clogo = couponTempStamp.getClogo();
						
		%>
						<div class="content" align="center" data-cname="<%=cname%>" data-scount="<%=scount%>" data-cnum="<%=cnum%>" data-index="<%=j%>">
			  			<div class="front">
							<div class="couponform">
								<div class="Clogo"><img src='../<%=clogo %>' width='190px' height='250px'/></div>
								<div class="Cname"><%=cname%></div>
								<div class="Cinfo">
									<span><%=cintro %></span>
								</div>
								<div class="couponfont" onclick="event.cancelBubble=true;">
									<a href="#">예약</a>&nbsp&nbsp<a href="#" onclick="shopInfo();">더보기</a>
								</div>
							</div>
						</div>

						<div class="back">
							<div class="couponbackform">
								<div class="stampform">
									<div class="stamp<%=j%>" id="coupon_Stamp">
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
		<%      } 
					catch(IndexOutOfBoundsException ie) {
						break;
					}
				}
		 %>
		</div>
		<%}%>
		<div id="btn" class="btn_wrap">
			<div class="buttonform">
			<div class="button"><img src="../images/morebtn.png"></div>
			<div class="button2"><img src="../images/lessbtn.png"></div>
			</div>
		</div>
	<%}%>
		
	</div>	
 
</body>
</html>