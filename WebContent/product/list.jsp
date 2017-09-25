<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="productList">
	<div class="title">제품리스트</div>
	<div id="pList">
	<% if(session.getAttribute("Cidx") != null){ %>
		<figure id="regBtn">
			<figcaption>+ 상품등록</figcaption>
		</figure>
		<script>
		$("#pList > figure:first-child > figcaption").addClass("figCap");
		</script>
		
	<%}else{ %>
	<script>
		$("#pList > figure:first-child > figcaption").removeClass();
	</script>
	<%}%>
	<% if(session.getAttribute("Cidx") != null){ %>
	<% 
		String imgUrl = "../upload/"+session.getAttribute("Cidx")+"/";
	%>
		<sql:query var="rs" dataSource="jdbc/mysql3">
			select a.Pnum,Pidx,Pname,Psize,Pprice,Pregdate,(select b.PIname from Coo_productImgTB b where b.Pnum = a.Pnum) as PImg from Coo_productTB a where a.Cnum = (select c.Cnum from Coo_companyTB c where Cidx = '<%=session.getAttribute("Cidx") %>') order by a.Pnum desc;
		</sql:query>
		
		<c:if test="${rs.rowCount != 0}">
			<c:forEach var="row" items="${rs.rows}">
				<figure>
					<div id="pNum" data-num="${row.Pnum}"></div>
					<div class="img" style="background-image: url('<%=imgUrl%>${row.PImg}')">
						<c:if test="${not empty row.Psize}"> 
							<span class="size" id="pSize">${row.Psize}</span>
						</c:if>
					</div>
					<figcaption id="pName">${row.Pname}</figcaption>
					<span class="price" id="pPrice">${row.Pprice}</span>원
				</figure>
			</c:forEach>
		</c:if>
	<%}else{ %>
		로그인 해주세요!
	<%} %>		
	</div>
</div>
