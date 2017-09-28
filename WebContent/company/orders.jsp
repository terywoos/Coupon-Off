<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="orderSpace">
	<div class="priceAll"><span>결제금액 :</span><span id="prices">0</span><span>원</span></div>
	<div id="pointBtn">포인트할인</div><div id="CooBtn">쿠폰할인</div>
		<ul class="orders">
			<li>결제 방식</li>
			<li>
				<input type="radio" name="ordersChk" value="card"/>카드결제 <input type="radio" name="ordersChk" value="point" checked="checked"/>포인트결제
			</li>
		</ul>
	<input type="button" id="orderBtn" value="결제">
</div>
