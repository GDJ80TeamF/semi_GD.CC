<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>

<%
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	String adminMail = request.getParameter("adminMail");
	String adminName = request.getParameter("adminName");
	String adminGender = request.getParameter("adminGender");
	String adminContact = request.getParameter("adminContact");
	
	
	Part part = request.getPart("adminProfile");
	String profileOriginal = part.getSubmittedFileName();

	System.out.println(adminName);
	System.out.println(adminGender);
	System.out.println(adminName);
	System.out.println(adminContact);
	System.out.println(profileOriginal);
	
	
	
	// 원본이름에서 .확장자 추출
	String ext = profileOriginal.substring(profileOriginal.lastIndexOf("."));
	// 저장에 사용할 파일 이름 : 중복방지를 위해 UUID 유틸 클래스 사용
	String txt = (UUID.randomUUID().toString()).replace("-", "");
	String adminProfile = txt+ext; // 생성됨이름 뒤에 .확장자 추가
	System.out.println(adminProfile);
	
	
	int row = AdminDAO.updateMyPage(adminMail, adminName, adminGender, adminContact, adminProfile);
	if(row != 0){
		String uploadPath = request.getServletContext().getRealPath("admin/upload");
		System.out.println(uploadPath);
		/// 저장될 위치를 현재 프로젝트(톰켓 컨텍스트)안으로 지정
		File file = new File(uploadPath, adminProfile);
		InputStream inputStream = part.getInputStream(); // part객체안에 파일(바이너리)을 메모로리 불러 옴
		OutputStream outputStream = Files.newOutputStream(file.toPath()); // 메모리로 불러온 파일(바이너리)을 빈파일에 저장
		inputStream.transferTo(outputStream);
		System.out.println("사원 정보 수정 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/myPage.jsp?adminNo="+adminNo);
	}else{
		System.out.println("사원 정보  실패");
		response.sendRedirect("/Semi_F_GDCC/admin/myPage.jsp?adminNo="+adminNo);
	}
	
	//이미지 수정 
	//이미지 파일 ->메뉴 따로 수정
	//이미지 파일 명이 공백일 시에는 쿼리문 분기 
	//update admin set 
	



%>