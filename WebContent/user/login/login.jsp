<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../style/userLogin.css"></link>
<title>Insert title here</title>
</head>
<body>
	<div id="container" align="center">
		<div id="upper">
			<span>로그인</span>
		</div>
		<div id="lower" align="center">
			<form action="loginSvr.jsp" method="POST">
				<table id="Login" class="Login" name="Login">
					<tr>
						<td><span>아이디</span> </td>
						<td> <input type="text" id="MId" name="MId"> </td>
					</tr>
					<tr>
						<td><span>비밀번호</span></td>
						<td> <input type="password" id="MPw" name="MPw"> </td>
					</tr>
				</table>
				<input type="submit" id="sub" name="sub" value="확인">
				<input type="reset" id="res" name="res" value="취소"><br>
			</form>
			<a href="#">회원가입</a>
		</div>
	</div>
</body>
</html>