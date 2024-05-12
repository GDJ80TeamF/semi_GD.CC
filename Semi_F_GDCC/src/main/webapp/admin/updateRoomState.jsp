<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	String roomState = request.getParameter("roomState");
	System.out.println("roomNo: " + roomNo);
	System.out.println("roomState: " + roomState);
	
	int row = RoomDAO.updateRoomState(roomNo, roomState);
	if(row == 1){
		System.out.println("주문 상태 업데이트 성공");
		response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
	}else{
		System.out.println("주문 상태 업데이트 실패");
		response.sendRedirect("/Semi_F_GDCC/admin/roomList.jsp");
	}
%>