<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	String rsvDate = request.getParameter("rsvDate");
	System.out.println(rsvDate + "<--rsvDate rsvUpdateAction.jsp param");
	
	String rsvTime = request.getParameter("rsvTime");
	System.out.println(rsvTime + "<--rsvTime rsvUpdateAction.jsp param");
	
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
	System.out.println(rsvMember + "<--rsvMember rsvUpdateAction.jsp param");
	
	int rsvBfNo = Integer.parseInt(request.getParameter("rsvBfNo"));
	System.out.println(rsvBfNo + "<--rsvBfNo rsvUpdateAction.jsp param");
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo rsvUpdateAction.jsp param");
	
	// 조식예약 수정하는 메서드
	int row = RsvBfDAO.updateRsv(rsvDate, rsvTime, rsvMember, rsvBfNo);
	
	if(row == 1){
		System.out.println("수정성공");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/rsvOne.jsp?rsvNo="+rsvNo); //성공시
	} else {
		System.out.println("수정실패");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/rsvUpdateForm.jsp"); //실패시 다시 수정 페이지로			
	}


%>