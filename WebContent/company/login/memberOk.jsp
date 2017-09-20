<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
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
		String Cpw = request.getParameter("Cpw");
		String Cname = request.getParameter("Cname");
		String Cregion = request.getParameter("Cregion");
		String Cphone = request.getParameter("Cphone");
		String Cemail = request.getParameter("Cemail");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection
					("jdbc:mysql://localhost/CooDB","root","1234");
			pstmt = conn.prepareStatement("insert into coo_companyTB(Cidx,Cpw,Cname,Cregion,Cphone,Cemail) values(?,?,?,?,?,?)");
			
			if(request.getParameter("Cidx")!="" && request.getParameter("Cpw")!=""
					&& request.getParameter("Cname")!="" && request.getParameter("Cregion")!=""
					&& request.getParameter("Cphone")!="" && request.getParameter("Cemail")!=""){
				
				pstmt.setString(1, Cidx);
				pstmt.setString(2, Cpw);
				pstmt.setString(3, Cname);
				pstmt.setString(4, Cregion);
				pstmt.setString(5, Cphone);
				pstmt.setString(6, Cemail);
				pstmt.executeUpdate();
				out.println("<script>alert('회원가입 완료'); </script>");
			}
			else{
				out.println("<script>alert('모든 정보를 입력해주세요.'); history.go(-1);</script>");
			}
			conn.close();
			pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>