<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String Cidx = request.getParameter("Cidx");
		String Cpw = request.getParameter("Cpw");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
				("jdbc:mysql://localhost/CooDB","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from Coo_companyTB where Cidx = '" + Cidx + "';");
			
		if(rs.next()){
			String Cid = rs.getString("Cidx");
			String Cpww = rs.getString("Cpw");
				
			if(Cid.equals(Cidx) && Cpww.equals(Cpw)){
				session.setAttribute("Cidx", Cidx);
				response.addCookie(new Cookie("Cdix", Cid));
				out.println("<script>alert('로그인 성공'); </script>");
			}
			else{
				out.println("<script>alert('아이디 비밀번호 오류'); history.go(-1); </script>");
			}
		}
		else {
			out.println("<script>alert('아이디 비밀번호 오류'); history.go(-1); </script>");
		}
	%>
</body>
</html>