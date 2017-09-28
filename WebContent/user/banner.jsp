<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src=https://code.jquery.com/jquery-3.2.1.js></script>
<link rel="stylesheet" type="text/css" href="../style/banner.css?Var=1"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="product_con">
    <ul class="product_list">
        <li><img src="../images/bgtest01.jpg"></li>
        <li><img src="../images/bgtest02.jpg"></li>
        <li><img src="../images/bgtest03.jpg"></li>
        <li><img src="../images/bgtest04.jpg"></li>
         <li><img src="../images/bgtest05.jpg"></li>
    </ul>

    <div class="numlist">
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
    </div>
</div>

 <script>
 	$(document).ready(function(){
 		
 		    var selNum = 0,
 		        $proList = $(".product_lis, li"),
 		        totalNum = $proList.length,
 
 		        oldNum;

 		    $proList.css({display:"none"});
 		    $proList.eq(selNum).fadeIn(1500);


 		    function setting(adjust) {
 		        var adjust1 = adjust * 1,
 		                adjust2 = adjust * -1;
 		        if(setting.caller == indicate) {
 		            if(selNum < oldNum) {
 		                adjust1 = adjust * -1,
 		                        adjust2 = adjust;
 		            }
 		        }
 		        $proList.eq(selNum).css({ left : adjust1 * 200 + 'px', display : 'block', opacity :0 })
 		        $proList.eq(oldNum).stop().animate({
 		                    left : adjust2 * 200 + 'px', opacity : 0}
 		        );
 		        $proList.eq(selNum).stop().animate({left : 0, opacity : 1},500, function(){});

 		    }

 		    function indicate(){
 		        oldNum = selNum;
 		        selNum = $(this).index();
 		        if( selNum == oldNum) return;
 		        setting('1')
 		    }

 		    $('.numlist a').on('click', indicate)
 	});
 </script>
</body>
</html>