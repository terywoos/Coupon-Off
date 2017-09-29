<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src=https://code.jquery.com/jquery-3.2.1.js></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<link rel="stylesheet" type="text/css" href="../style/banner2.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="slide">
    <ul class="ulslide">
        <li><img src="../images/bgtest01.png" class="banner_images"></li>
        <li><img src="../images/bgtest02.jpg" class="banner_images"></li>
        <li><img src="../images/bgtest03.jpg" class="banner_images"></li>
        <li><img src="../images/bgtest04.jpg" class="banner_images"></li>
        <li><img src="../images/bgtest05.jpg" class="banner_images"></li>
    </ul>

    <div class="list">
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
        <a href="#none">●</a>
    </div>
</div>

 <script>
 	$(document).ready(function(){
 		var current = 0;
 		var max = 0;
 		var container;
 		var interval;

 		function init(){
 			container = $(".slide ul");
 			max = container.children().length;
 			interval = setInterval(next, 3000);
 		}
 		function next(e){
 			current++;
 			if(current > max-1) current = 0;
 			animate();
 		}
		function animate(){
			var moveX = current * 1000;
			TweenMax.to(container, 0.8, {marginLeft:-moveX, ease:Expo.easeOut});
			
			clearInterval(interval);
			interval = setInterval(next, 3000);
			
		}
		init();
		/*
		var $ulslide = $(".ulslide, li");
 		var last;
 		
 		function pagging(page){
 			var page1 = page * 1;
 			var page2 = page * -1;
 			if(pagging.caller == indicate){
 				if(current < last){
 					page1 = page * -1;
 					page2 = page;
 				}
 			}
 			$ulslide.eq(current).css(
 					{
 						left : page1 * 200 + 'px's,
 						display : 'block', 
 						opacity : 0
 					});
 			$ulslide.eq(last).stop().animate({
 				left : page2 * 200 + 'px',
 				opacity : 0
 			});		
 			$ulslide.eq(current).stop().animate({
 				left : page2 * 200 + 'px',
 				opacity : 1
 			}, 500 , function(){});
 		}
 		function indicate(current){
 			last = current;
 			//current = $(this).index();
 			alert(current);
 			if(current == last) return;
 			pagging(current);
 		}
 		
 		$('.list a').on('click', function(){
 			indicate($(this).index());	
 		});
 		*/
 	});
 </script>
</body>
</html>