<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo deleteHotelReviewAction.jsp param");
	
	// rsvNo ?인 HotelReview 삭제하는 메서드
	int row =ReviewDAO.deleteHotelReview(rsvNo);
	
	if(row == 1){
		System.out.println("삭제성공");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/reviewListPerCustomer.jsp"); //성공시
	} else {
		System.out.println("삭제실패");
		response.sendRedirect("/Semi_F_GDCC/customer/GDCC/reviewListPerCustomer.jsp"); //실패시			
	}

%>