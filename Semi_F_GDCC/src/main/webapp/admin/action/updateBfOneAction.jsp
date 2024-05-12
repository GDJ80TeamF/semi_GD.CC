<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>

<%
	
	int menuNo = Integer.parseInt(request.getParameter("menuNo"));
	String menuSeason = request.getParameter("menuSeason");
	String menuMain = request.getParameter("menuMain");
	String menuInfo = request.getParameter("menuInfo");
	
	
	Part part = request.getPart("menuImg");
	String profileOriginal = part.getSubmittedFileName();

	System.out.println(menuNo);
	System.out.println(menuSeason);
	System.out.println(menuMain);
	System.out.println(menuInfo);
	System.out.println(profileOriginal);
	
	
	
	// 원본이름에서 .확장자 추출
	String ext = profileOriginal.substring(profileOriginal.lastIndexOf("."));
	// 저장에 사용할 파일 이름 : 중복방지를 위해 UUID 유틸 클래스 사용
	String txt = (UUID.randomUUID().toString()).replace("-", "");
	String menuImg = txt+ext; // 생성됨이름 뒤에 .확장자 추가
	System.out.println(menuImg);
	
	
	int row = BfDAO.updateBfOne(menuNo, menuSeason, menuMain, menuInfo, menuImg);
	if(row != 0){
		String uploadPath = request.getServletContext().getRealPath("admin/upload");
		System.out.println(uploadPath);
		/// 저장될 위치를 현재 프로젝트(톰켓 컨텍스트)안으로 지정
		File file = new File(uploadPath, menuImg);
		InputStream inputStream = part.getInputStream(); // part객체안에 파일(바이너리)을 메모로리 불러 옴
		OutputStream outputStream = Files.newOutputStream(file.toPath()); // 메모리로 불러온 파일(바이너리)을 빈파일에 저장
		inputStream.transferTo(outputStream);
		System.out.println("조식메뉴 정보 수정 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/bfOne.jsp?menuNo="+menuNo);
	}else{
		System.out.println("조식메뉴 정보 수정 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/bfOne.jsp?menuNo="+menuNo);
	}
	
	
	



%>