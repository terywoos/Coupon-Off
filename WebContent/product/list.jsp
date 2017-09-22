<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$(document).on("click","#pList figure",function(){
			var $blank = $("<div class='blank'></div>");
			
			$(this).prepend($blank).on("click",function(){
				$(this).find($blank).remove();
			});
			
		});
		
	});

</script>
<div id="productList">
	<div class="title">제품리스트</div>
	<div id="pList">
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">XL</span>
			</div>
			<figcaption>아메리카노</figcaption>
			<span class="price">2000원</span>
		</figure>
		<figure>
			<div class="img">
				<span class="size">L</span>
			</div>
			<figcaption>카페라떼</figcaption>
			<span class="price">2500원</span>
		</figure>
		
	</div>
</div>
