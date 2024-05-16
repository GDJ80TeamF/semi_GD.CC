<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>

<%

	String adminMail = request.getParameter("adminMail");
	String adminPw = request.getParameter("adminPw");
	String adminName = request.getParameter("adminName");
	String adminGender = request.getParameter("adminGender");
	String adminBirth = request.getParameter("adminBirth");
	String adminContact = request.getParameter("adminContact");
	Part part = request.getPart("adminProfile");
	String profileOriginal = part.getSubmittedFileName();
	System.out.println(adminMail);
	System.out.println(adminPw);
	System.out.println(adminName);
	System.out.println(adminGender);
	System.out.println(adminBirth);
	System.out.println(adminName);
	System.out.println(adminContact);
	System.out.println(profileOriginal);
	// 업로드된 원본 파일 이름
	
	String adminProfile = null;
	
	if(profileOriginal.length() == 0){
		adminProfile = "default.png";
	}else{
		// 원본이름에서 .확장자 추출
		String ext = profileOriginal.substring(profileOriginal.lastIndexOf("."));
		// 저장에 사용할 파일 이름 : 중복방지를 위해 UUID 유틸 클래스 사용
		String txt = (UUID.randomUUID().toString()).replace("-", "");
		adminProfile = txt+ext; // 생성됨이름 뒤에 .확장자 추가
		System.out.println(adminProfile);
	}
	
	int row = AdminDAO.insertAdmin(adminMail, adminPw, adminName, adminGender, adminBirth, adminContact, adminProfile);
	
	if(row != 0){
		String uploadPath = request.getServletContext().getRealPath("admin/upload");
		System.out.println(uploadPath);
		/// 저장될 위치를 현재 프로젝트(톰켓 컨텍스트)안으로 지정
		File file = new File(uploadPath, adminProfile);
		InputStream inputStream = part.getInputStream(); // part객체안에 파일(바이너리)을 메모로리 불러 옴
		OutputStream outputStream = Files.newOutputStream(file.toPath()); // 메모리로 불러온 파일(바이너리)을 빈파일에 저장
		inputStream.transferTo(outputStream);
		System.out.println("사원 등록 성공");
		int row2 = AdminDAO.insertNewAdminPwHistory(adminMail, adminPw);
			if(row2 != 0){
				System.out.println("비번 이력 테이블 업데이트 완료 ");
			}
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}else{
		System.out.println("사원 등록 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	}
	
	



%>