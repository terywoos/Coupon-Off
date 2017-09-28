<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="Coupon.IssueCoupon"/>
<%
	//Cnum과 Mnum을 넣어주면 작동합니당....
	//바코드 이미지경로를 어디로 잡아야할지 몰라 테스트용으로 ...
	test.setCnum(1);
	test.setMId("test123");
	test.issue();
%>