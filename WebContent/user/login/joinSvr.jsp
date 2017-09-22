<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="signup" class="member.USignUp"/>
	<jsp:setProperty property="*" name="signup"/>
	<% signup.signUp(); %>
