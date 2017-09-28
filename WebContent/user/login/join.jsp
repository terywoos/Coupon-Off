<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/join.css"></link>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	function signUp() {
		alert("회원가입이 완료되었습니다.");
		//확인해야할게,  중복확인 버튼 눌렀을 때 어떤 변수에 그 당시의 아이디인풋창의 값을 저장해둬서 회원가입누를 때랑 다르면 중복체크해달라고뜨게.
		//아이디 최소 몇글자일지 정하기
		return true;
	}
	
	function check()	{
		var MId = $("#signup_MId").val();
		if(MId=="") {
			alert("아이디를 입력한 후 중복확인을 진행해주세요.");
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"login/idChk.jsp",
			data: {MId: MId},
			success: function(data) {
				var classes = $("#signup_MId").attr("class");
				
				if(classes!=undefined&&classes.includes("modified"))
					$("#signup_MId").removeClass("modified");
				
				if(data.trim()=="accepted") {
					alert("사용할 수 있는 아이디입니다.");
					$("#signup_MId").addClass("pos");
				} else {
					alert("이미 등록된 아이디입니다.");
					$("#signup_MId").addClass("neg");
				}
			}
		});
	}
	
	$(document).on("input","#signup_MId",function() {
		var classes = $(this).attr("class");
		if(classes=="modified"||classes==undefined)
			return;
		
		if(classes=="pos") {
			$("#signup_MId").removeClass("pos");
			$("#signup_MId").addClass("modified");
		} else {
			$("#signup_MId").removeClass("neg");
			$("#signup_MId").addClass("modified");
		}
	});
</script>
</head>
<body>
	<div id="join" align="center">
		<div id="signup_upper"  align="center">
			회원가입
			<div id="close"></div>
		</div>
		<div id="signup_container">
			<div id="signup_lower">
				<form action="login/joinSvr.jsp" method="POST" id="signup_form" onsubmit="return signUp();">
					<table id="signUp">
						<tr>
							<td> 아이디 </td>
							<td> <input type="text" id="signup_MId" name="MId"> </td>
							<td> <input type="button" id="checkId" name="checkId" onclick="check()" value="[중복확인]"> </td>
						</tr>
						<tr>
							<td> 비밀번호 </td>
							<td> <input type="password" id="signup_Mpw" name="MPw"> </td>
						</tr>
						<tr>
							<td> 이름 </td>
							<td> <input type="text" id="signup_Name" name="MName"> </td>
						</tr>
						<tr>
							<td> 전화번호 </td>
							<td> <input type="text" id="signup_PhoneNum" name="MPhoneNum" placeholder="-를 빼고 적어주세요"> </td>
						</tr>
						<tr>
							<td> 이메일 </td>
							<td> <input type="text" id="signup_email" name="MEmail" placeholder="couponoff@coupon.com"> </td>
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