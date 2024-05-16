<%@page import="gdcc.dao.RsvHotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo")); 
	
	// 디버깅
	System.out.println("rsvNo: " + rsvNo);
	
	int row = RsvHotelDAO.CancelcusRsv(rsvNo);
	if(row == 1){
		System.out.println("예약 취소 성공");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=" + rsvNo);
	}else{
		System.out.println("예약 취소 실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=" + rsvNo);
	}
	
%>
