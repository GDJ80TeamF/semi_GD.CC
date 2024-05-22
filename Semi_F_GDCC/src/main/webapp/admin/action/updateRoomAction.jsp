<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%
	System.out.println("=========================");
	String roomGrade = request.getParameter("roomGrade");
	System.out.println("=========================");
	int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
	System.out.println("=========================");
	int roomMax = Integer.parseInt(request.getParameter("roomMax"));
	String roomState = request.getParameter("roomState");
	int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	
	Part part = request.getPart("roomImg");
	String originalName = part.getSubmittedFileName();
	
	// 원본이름에서 확장자만 분리
    int dotIdx = originalName.lastIndexOf(".");
    String ext = originalName.substring(dotIdx); // .png
    
    UUID uuid = UUID.randomUUID();
    String fileName = uuid.toString().replace("-", "");
    fileName = fileName + ext;
	
	System.out.println("roomGrade: " + roomGrade);
	System.out.println("roomPrice: " + roomPrice);
	System.out.println("roomMax: " + roomMax);
	System.out.println("roomState: " + roomState);
	System.out.println("roomImg: " + part);
	System.out.println("roomNo: " + roomNo);
	
	int row = RoomDAO.updateRoom(roomNo, roomGrade, roomPrice, roomMax, roomState, fileName);
	
		if(row == 1){
			System.out.println("수정 성공");
			InputStream is = part.getInputStream();
			String filePath = request.getServletContext().getRealPath("/admin/upload");
			File f = new File(filePath, fileName); // 빈파일
			OutputStream os = Files.newOutputStream(f.toPath()); // os + file
			is.transferTo(os);
			
			os.close();
			is.close();
			response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
	}else{
		System.out.println("수정 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp?");
	}
%>