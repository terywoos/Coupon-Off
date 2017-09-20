<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../style/join.css"></link>
<title>Insert title here</title>
</head>
<body>
	<div id="join" align="center">
		<div id="signup_upper"  align="center">
			회원가입
		</div>
		<div id="signup_container">
			<div id="signup_lower">
			<form action="joinSvr.jsp" method="POST" id="signup_form">
				<table id="signUp">
					<tr>
						<td> 아이디 </td>
						<td> <input type="text" id="signup_MId" name="signup_MId"> </td>
						<td> <input type="button" id="checkId" name="checkId" onclick="check()" value="[중복확인]"> </td>
					</tr>
					<tr>
						<td> 비밀번호 </td>
						<td> <input type="password" id="signup_Mpw" name="signup_Mpw"> </td>
					</tr>
					<tr>
						<td> 이름 </td>
						<td> <input type="text" id="signup_Name" name="signup_Name"> </td>
					</tr>
					<tr>
						<td> 전화번호 </td>
						<td> <input type="text" id="signup_PhoneNum" name="signup_PhoneNum" placeholder="-를 빼고 적어주세요"> </td>
					</tr>
					<tr>
						<td> 이메일 </td>
						<td> <input type="text" id="signup_email" name="signup_email" placeholder="couponoff@coupon.com"> </td>
					</tr>
				</table>
				<input type="submit" id="signup_sub" value="확인">
				<input type="reset" id="signup_re" value="취소">
			</form>
		</div>
		</div>
	</div>
</body>
</html>