<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    		String Pname = request.getParameter("pName");
    		String Psize = request.getParameter("pSize");
    		String Pprice = request.getParameter("pPrice");
    
    %>
<div id="userView">
	<div class="title">회원정보</div>
	<div class="cp"><span>9</span></div>
	<div class="userInfo">
		<div class="userName"><span><%=session.getAttribute("MName") %></span>님</div><div class="cpCnt"><span>1</span></div>
		<span>등급</span> VIP <span>포인트</span><span class="pt"><%=session.getAttribute("MPoint") %></span>점
	</div>
	<ul class="lists">
		<li class="nowListBtn">구매 리스트</li><li class="pastListBtn">최근 구매 내역</li>
		<li class="listContents">
			<ul class="buyList">
			</ul>
		</li>
		<li class="pastContents">
			
		</li>
	</ul>
	<div class="priceAll">총<span>0</span>원</div>
</div>