<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	int rsvPlace = Integer.parseInt(request.getParameter("rsvPlace"));
	String rsvDate = request.getParameter("rsvDate");
	
	response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/insertRsvForm.jsp?rsvNo="+rsvNo+
			"&rsvPlace="+rsvPlace+"&rsvDate="+rsvDate);


%>