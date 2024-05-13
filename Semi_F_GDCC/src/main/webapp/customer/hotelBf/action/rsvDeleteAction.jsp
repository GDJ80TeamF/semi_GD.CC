<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	
	int rsvBfno = Integer.parseInt(request.getParameter("rsvBfno"));
	System.out.println(rsvBfno + "<--rsvBfno deleteQnAAction.jsp param");
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo deleteQnAAction.jsp param");
	
	// rsvBfno ?인 조식예약 삭제하는 메서드
	int row = RsvBfDAO.deleteRsv(rsvBfno);
	
	if(row == 1){
		System.out.println("삭제성공");
		response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp"); //성공시
	} else {
		System.out.println("삭제실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelBf/rsvOne.jsp?rsvNo="+rsvNo); //실패시 다시 상세페이지로			
	}

%>