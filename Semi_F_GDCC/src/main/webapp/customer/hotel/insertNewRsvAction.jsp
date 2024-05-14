<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%


	int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	String checkinDate = request.getParameter("checkinDate");
	String checkoutDate = request.getParameter("checkoutDate");
	String rsvMail = request.getParameter("rsvMail");
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
	String rsvRequest = request.getParameter("rsvRequest");
	
	//디버깅
	System.out.println("=====insertNewRsvAction.jsp parameter 디버깅 =====");
	System.out.println(roomNo);
	System.out.println(checkinDate);
	System.out.println(checkoutDate);
	System.out.println(rsvMail);
	System.out.println(rsvMember);
	System.out.println(rsvRequest);
	System.out.println("=====insertNewRsvAction.jsp parameter 디버깅 종료 =====");
	
	int row = RsvHotelDAO.insertRsv(roomNo, checkinDate, checkoutDate, rsvMail, rsvMember, rsvRequest);
	if(row != 0){
		System.out.println("호텔 예약 성공!");
		response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp?cusMail="+rsvMail);
	}else{
		System.out.println("호텔 예약 실패!");
		response.sendRedirect("/Semi_F_GDCC/customer/myPage.jsp?cusMail="+rsvMail);
	}





%>
