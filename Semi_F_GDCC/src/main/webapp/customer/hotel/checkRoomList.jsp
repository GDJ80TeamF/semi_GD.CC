<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String checkinDate = request.getParameter("checkinDate");
	String checkoutDate = request.getParameter("checkoutDate");
	
	System.out.println("checkinDate: " + checkinDate);
	System.out.println("checkoutDate: " + checkoutDate);
	
	// 변경된 날짜
	String checkInChangeDate = request.getParameter("checkInChangeDate");
	String checkOutChangeDate = request.getParameter("checkOutChangeDate");
	
	System.out.println("checkInChangeDate: " + checkInChangeDate);
	System.out.println("checkOutChangeDate: " + checkOutChangeDate);
	
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	
	System.out.println("checkin: " + checkin);
	System.out.println("checkout: " + checkout);
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	
	if((checkin != checkInChangeDate && checkout != checkOutChangeDate)|| (checkin != checkInChangeDate && checkout == checkOutChangeDate) ||
			(checkin == checkInChangeDate && checkout != checkOutChangeDate) || (checkin == checkInChangeDate && checkout == checkOutChangeDate)){
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/updateRsvForm.jsp?checkInChangeDate="+checkInChangeDate+"&checkOutChangeDate="+checkOutChangeDate+"&rsvNo="+rsvNo);
	}else{
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/insertNewRsvForm.jsp?checkinDate="+checkinDate+"&checkoutDate="+checkoutDate);
	}

	

%>