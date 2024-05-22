<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%
    int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	System.out.println("roomNo: " + roomNo);
    String roomGrade = request.getParameter("roomGrade");
    System.out.println("roomGrade: " + roomGrade);
	String roomInfo = request.getParameter("roomInfo");
	System.out.println("roomInfo: " + roomInfo);
	
    int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
    System.out.println("roomPrice: " + roomPrice);
    int roomMax = Integer.parseInt(request.getParameter("roomMax"));
    System.out.println("roomMax: " + roomMax);
    String roomState = request.getParameter("roomState");
    System.out.println("roomState: " + roomState);
    
    Part part = request.getPart("roomImg");
    String originalName = part.getSubmittedFileName();

    String fileName = "";
    if (originalName != null && !originalName.isEmpty()) {
        // 원본이름에서 확장자만 분리
        int dotIdx = originalName.lastIndexOf(".");
        String ext = "";
        
        if (dotIdx != -1) {
            ext = originalName.substring(dotIdx); // .png
        }
        
        UUID uuid = UUID.randomUUID();
        fileName = uuid.toString().replace("-", "") + ext;
    }

  /*   
    System.out.println("roomInfo: " + roomInfo);
    System.out.println("roomPrice: " + roomPrice);
    System.out.println("roomMax: " + roomMax);
    System.out.println("roomState: " + roomState);
    System.out.println("roomImg: " + part);
    System.out.println("roomNo: " + roomNo);
    System.out.println("fileName: " + fileName); */
    
    int row = RoomDAO.updateRoom(roomNo, roomGrade, roomInfo, roomPrice, roomMax, roomState, fileName);
    
    if (row == 1) {
        System.out.println("수정 성공");
        if (originalName != null && !originalName.isEmpty()) {
            InputStream is = part.getInputStream();
            String filePath = request.getServletContext().getRealPath("admin/upload");
            File f = new File(filePath, fileName); // 빈 파일
            OutputStream os = Files.newOutputStream(f.toPath()); // os + file
            is.transferTo(os);
            os.close();
            is.close();
        }
        response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
    } else {
        System.out.println("수정 실패");
        response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
    }
%>