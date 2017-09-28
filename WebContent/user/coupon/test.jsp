<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../style/test.css?var=4"></link>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
    load('#form', '1');
    $("#btn .button").on("click", function () {
        load('#form', '1', '#btn');
    })
});
 
function load(id, cnt, btn) {
    var list = id + " .load:not(.active)";
    var length = $(list).length;
    var total_cnt;
    if (cnt < length) {
        total_cnt = cnt;
    } else {
        total_cnt = length;
        $(button).hide();
    }
    $(list + ":lt(" + total_cnt + ")").addClass("active");
}
</script>
</head>
<body>
<div id="contents">
  <div id="form" class="main">
 
      <div class="lists_item load">test1</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test2</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test3</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test4</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test5</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test6</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
      <div class="lists_item load">test6</div>
      <div class="lists_item load">txttxttxttxttxttxt</div>
   
    <div id="btn" class="btn_wrap"> <a href="javascript:;" class="button">더보기</a> </div>
  </div>

</div>
</body>
</html>