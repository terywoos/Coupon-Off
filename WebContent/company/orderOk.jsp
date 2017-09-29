<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String mid = (String)session.getAttribute("MId");
		int cnum = (int)session.getAttribute("Cnum");
		String cname = (String)session.getAttribute("Cname");
		int MPoint = Integer.parseInt(request.getParameter("rePoint"));
		String pBname = request.getParameter("pbname");
		String pBsize = request.getParameter("pbsize");
		String pBprice = request.getParameter("pbprice");
		int pMoneyTotal = Integer.parseInt(request.getParameter("pMoneyTotal"));
		
		System.out.println(MPoint);
	%>
	    <sql:update var="orderIn" dataSource="jdbc/mysql3">
	    		insert into Coo_productBuyTB(MId,Cnum,Cname,PBname,PBsize,PBprice) value('<%= mid %>','<%= cnum %>','<%= cname %>','<%= pBname %>','<%= pBsize %>',<%= Integer.parseInt(pBprice) %>);
	    </sql:update>
		
	   	<sql:update var="stampIn" dataSource="jdbc/mysql3"> 
	    		update Coo_StampTB set SCount = SCount + 1 where Mid = '<%= mid %>' and Cnum = '<%= cnum %>';    		
	    </sql:update>
	    
		<% if(MPoint >= 0){ %> 
		   	<sql:update var="pointOut" dataSource="jdbc/mysql3"> 
		    		update Coo_MemberTB set MPoint = <%=MPoint %> where Mid = '<%= mid %>';    		
		    </sql:update>
	    <%} %>
	
	<%
		out.println("ok");
	%>