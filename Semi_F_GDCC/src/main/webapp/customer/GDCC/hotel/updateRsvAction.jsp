<%@page import="gdcc.dao.RsvHotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	// 넘겨받은 파라미터값
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	String rsvName = request.getParameter("rsvName");
	String rsvMail = request.getParameter("rsvMail");
	String cusCheckIn = request.getParameter("cusCheckIn");
	String cusCheckOut = request.getParameter("cusCheckOut");
	int cusMember = Integer.parseInt(request.getParameter("cusMember"));
	String cusRequest = request.getParameter("cusRequest");
	
	// 디버깅
	System.out.println("rsvNo: " + rsvNo);
	System.out.println("rsvName: " + rsvName);
	System.out.println("rsvMail: " + rsvMail);
	System.out.println("cusCheckIn: " + cusCheckIn);
	System.out.println("cusCheckOut: " + cusCheckOut);
	System.out.println("cusMember: " + cusMember);
	System.out.println("cusRequest: " + cusRequest);
	
	int row = RsvHotelDAO.updateCusRsv(rsvNo, rsvMail, cusCheckIn, cusCheckOut, cusMember, cusRequest);
	
	if(row == 1){
		System.out.println("수정 성공");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=" + rsvNo);
	}else{
		System.out.println("수정 실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/cusRsvHotelOne.jsp?rsvNo=" + rsvNo);
}	
%>
