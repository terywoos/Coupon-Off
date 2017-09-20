<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="../../js/company.js"></script>
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
		<form id="CmemberForm">
			<table id="Cmember" class="Cmember">
				<tr>
					<td> 아이디 </td>
					<td> <input type="text" id="Cidx" name="Cidx"> </td>
					<td> <input type="button" id="checkId" name="checkId" class="checkId" value="중복확인"> </td>
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
			<input type="button" id="CmemberOk" name="CmemberOk" value="확인">
			<input type="reset" id="Cre" value="취소">
		</form>
	</div>
</body>
</html>