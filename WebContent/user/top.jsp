<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/top.css"></link>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		
		
		/*$(document).on('click','#editBtn',function(){
			 var num = $("#num").val();
			 var id = $("#idx").text();
			 var title = $("#title").text();
			 var txt = $.trim($("#txt").text()); 
		     var imgUrl = $("#txt").find("img").attr("src");
				 
			// alert(txt + imgUrl);
			 //alert(num+ " "+ mode);
			 $.ajax({
				 type: "post",
				 url:"write.jsp",
				 data:{
					 	 num : num,
						 idx : id,
						 title : title,
						 txt : txt,
						 imgUrl : imgUrl,
						 mode : "edit"
				 	},
				 success:function(data){
					 $('#board-all').empty();
					 $('#board-all').append(data);
				//	 boardBtn();
				 }
			 })
		 });*/
	});
</script>
</head>
<body>
	<div id="topbar" align="center">
		<div id="top_logo"></div>
		<div id="top_container">
			<a href="#" id="top_login">로그인</a>
			<a href="#" id="top_signUp">회원가입</a>
		</div>
	</div>
</body>
</html>