<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="../../js/company.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/companyLogin.css"></link>
<title>로그인 폼</title>
</head>
<body>
	<div id="Clogin_container" align="center">
		<div id="Cupper">
			<span>로그인</span>
			<div id="Cclose"></div>
		</div>
		<div id="Clower" align="center">
			<form id="LoginForm">
				<table id="CLogin" class="CLogin" name="CLogin">
					<tr>
						<td> 아이디 </td>
						<td> <input type="text" id="Cidx" name="Cidx"> </td>
					</tr>
					<tr>
						<td> 비밀번호 </td>
						<td> <input type="password" id="Cpw" name="Cpw"> </td>
					</tr>
					<!--
					<tr>
						<td> <input type="radio" class="Posi" name="Posi" value="개인"> 개인 </td>
						<td> <input type="radio" class="Posi" name="Posi" value="사업자"> 사업자 </td>
					</tr>
					-->
				</table>
				<input type="button" id="CLogBtn" name="CLogBtn" value="확인">
				<input type="reset" id="CLogRes" name="CLogRes" value="취소">
				<a href="#" id="top_member">회원가입</a>
			</form>
		</div>
	</div>
</body>
</html>