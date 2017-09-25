<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <link rel="stylesheet" type="text/css" href="../style/companyLogin.css"></link>
	<div id="Clogin_container" align="center">
		<div id="Cupper">
			<span>제품 등록</span>
			<div id="Cclose"></div>
		</div>
		<div id="Clower" align="center">
			<form method="post" action="../product/registerOk.jsp" enctype="multipart/form-data"> 
			   제품번호 : <input type="text" name="pIdx" id="pIdx"/><button id="pIdChkBtn" type="button">중복확인</button><br>
			   제품명 : <input type="text" name="pName" id="pName"/><br>
			   사이즈 : <input type="text" name="pSize" /><br>
			   가격 : <input type="text" name="pPrice"/><br>
			   이미지 : <input type="file" name="pImg"/><br>
			   <button type="submit">상품등록</button>
			   <button type="reset">취소</button>
			</form>
		</div>
	</div>