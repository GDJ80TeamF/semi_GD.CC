<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String checkinDate = request.getParameter("checkinDate");
	String checkoutDate = request.getParameter("checkoutDate");
	
	System.out.println("checkinDate: " + checkinDate);
	System.out.println("checkoutDate: " + checkoutDate);

	response.sendRedirect("/Semi_F_GDCC/customer/GDCC/insertNewRsvForm.jsp?checkinDate="+checkinDate+"&checkoutDate="+checkoutDate);
%>