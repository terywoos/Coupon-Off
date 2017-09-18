<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<div align="center">
		<h2>로그인</h2>
		<hr>
		<form action="loginOk.jsp" method="POST">
			<table id="Login" class="Login" name="Login">
				<tr>
					<td> 아이디 </td>
					<td> <input type="text" id="Cidx" name="Cidx"> </td>
				</tr>
				<tr>
					<td> 비밀번호 </td>
					<td> <input type="password" id="Cpw" name="Cpw"> </td>
				</tr>
				<tr>
					<td> <input type="radio" class="Posi" name="Posi" value="개인"> 개인 </td>
					<td> <input type="radio" class="Posi" name="Posi" value="사업자"> 사업자 </td>
				</tr>
			</table>
			<input type="submit" id="sub" name="sub" value="확인">
			<input type="reset" id="res" name="res" value="취소">
			<a href="member.jsp">회원가입</a>
		</form>
	</div>
</body>
</html>