<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo insertRsvAction.jsp param");
	
	String rsvDate = request.getParameter("rsvDate");
	System.out.println(rsvDate + "<--rsvDate insertRsvAction.jsp param");
	
	String rsvTime = request.getParameter("rsvTime");
	System.out.println(rsvTime + "<--rsvTime insertRsvAction.jsp param");
	
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
	System.out.println(rsvMember + "<--rsvMember insertRsvAction.jsp param");
	
	int rsvMenu = Integer.parseInt(request.getParameter("rsvMenu"));
	System.out.println(rsvMenu + "<--rsvMenu insertRsvAction.jsp param");
	// 조식예약 작성하는 메서드
	int row = BfDAO.insertRsv(rsvNo, rsvDate, rsvTime, rsvMember, rsvMenu);
	
	if(row == 1){
		System.out.println("입력성공");
		response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp"); //성공시
	} else {
		System.out.println("입력실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelBf/insertRsvForm.jsp"); //실패시 다시 입력 페이지로			
	}

%>