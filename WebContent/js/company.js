
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
	
	var $list = $("#userView .buyList");
	var $priceAll = $("#userView .priceAll > span");
	var $price = 0;
	var $cntPrice = 0;
	var $etcAll;
	var $pCnt = 1;
	var $buyList = $("#userView .PBList");
	$buyList.prepend("<li> 최근 구매한 내역입니다 </li>");

	
	$list.prepend("<li>제품을 선택하세요!!</li>");
	
	//리스트 이미지 선택시 블랙창 뛰우기 
	$(document).on("click","#pList figure",function(){
		var pNum = $(this).find("#pNum").attr("data-num");
		var pName = $(this).find("#pName").text();
		var pSize = $(this).find("#pSize").text();
		var pPrice = $(this).find("#pPrice").text();
		var priceAll = $("#userView .priceAll").find("span").text();
		
		var $liContent = $("<li id='"+pNum+"' data-num='"+pNum+"'><span>"+pName+"</span><span>"+pSize+"</span><span>"+pPrice+"</span><span id='etc'>1</span></li>");
		
		//alert("합계 : "+$price +" 기존 : "+ priceAll + " 제품가 : " + pPrice);
		
		if($(this).attr("id") != "regBtn"){
			var $blank = $("<div class='blank'></div>");
			var $plusBtn = $("<div class='plusBtn'>+</div>");
			var $minorBtn = $("<div class='minorBtn'>-</div>");
			
			if($(this).has(".blank").length == 0){
				$list.append($liContent);
				$(this).prepend($blank).prepend($plusBtn).append($minorBtn);
				
				$etcAll = $($list).find("#"+pNum+" > #etc");
				$pCnt = parseInt($etcAll.text());
				
				$price = $price + parseInt(pPrice);				
				
				$(this).find(".plusBtn").on("click",function(){
					$pCnt++;	
					$price = $price + parseInt(pPrice);
					//alert("cnt =>"+$pCnt+" price =>"+$price);
				});
				
				$(this).find(".minorBtn").on("click",function(){
					$pCnt--;
					if($pCnt >= 1){
						//alert("감소");
						$price = $price - parseInt(pPrice);
					}else if($pCnt <= 0){
						alert("제품을 추가 하세요!");
						$pCnt = 1;
					}
				});
				
				$(this).find(".blank").on("click",function(){

					$etcAll = $($list).find("#"+pNum+" > #etc");
					$pCnt = parseInt($etcAll.text());
					
					if($pCnt >= 1){
						$price = $price - (parseInt(pPrice)*$pCnt);
					}else if($pCnt <= 0){
						$pCnt = 1;
					}

					
					var priceAll = $("#userView .priceAll").find("span").text();
					$($list).find("#"+pNum).remove();
					$(this).siblings(".plusBtn").remove();
					$(this).siblings(".minorBtn").remove();
					$(this).remove();
					//alert("합계 : "+$price +" 기존 : "+ priceAll + " 제품가 : " + pPrice);
					$priceAll.text($price);
					
				});
				
			}

			//$cntPrice = parseInt(pPrice)*$pCnt;			
			//var cntPrice = parseInt(pPrice) * $pCnt;
			
			$priceAll.text($price);
			$etcAll.text($pCnt);
			
		}				

	});
	
	//구매 리스트 구매내역 리스트
	$(document).on("click", ".pastListBtn", function(){
		$("#userView .lists > .nowListBtn").css({
			backgroundColor : '#c8c8c8',
			zIndex : '0'
		});
		$("#userView .lists > .pastListBtn").css({
			backgroundColor : 'white',
			zIndex : '2'
		});
		$("#userView .buyList").css("display", "none");
		$("#userView .PBList").css("display", "block");
		
		$.ajax({
			url : "../product/pastList.jsp",
			error : function(){
				alert("통신 오류");
			},
			success : function(data){
				if(data.trim() == "Ok"){
					alert("성공");
				}
				else{
					alert("실패");
				}
			}
		});
	});
	
	$(document).on("click", ".nowListBtn", function(){
		$("#userView .lists > .nowListBtn").css({
			backgroundColor : 'white',
			zIndex : '2'
		});
		$("#userView .lists > .pastListBtn").css({
			backgroundColor : '#c8c8c8',
			zIndex : '0'
		});
		$("#userView .PBList").css("display", "none");
		$("#userView .buyList").css("display", "block");
		
	});

	//product 상품등록
	$(document).on("click touchstart","#regBtn",function(){
		popup("../product/register.jsp","500px","500px");
	})
	
	$(document).on("click","#pIdChkBtn",function(){
		var pIdx = $("#pIdx").val();
	      pIdx = pIdx.split(' ').join('');

			if(pIdx == ""){
				alert("제품번호를 입력해 주세요!");
				$('#pIdx').focus();

			}else{
				$.ajax({
					url:"../product/checkPid.jsp",
					type:"POST",
					data:{
						pIdx : pIdx
					},
					success: function(data){
						if(data.trim() == "yes"){
							alert("이미 존재하는 제품번호 입니다.");
							$('#pIdx').focus();
						}else{
							alert("등록 가능한 제품번호 입니다.");
							$('#pName').focus();
						}
					}
				});
			}
	});
});