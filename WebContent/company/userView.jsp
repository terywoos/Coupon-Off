<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <% 
    		String Pname = request.getParameter("pName");
    		String Psize = request.getParameter("pSize");
    		String Pprice = request.getParameter("pPrice");
    		
    		String MId = null;
    		int Cnum = 0;
    		
    		if(session.getAttribute("MId") != null){
    			MId = (String)session.getAttribute("MId");
    		} 
    		if(session.getAttribute("Cnum") != null) {
    			Cnum = (Integer)session.getAttribute("Cnum");
    		}

    		System.out.println("Cnum = "+Cnum);
    %>
<div id="userView" data-idx="<%=session.getAttribute("MId")%>">
	<div class="title">회원정보</div>
		<sql:query var="rsLogo" dataSource="jdbc/mysql3">
			select CIname from Coo_companyImgTB where Cnum = '<%= Cnum %>'
		</sql:query>
			<c:if test="${rsLogo.rowCount != 0 }">
				<c:forEach var="row" items="${rsLogo.rows}">
					<c:set var="logoImg" value="${row.CIname}"/>
				</c:forEach>
			</c:if>
	<div class="cp" style="background-image: url('../upload/logo/${logoImg}')">
		<span>
		<% if( session.getAttribute("MId") != null && session.getAttribute("Cnum") != null ){%>
		<sql:query var="rs" dataSource="jdbc/mysql3">
			select SCount from Coo_stampTB where MId = '<%= session.getAttribute("MId") %>' and Cnum = '<%= session.getAttribute("Cnum") %>'
		</sql:query>
			<c:if test="${rs.rowCount != 0}">
				<c:forEach var="row" items="${rs.rows}">
					${row.SCount}
				</c:forEach>
			</c:if>
		<%} else{ %>
			<c:out value="0" />
		<%} %>
		</span>
	</div>
	<div class="userInfo">
		<% 
			String MName = (String)session.getAttribute("MName");
			int MPoint = (Integer)session.getAttribute("MPoint");
		%>
		<div class="userName">
			<span><c:if test="${MName == null }">
					<c:out value="Guest" />
					</c:if>
					<c:if test="${MName != null }"> 
					<%=session.getAttribute("MName") %>
					</c:if></span>님
		</div>
		<div class="cpCnt">
			<span>
				<%if(session.getAttribute("MId") != null && session.getAttribute("Cnum") != null) {%>
					<sql:query var="rs3" dataSource="jdbc/mysql3">
						select count(CPnum) as CPcount from Coo_couponTB where MId = '<%=session.getAttribute("MId") %>' and Cnum = '<%=session.getAttribute("Cnum") %>';
					</sql:query>
					<c:if test="${rs3.rowCount != 0 }">
						<c:forEach var="row3" items="${rs3.rows}">
							<c:out value="${row3.CPcount }" />
						</c:forEach>
					</c:if>
				<%}else {%>
					<c:out value="0" />
				<% }%>
			</span>
		</div>
		<span>등급</span> VIP <span>포인트</span>
		<%if(session.getAttribute("MId") != null){%>
		<sql:query var="rs2" dataSource="jdbc/mysql3">
			select MPoint from Coo_memberTB where MId = '<%=session.getAttribute("MId") %>';
		</sql:query>
		<span class="pt">
			<c:if test="${rs2.rowCount != 0 }">
				<c:forEach var="row2" items="${rs2.rows}">
					${row2.MPoint}
				</c:forEach>
			</c:if>
		<%} else{%>
			<c:out value="0" />
		<%} %>
		</span>점
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