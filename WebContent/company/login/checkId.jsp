<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String Cidx = request.getParameter("Cidx");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/CooDB","root","1234");
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from Coo_companyTB where Cidx='" + Cidx + "';");
		
		if(rs.next()) {
			out.println("<script>alert('아이디가 존재합니다'); history.go(-1);</script>");
		}
		else {
			out.println("<script>alert('아이디가 존재하지 않습니다.'); history.go(-1);</script>");
		}
	%>
</body>
</html>