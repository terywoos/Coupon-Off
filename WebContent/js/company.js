
$(document).ready(function(){
	//아이디 중복확인 클릭 메소드
	$("#checkId").click(function(){
  	  
		var idValue = $('#Cidx').val();
	      idValue = idValue.split(' ').join('');

		if(idValue == ""){
			alert("아이디를 입력해 주세요!");
			$('#Cidx').focus();

		}else{
	 		$.ajax({
	             
	            type :"post",
	            url : "checkId.jsp",
	            data : {Cidx : idValue},
	            error : function(){
	                alert('통신실패!!');
	            },
	            success : function whenReult(data){
	            		if(data.trim() == "yes"){
	            			alert("아이디가 이미 있습니다. 다시 입력해주세요!");
	    	         		$('#Cidx').val("");
	    	         		$('#Cidx').focus();
	            		}else{
	            			alert("사용할 수 있는 아이디 입니다.");
	    	         		$('#Cpw').focus();
	            		}
	         	}
	             
	        });
		}
	});
	//회원가입 클릭 메소드
	$("#CmemberOk").click(function(){
		
		var idVal = $("#Cidx").val();
		var pwVal = $("#Cpw").val();
		var naVal = $("#Cname").val();
		var reVal = $("#Cregion").val();
		var phVal = $("#Cphone").val();
		var emVal = $("#Cemail").val();
		idVal = idVal.split(' ').join(''); pwVal = pwVal.split(' ').join('');
		naVal = naVal.split(' ').join(''); reVal = reVal.split(' ').join('');
		phVal = phVal.split(' ').join(''); emVal = emVal.split(' ').join('');
		
		if(idVal == ""){
			alert("아이디를 입력해주세요.!");
			$("#Cidx").focus();
		}
		else if(pwVal == ""){
			alert("비밀번호를 입력해주세요!");
			$("#Cpw").focus();
		}
		else if(naVal == ""){
			alert("매장명을 입력해주세요!");
			$("#Cname").focus();
		}
		else if(reVal == ""){
			alert("매장주소를 입력해주세요!");
			$("#Cregion").focus();
		}
		else if(phVal == ""){
			alert("연락처를 입력해주세요!");
			$("#Cphone").focus();
		}
		else if(emVal == ""){
			alert("이메일을 입력해주세요!");
			$("#Cemail").focus();
		}
		else {
			$.ajax({
				
				type : "POST",
				url : "memberOk.jsp",
				data : {Cidx : idVal,
						Cpw : pwVal,
						Cname : naVal,
						Cregion : reVal,
						Cphone : phVal,
						Cemail : emVal},
				error : function(){
					alert("통신 실패");
				},
				success : function Result(data){
					if(data.trim() == "Ok"){
						alert("회원가입에 성공하였습니다.");
						location.href="../index.jsp";
					}
					else {
						alert("회원가입에 실패하였습니다.");
					}
				}
			});
		}
	});
	//로그인
	$("#CLogBtn").click(function(){
		var idVal = $("#Cidx").val();
		var pwVal = $("#Cpw").val();
		idVal = idVal.split(' ').join(''); pwVal = pwVal.split(' ').join('');
		
		if(idVal == ""){
			alert("아이디를 입력해주세요.!");
			$("#Cidx").focus();
		}
		else if(pwVal == ""){
			alert("비밀번호를 입력해주세요!");
			$("#Cpw").focus();
		}
		else {
			$.ajax({
				type : "POST",
				url : "loginOk.jsp",
				data : {Cidx : idVal,
						Cpw : pwVal},
				error : function(){
					alert("통신 실패");
				},
				success : function CLogin(data){
					if(data.trim() == "Ok"){
						alert("로그인 성공");
						location.href="../index.jsp";
					}
					else {
						alert("아이디 or 비밀번호가 틀렸습니다.");
					}
				}
			});
		}
	});
});