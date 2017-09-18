<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CouponOff - 회원가입(company)</title>
</head>
<body>
	<div align="center">
		<h3>회원가입 - (company)</h3>
		<hr>
		<form method="POST">
			<table id="Cmember" class="Cmember">
				<tr>
					<td> 아이디 </td>
					<td> <input type="text" id="Cidx" name="Cidx"> </td>
					<td> <button id="CidxCheck" name="CidxCheck">중복확인</button> </td>
				</tr>
				<tr>
					<td> 비밀번호 </td>
					<td> <input type="password" id="Cpw" name="Cpw"> </td>
				</tr>
				<tr>
					<td> 매장명 </td>
					<td> <input type="text" id="Cname" name="Cname"> </td>
				</tr>
				<tr>
					<td> 매장주소 </td>
					<td> <input type="text" id="Cregion" name="Cregion" > </td>
				</tr>
				<tr>
					<td> 연락처 </td>
					<td> <input type="text" id="Cphone" name="Cphone" placeholder="-를 뺴고 적어주세요"> </td>
				</tr>
				<tr>
					<td> 이메일 </td>
					<td> <input type="text" id="Cemail" name="Cemail" placeholder="couponoff@coupon.com"> </td>
				</tr>
			</table>
			<input type="submit" id="Csub" value="확인">
			<input type="reset" id="Cre" value="취소">
		</form>
	</div>
</body>
</html>