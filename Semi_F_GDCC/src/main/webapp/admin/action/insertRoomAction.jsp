<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>

<%
	// 받는 파라미터값
	int roomGrade = Integer.parseInt(request.getParameter("roomGrade"));
	int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
	String roomInfo = request.getParameter("roomInfo");
	int roomMax = Integer.parseInt(request.getParameter("roomMax"));
	String roomState = request.getParameter("roomState");
	Part part = request.getPart("roomImg");
	String originalName = part.getSubmittedFileName();
	
	// 원본이름에서 확장자만 분리
    int dotIdx = originalName.lastIndexOf(".");
    String ext = originalName.substring(dotIdx); // .png
    
    UUID uuid = UUID.randomUUID();
    String fileName = uuid.toString().replace("-", "");
    fileName = fileName + ext;
	
	// 디버깅
	System.out.println("roomGrade: " + roomGrade);
	System.out.println("roomPrice: " + roomPrice);
	System.out.println("roomInfo: " + roomInfo);
	System.out.println("roomMax: " + roomMax);
	System.out.println("roomState: " + roomState);
	System.out.println("roomImg : " + part);
	
	int row = RoomDAO.insertRoom(roomGrade, roomPrice, roomInfo, roomMax, roomState, fileName);
	
	if(row == 1) { // insert 성공하면 파일업로드
    	// part -> 1)is -> 2)os -> 3)빈파일
		// 1)
    	InputStream is = part.getInputStream();
    	// 3)+ 2)
		String filePath = request.getServletContext().getRealPath("upload");
		File f = new File(filePath, fileName); // 빈파일
		OutputStream os = Files.newOutputStream(f.toPath()); // os + file
		is.transferTo(os);
		
		os.close();
		is.close();
    }
	
	// Controller Layer
	if(row == 1){
		System.out.println("등록 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
	}else{
		System.out.println("등록 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
	}
%>