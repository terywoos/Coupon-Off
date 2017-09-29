<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="Coupon.IssueCoupon"/>
<%
	String MId = request.getParameter("MId");
	int Cnum = Integer.parseInt(request.getParameter("Cnum"));
	String paramPath = request.getSession().getServletContext().getRealPath("/") + "upload/";
	test.setCnum(Cnum);
	test.setMId(MId);
	test.issue(paramPath);
%>
