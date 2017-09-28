<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <% 
    		String Pname = request.getParameter("pName");
    		String Psize = request.getParameter("pSize");
    		String Pprice = request.getParameter("pPrice");
    
    %>
<div id="userView" data-idx="<%=session.getAttribute("MId")%>">
	<div class="title">회원정보</div>
	<% if( session.getAttribute("MId") != null && session.getAttribute("Cnum") != null ){%>
		<sql:query var="rs" dataSource="jdbc/mysql3">
			select SCount from Coo_stampTB where MId = '<%= session.getAttribute("MId") %>' and Cnum = '<%= session.getAttribute("Cnum") %>'
		</sql:query>
	<%	} %>
	<div class="cp">
		<span>
			<c:if test="${rs.rowCount != 0}">
				<c:forEach var="row" items="${rs.rows}">
					${row.SCount}
				</c:forEach>
			</c:if>
			<c:if test="${rs.rowCount == 0}">
				<c:out value="0"/>
			</c:if>
		</span>
	</div>
	<div class="userInfo">
		<div class="userName"><span><%=session.getAttribute("MName") %></span>님</div><div class="cpCnt"><span>1</span></div>
		<span>등급</span> VIP <span>포인트</span><span class="pt"><%=session.getAttribute("MPoint") %></span>점
	</div>
	<ul class="lists">
		<li class="nowListBtn">구매 리스트</li><li class="pastListBtn">최근 구매 내역</li>
		<li class="listContents">
			<ul class="buyList"></ul>
			<ul class="PBList">
				<%@include file="../product/pastList.jsp"%>
			</ul>
		</li><li class="subOrder"></li>
	</ul>
</div>