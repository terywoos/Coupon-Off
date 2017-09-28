<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="member.Member"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String cIdx = request.getParameter("Cidx");
	
	int maxSize = 1024*1024*10;
	
	//String uploadPath =  application.getRealPath("/upload/");
	String realPath = "upload/logo/";
	String uploadPath = request.getSession().getServletContext().getRealPath("/")+realPath;
	String fmt = "utf-8";
	String uploadFile = "";
	int read = 0;
	
	byte[] buf = new byte[1024];
	
	new File(uploadPath).mkdir();
	
	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,fmt, new DefaultFileRenamePolicy());
		
			String Cidx = multi.getParameter("Cidx");
			String Cpw = multi.getParameter("Cpw");
			String Cname = multi.getParameter("Cname");
			String Cregion = multi.getParameter("Cregion");
			String Cphone = multi.getParameter("Cphone");
			String Cemail = multi.getParameter("Cemail");
			String Cintro = multi.getParameter("Cintro");
			String imgUrl = multi.getFilesystemName("Clogo");
			
			System.out.println("imgUrl "+ imgUrl);
			
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
		
			String realFileName = Cidx+"_"+now+ imgUrl.substring(imgUrl.lastIndexOf("."), imgUrl.length());
			
			File oldFile = new File(uploadPath+imgUrl);
			File newFile = new File(uploadPath+realFileName);
			
			boolean isTrue = oldFile.renameTo(newFile);
			
	 		System.out.println("newFile =>"+ newFile.toString() +" "+isTrue);

	 		
	 		
	 		//newFile.createNewFile();
	 		

		//String saveName = uploadPath+UUID.randomUUID().toString()+"_"+imgUrl;
		
		//System.out.println(idx+" "+name+" "+size+""+price+" "+ imgUrl);
		
		
		//new File(uploadPath+saveName);
		//System.out.println(uploadPath + uploadFile);
		Member member = new Member();

		if(member.memberOk(Cidx, Cpw, Cname, Cregion, Cphone, Cemail,Cintro).equals("ok") && member.setRegistImg(realFileName).equals("ok")){
			out.print("ok");
		};
		
	}catch(IOException Ie){
		Ie.printStackTrace();
	}
	
%>
