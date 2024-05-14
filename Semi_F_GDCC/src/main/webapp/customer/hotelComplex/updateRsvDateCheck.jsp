<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));
	String rsvDate = request.getParameter("rsvDate");
	
	response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/updateRsvForm.jsp?rsvComNo="+rsvComNo+"&rsvDate="+rsvDate);


%>
