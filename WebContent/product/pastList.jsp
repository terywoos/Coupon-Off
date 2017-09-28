<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%if(session.getAttribute("MId") != null && session.getAttribute("Cnum") != null) {%>
<sql:query var="rs" dataSource="jdbc/mysql3">
	select date_format(PBregdate, '%m/%d') as PBregdate ,count(PBname) as PBcnt, PBname , SUM(PBprice) as total_price from coo_productbuytb where MId = '<%=session.getAttribute("MId") %>' and Cnum = '<%=session.getAttribute("Cnum") %>' group by date_format(PBregdate, '%m/%d') order by PBregdate desc ;
</sql:query>
<c:if test="${rs.rowCount != 0 }">
	<c:forEach var="row" items="${rs.rows}">
		<li> <span id="regdate">${row.PBregdate }</span> 
		<c:if test="${row.PBcnt-1 > 0}">
		<span id="PBname">${row.PBname} 외 ${row.PBcnt-1}종</span>
		</c:if> 
		<c:if test="${row.PBcnt-1 == 0 }">
		<span id="PBname">${row.PBname}</span>
		</c:if>
		<span id="PBprice">${row.total_price}</span>
		</li>
	</c:forEach>
</c:if>
<%}else{ %>
<li> <span>구매하신 이력이 없습니다.</span>
<%}%>