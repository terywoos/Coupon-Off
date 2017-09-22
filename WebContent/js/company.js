
$(document).ready(function(){
	
	function popup(pUrl,pWidth,pHeight){
		var width = $('body').prop('scrollWidth');
		var height = $('body').prop('scrollHeight');
		
		$("#blackScreen").css({
			"width": width,
			"height":height,
			"display": "block"
		});
		
		$.ajax({
			 url:pUrl,
			 success:function(data){
				$("#ajaxWindow").empty();
				$("#ajaxWindow").append(data);
				$("#ajaxWindow").css({
					"display":"block",
					"margin": "auto",
					"width": pWidth,
					"height": pHeight
				});
			 }
		});
		
	}
	
	//Index에서 회원검색 클릭했을때
	$(document).on("click","#searchBtn",function(){
		var MPhoneNum = $("#mSearch").val();
		MPhoneNum = MPhoneNum.split(' ').join('');
		
		if(MPhoneNum == ""){
			alert("고객님 핸드폰 번호를 입력해주세요.");
			$("#mSearch").focus();
		}
		else {
			$.ajax({
				type : "POST",
				url : "searchOk.jsp",
				data : {MPhoneNum : MPhoneNum},
				error : function(){
					alert("통신 실패!");
				},
				success : function(data){
					if(data.trim() == "Ok"){
						alert("고객정보 불러오기 성공");
					}
					else {
						alert("고객정보가 존재하지 않습니다.");
					}
				}
			});
		}
	});
	
	//아이디 중복확인 클릭 메소드
	$(document).on("click","#checkId",function(){
  	  
		var idValue = $('#Cidx').val();
	      idValue = idValue.split(' ').join('');

		if(idValue == ""){
			alert("아이디를 입력해 주세요!");
			$('#Cidx').focus();

		}else{
	 		$.ajax({
	             
	            type :"post",
	            url : "login/checkId.jsp",
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
	$(document).on("click","#CmemberOk",function(){
		
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
				url : "login/memberOk.jsp",
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
						location.href="index.jsp";
					}
					else {
						alert("회원가입에 실패하였습니다.");
					}
				}
			});
		}
	});
	//로그인
	$(document).on("click","#CLogBtn",function(){
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
				url : "login/loginOk.jsp",
				data : {Cidx : idVal,
						Cpw : pwVal},
				error : function(err){
					alert(err);
					console.log(err);
				},
				success : function CLogin(data){
					if(data.trim() == "Ok"){
						alert("로그인 성공");
						location.href="index.jsp";
					}
					else {
						alert("아이디 or 비밀번호가 틀렸습니다.");
					}
				}
			});
		}
	});
	
	//index 에서 로그인 클릭시
	$(document).on("click","#top_login",function(){
		popup("login/login.jsp","550px","350px");
	});
	
	//로그인창에서 X버튼 눌렀을때
	$(document).on("click","#Cclose",function() {
		$("#blackScreen").css("display","none");
		$("#ajaxWindow").css("display","none");
	});
	
	//index에서 회원가입 클릭했을때
	$(document).on("click","#top_member",function(){
		//회원가입클릭 
		popup("login/member.jsp","500px","400px");
	});	
	
	//product list 뛰움
	$(document).on("click","#regBtn",function(){
		popup("../product/register.jsp","500px","500px");
	})
});