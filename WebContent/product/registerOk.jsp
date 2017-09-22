<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="upload.Upload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.File" %>

<%@ page import ="com.oreilly.servlet.*" %>
    
<%
	request.setCharacterEncoding("utf-8");
	
	int maxSize = 1024*1024*10;
	
	//String uploadPath =  application.getRealPath("/upload/");
	String realPath = "upload/";
	String uploadPath = request.getSession().getServletContext().getRealPath("/")+realPath;
	String fmt = "utf-8";
	String uploadFile = "";
	int read = 0;
	
	if(! new File(uploadPath).mkdir()){
		new File(uploadPath).mkdir();		
	}

	
	byte[] buf = new byte[1024];
	
	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,fmt, new DefaultFileRenamePolicy());
		
		String idx = multi.getParameter("pIdx");
		String name = multi.getParameter("pName");
		String price = multi.getParameter("pPrice");
		String imgUrl = multi.getFilesystemName("pImg");
		
		
		System.out.println(idx+" "+name+" "+price+" "+ imgUrl);

		//new File(uploadPath).mkdir();
		
		System.out.println(uploadPath + uploadFile);
		
		Upload upload = new Upload();
		
	}catch(IOException Ie){
		Ie.printStackTrace();
	}
	
	
%>