<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../style/companyMember.css"></link>
	<div id="Cjoin" align="center">
		<div id="Cmember_upper"  align="center">
			<span>회원가입</span>
			<div id="Cclose"></div>
		</div>
		<div id="Cmember_container">
			<div id="Cmember_lower">
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
					<input type="reset" id="CmemberRe" value="취소">
				</form>
			</div>
		</div>
	</div>