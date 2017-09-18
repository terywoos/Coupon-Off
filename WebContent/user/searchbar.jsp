<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../style/searchbar.css"></link>
<title>Insert title here</title>
</head>
<body>
	<div id="container" align="center">
		<div id="searchbar">
			<div id="searchbar_text">스탬프검색 : </div>
			<div id="searchbar_bar">
				<form method="get">
					<input type="text" id="searchBy" placeholder="검색하고자 하는 매장명, 매장위치를 입력하세요."/>
					<input type="submit" id="doSearch" value="검색"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>