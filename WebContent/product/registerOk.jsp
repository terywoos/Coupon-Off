<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.Writer"%>
<%@page import="java.util.UUID"%>
<%@page import="uploads.Upload"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.File" %>

<%@ page import ="com.oreilly.servlet.*" %>

 
<%
	request.setCharacterEncoding("utf-8");

	int cNum = (Integer)session.getAttribute("Cnum");
	String cIdx = (String)session.getAttribute("Cidx");
	
	int maxSize = 1024*1024*10;
	
	//String uploadPath =  application.getRealPath("/upload/");
	String realPath = "upload/"+cIdx+"/";
	String uploadPath = request.getSession().getServletContext().getRealPath("/")+realPath;
	String fmt = "utf-8";
	String uploadFile = "";
	int read = 0;
	
	byte[] buf = new byte[1024];
	
	new File(uploadPath).mkdir();
	
	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,fmt, new DefaultFileRenamePolicy());
		
		String idx = multi.getParameter("pIdx");
		String name = multi.getParameter("pName");
		String size = multi.getParameter("pSize").toUpperCase();
		String price = multi.getParameter("pPrice");
		String imgUrl = multi.getFilesystemName("pImg");
		
		//String saveName = uploadPath+UUID.randomUUID().toString()+"_"+imgUrl;
		
		System.out.println(idx+" "+name+" "+size+""+price+" "+ imgUrl);
		
		
		//new File(uploadPath+saveName);
		//System.out.println(uploadPath + uploadFile);
		Upload upload = new Upload();

		if(upload.setRegister(cNum, idx, name, size, price).equals("ok") && upload.setRegistImg(imgUrl).equals("ok")){
			response.sendRedirect("../company/index.jsp");
		};
		
	}catch(IOException Ie){
		Ie.printStackTrace();
	}
	
	
%>