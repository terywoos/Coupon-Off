<%@page import="Coupon.Coupon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String referer = request.getHeader("referer");
	if(referer==null)
		response.sendRedirect("index.jsp");
	
	ArrayList<Coupon> coupons = (ArrayList<Coupon>)session.getAttribute("coupons");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CouponOff</title>
<link rel="stylesheet" type="text/css" href="../style/UCoupon.css"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		$("#top_logo").click(function() {
			location.href = "index.jsp";
		});
		
		function makeIndex(startPage, endPage, prev, next,page) {
			var elements = "";
			elements += "<ul id='UCoupon_indexlist'>";
			if(prev) {
				elements += "<li><a href='?page="+(startPage-1)+"'>&lt;&lt;</a></li>";
			}
			for(var i= startPage; i<=endPage; i++) {
				if(i!=page) {
					elements += "<li><a href='?page="+i+"'>"+ i+"</a></li>";
				} else {
					elements += "<li><span><b>" + i + "</b></span></li>";
				}
			}
			if(next) {
				elements +="<li><a href='?page="+(endPage+1) +"'>&gt;&gt;</a></li>";
			}
			$('#UCoupon_index').html(elements);
		}
		
		function calcPage(page) {
			//페이지계산. 이 내부에서 태그만드는 부분은 여기서 파라미터가져가서 또다른 함수에 구현
			var size = <%=coupons.size()%>;
			var endPage = Math.ceil(page/10)*10;
			var tempEndPage= Math.ceil(size/10);
			var startPage = (endPage-10)+1;
			if(endPage>tempEndPage)
				endPage=tempEndPage;
			
			var prev = startPage==1? false: true;
			var next = endPage * 10 >= size? false: true;
			makeIndex(startPage,endPage,prev,next,page);	
		}
		
		
		
		var CurPage = parseInt(<%=request.getParameter("page")%>);
		calcPage(CurPage);
		
	});
	
	$(document).on("click",".UCoupon_rows",function(){
		//클릭했을때
		var CPnum = $(this).find('td:first-child').text();
		var width = $('body').prop('scrollWidth');
		var height = $('body').prop('scrollHeight');
		
		$("#blackScreen").css({
			"width": width,
			"height":height,
			"display": "block"
		});
		
		$.ajax({
			 url:"barcodeView.jsp",
			 data: {
				 CPnum: CPnum
			 },
			 success:function(data){
				$("#ajaxWindow").empty();
				$("#ajaxWindow").append(data);
				$("#ajaxWindow").css({
					"display":"block",
					"margin": "auto",
					"width": "400px",
					"height": "235px"
				});
			 }
		});
	})
	
</script>
</head>
<body>
	<div id="blackScreen">
			<div id="ajaxWindow"></div>
	</div>
	<div class="top">
	      		<%@include file="UTop.jsp"%>
	</div>
	<div class="search">
	      <%@include file="searchbar.jsp"%>
	</div>
	<div id= "UCoupon_message" align="center">
	</div>
	<div id="UCoupon_container">
		<div id="UCoupon_list">
			<table id="UCoupon_table">
				<tr>
					<td>쿠폰번호</td>
					<td>바코드</td>
					<td>쿠폰명</td>
					<td>발급일</td>
					<td>만료일</td>
				</tr>
<%
				int curPage = Integer.parseInt(request.getParameter("page"));
				int size = coupons.size();
				int start = (curPage-1)*10;
				int end = (start+10)>=size? size:start+10;
				for(int i=start; i<end; i++) { %>
				<tr class="UCoupon_rows">
					<td><%=coupons.get(i).getCPnum() %></td>
					<td><img src='http://via.placeholder.com/150x50'/></td>
					<td class="UCoupon_cpname"><%=coupons.get(i).getCPname() %></td>
					<td><%=coupons.get(i).getCPregdate() %></td>
					<td><%=coupons.get(i).getCPexpire() %></td>
				 </tr>	
			<% 	} %>
			</table>
		</div>
		<div id="UCoupon_index">
		
		</div>
	</div>
	
</body>
</html>