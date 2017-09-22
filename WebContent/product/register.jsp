<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<form action="registerOk.jsp" enctype="multypart/form-data">    
	   제품번호 : <input type="text" name="pIdx"/><br>
	   제품명 : <input type="text" name="pName"/><br>
	   가격 : <input type="text" name="pPrice"/><br>
	   이미지 : <input type="file" name="pImg"/><br>
	   <button>상품등록</button>
	   <button type="reset">취소</button>
	</form>
   