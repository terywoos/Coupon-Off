$(document).ready(function(){
	
	function searchAct(){
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
						if($(".PBList li").length <= 1){
							if(confirm("구매내역이 존재하지 않습니다. 스탬프를 만드시겠습니까?")){
								alert("스템프 생성완료");
							}else{
								alert("결제진행");
							}
						}
						setTimeout(function() {
							window.location.reload(true);	
						}, 500);
					}
				}
			});
		}
	}
	
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
	
	$("#mSearch").focus();
	
	$(document).on("keypress","#mSearch",function(e){
		if(e.which == 13){
			searchAct();
		}
	});

	
	//Index에서 회원검색 클릭했을때
	$(document).on("click","#searchBtn",function(){
		searchAct();			
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
		var introVal = $("#Cintro").val();
		var clogo = $("#Clogo")[0].files[0];

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
			var formData = new FormData(); 
			
			formData.append("Cidx", idVal); 
			formData.append("Cpw", pwVal);
			formData.append("Cname", naVal);
			formData.append("Cregion", reVal);
			formData.append("Cphone",phVal);
			formData.append("Cemail", emVal);
			formData.append("Cintro",introVal);
			formData.append("Clogo", clogo );
			
			$.ajax({
				
				type : "POST",
				url : "login/memberOk.jsp",
				data : formData,
				processData:false,
				contentType:false,
				error : function(){
					alert("통신 실패");
				},
				success : function Result(data){
					if(data.trim() == "ok"){
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
	var $Ppt = $("#userView .userInfo").find(".pt").text();
	var $list = $("#userView .buyList");
	var $subOrder = $("#userView .subOrder");
	var $priceAll = $("#orderSpace .priceAll > #prices");
	var Mid = $("#userView").attr("data-idx");  // session.id
	var $price = 0;
	var $cntPrice = 0;
	var $etcAll;
	var $pCnt = 1;
	var $buyList = $("#userView .PBList");
	$buyList.prepend("<li> 최근 구매한 내역입니다 </li>");
	
	var $buyPrice = $("<li class='buyPrice'><span>금&nbsp;&nbsp;&nbsp;&nbsp;액</span><span></span><span>0</span><span>원</span></li>");
	var $buyTex = $("<li class='buyTex'><span></span><span>부과세</span><span>0</span><span>원</span></li>");
	var $buyDiscount =$("<li class='buyDiscount'><span>할&nbsp;&nbsp;&nbsp;&nbsp;인</span><span></span><span>0</span><span>원</span></li>");
	var $buyTotal =$("<li class='buyTotal'><span>합&nbsp;&nbsp;&nbsp;&nbsp;계</span><span></span><span>0</span><span>원</span></li>");
	
	var $pointDisc = $("<li class='pointDisc'><span>포인트</span><span class='ptInps'><input type='text' placeholder='포인트 입력'/> PT</span><span class='ptBtns'><input type='button' value='전부사용' id='ptAllBtn'/> <input type='button' value='적용' id='ptOkBtn'/><input type='reset' value='취소' id='ptCancleBtn'/></span></li>");	

	
	$list.prepend("<li id='alt'>제품을 선택하세요!!</li>");
	$subOrder.append($buyPrice);
	$subOrder.append($buyTex);
	$subOrder.append($buyDiscount);
	$subOrder.append($buyTotal);
	
	//리스트 이미지 선택시 블랙창 뛰우기 
	$(document).on("click","#pList figure",function(e){
		if(Mid == "null"){
			alert("회원정보를 입력해주세요!");
			$("#mSearch").focus();
			return;
		}
		nowListCss(); // 리스트 css 초기화
		var pNum = $(this).find("#pNum").attr("data-num");
		var pName = $(this).find("#pName").text();
		var pSize = $(this).find("#pSize").text();
		var pPrice = $(this).find("#pPrice").text();
		var priceAll = parseInt($("#orderSpace .priceAll").find("#prices").text());
		
		$(document).on("click","#pointBtn",function(){
			$buyTotal.after($pointDisc);
			$(document).find('.pointDisc > input').focus();
		})
		
		//alert(priceAll);
		
		var $liContent = $("<li id='"+pNum+"' data-num='"+pNum+"'><span>"+pName+"</span><span>"+pSize+"</span><span>"+pPrice+"</span> x <span id='etc'>1</span></li>");
		
		
		//alert("합계 : "+$price +" 기존 : "+ priceAll + " 제품가 : " + pPrice);
		
		if($(this).attr("id") != "regBtn"){
			var $blank = $("<div class='blank'>X</div>");
			var $plusBtn = $("<div class='plusBtn'>+</div>");
			var $minorBtn = $("<div class='minorBtn'>-</div>");
			
			if($(this).has(".blank").length == 0){
				$list.find("#alt").after($liContent);
				$(this).prepend($blank).prepend($plusBtn).append($minorBtn);
				
				$etcAll = $($list).find("#"+pNum+" > #etc");
				$pCnt = parseInt($etcAll.text());
				
				$price = $price + parseInt(pPrice);
				var $tp = $price * 0.1;
				$buyPrice.find("span:nth-child(3)").text($price-$tp);
				$buyTex.find("span:nth-child(3)").text($tp);
				$buyTotal.find("span:nth-child(3)").text($price);
				//$price = $price + parseInt(pPrice);				
				
				$(this).find(".plusBtn").on("click",function(e){
					pPrice = $(this).parent().find("#pPrice").text();
					pNum = $(this).parent().find("#pNum").attr("data-num");
					$etcAll = $($list).find("#"+pNum+" > #etc");
					$pCnt = parseInt($etcAll.text());
					
					$pCnt++;	
					$price = $price + parseInt(pPrice);
					//alert("cnt =>"+$pCnt+" price =>"+$price);
					var $tp = $price * 0.1;
					$buyPrice.find("span:nth-child(3)").text($price-$tp);
					$buyTex.find("span:nth-child(3)").text($tp);
					$buyTotal.find("span:nth-child(3)").text($price);

				});
				
				$(this).find(".minorBtn").on("click",function(e){
					pPrice = $(this).parent().find("#pPrice").text();
					pNum = $(this).parent().find("#pNum").attr("data-num");
					$etcAll = $($list).find("#"+pNum+" > #etc");
					$pCnt = parseInt($etcAll.text());
					$pCnt--;
					if($pCnt >= 1){
						//alert("감소");
						$price = $price - parseInt(pPrice);
						var $tp = $price * 0.1;
						$buyPrice.find("span:nth-child(3)").text($price-$tp);
						$buyTex.find("span:nth-child(3)").text($tp);
						$buyTotal.find("span:nth-child(3)").text($price);

					}else if($pCnt <= 0){
						alert("제품을 추가 하세요!");
						$pCnt = 1;
					}
				});
				
				$(this).find(".blank").on("click",function(e){
					//alert($pCnt);
					pPrice = $(this).parent().find("#pPrice").text();
					$etcAll = $($list).find("#"+pNum+" > #etc");
					$pCnt = parseInt($etcAll.text());
					
					if($pCnt >= 1){
						$price = $price - (parseInt(pPrice)*$pCnt);
						var $tp = $price * 0.1;
						$buyPrice.find("span:nth-child(3)").text($price-$tp);
						$buyTex.find("span:nth-child(3)").text($tp);
						$buyTotal.find("span:nth-child(3)").text($price);

					}else if($pCnt <= 0){
						$pCnt = 1;
					}
					
					var priceAll = $("#orderSpace .priceAll").find("#prices").text();
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
	var pCnt = 0;
	var plist = 0;
	var rePoint = 0;
	var pMoneyTotal = 0;
	
	
	$(document).on("click", "#orderBtn",function(){
		
		function orderStart(pMoneyTotal){
			$("#userView .buyList li").each(function(index){
				plist = index;
				var data = [];
					$(this).find("span").each(function(index){
						//console.log($(this).text()+"   ");
						data[index] = $(this).text();
						//console.log("for =>"+ index +"  "+ data[index]);
					});
					var cnt = parseInt(data[3]);
					var pbname = data[0];
					var pbsize = data[1];
					var pbprice = data[2];
					
					for(var i=0 ; i<cnt; i++){
						$.ajax({
							url:"orderOk.jsp",
							type:"POST",
							data:{
								pbname : pbname,
								pbsize : pbsize,
								pbprice : pbprice,
								rePoint : rePoint,
								pMoneyTotal : pMoneyTotal
							},
							success:function(result){								
								var chked = result.trim();
								if(chked == "ok"){
									pCnt++;
									if(plist == pCnt){
										alert("결제가 완료 되었습니다.");
										window.location.reload(true);
									}
								}
							}
						});
					}
			});

		}//
		
		if(!$("#pList figure").find("#pNum").attr("data-num")){
			alert("사업자님 로그인 해주세요!");
			return;
		}

		if(Mid == "null"){
			alert("고객 아이디를 검색해 주세요!");
			$("#mSearch").focus();
		}else{
			
			if(parseInt($Ppt) > 0){
				if(confirm("고객님의 포인트를 사용하시겠습니까?")){		
					if(parseInt($Ppt) > parseInt($priceAll.text())){
						//rePrice = parseInt($priceAll.text());
						rePoint = parseInt($Ppt) - parseInt($priceAll.text());
					}else if(parseInt($Ppt) <= parseInt($priceAll.text())){
						if((parseInt($Ppt) - parseInt($priceAll.text()) <= 0)){
							rePoint = 0;	
							if(confirm(parseInt($priceAll.text())-parseInt($Ppt)+" 원 결제 진행하겠습니까?")){
								orderStart(parseInt($priceAll.text())-parseInt($Ppt));
							}
						}
					}
				}
			}else{
				if(confirm(parseInt($priceAll.text())+" 원 결제 진행하겠습니까?")){
					orderStart(parseInt($priceAll.text()));
					rePoint = parseInt($Ppt);
				}
				
			}
			
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
				if(data.trim() != ""){
					alert("성공");
				}
				else {
					alert("구매내역이 존재하지 않습니다.");
				}
			}
		});
	});

	function nowListCss(){
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
	}
	
	$(document).on("click", ".nowListBtn", function(){
		nowListCss();
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