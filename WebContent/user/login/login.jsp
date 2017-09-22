<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/userLogin.css"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	function login(event) {
		event.preventDefault();
		var id = $('#MId').val();
		var pw = $("#MPw").val();
		if(id.trim()==""||pw.trim()=="") {
			alert("로그인을 위해 모든 정보를 입력해주세요.");
		}  else {
			$.ajax({
				type: "POST",
				url : "login/loginSvr.jsp",
				data: {
					MId: id,
					MPw : pw
				},
				success: function(data) {
					//처리부 : 로그인성공(리디렉트) / 존재하지 않는 아이디/ 아이디 비밀번호 확인 두 경우로 나눠서 파악
					//
					var res = data.trim();
					if(res=="success") {
						//성공
						alert("로그인 성공!");
						location.reload();
						//세션페이지 하나만들어서 거기로 보내고 거기서 다시 리다이렉트로 보내줘야하는건가봐....
					} else if(res=="nm") {
						alert("아이디와 비밀번호를 확인해주세요.");
						//아이디 비밀번호 일치하지 않음
					} else {
						alert("존재하지 않는 아이디입니다.");
						//아이디 없음
					}
 				}
			});
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="login_container" align="center">
		<div id="upper">
			<span>로그인</span>
			<div id="close"></div>
		</div>
		<div id="lower" align="center">
			<form action="login/loginSvr.jsp" method="POST" onsubmit="login(event);">
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
				<input type="submit" id="login_sub" name="sub" value="확인">
				<input type="reset" id="login_res" name="res" value="취소"><br>
			</form>
			<a href="#" id="login_signup">회원가입</a>
		</div>
	</div>
</body>
</html>