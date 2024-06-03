<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%

	//수정할 값 받아오기 + 디버깅
	String rsvDate = request.getParameter("rsvDate");
	String rsvTime = request.getParameter("rsvTime");
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
	int rsvComNo = Integer.parseInt(request.getParameter("rsvComNo"));
	
	
	System.out.println(rsvDate + " <- rsvDate /updateRsvAction.jsp");
	System.out.println(rsvTime + " <- rsvTime /updateRsvAction.jsp");
	System.out.println(rsvMember + " <- rsvMember /updateRsvAction.jsp");
	System.out.println(rsvComNo + " <- rsvComNo /updateRsvAction.jsp");

	int row = RsvComplexDAO.updateRsv(rsvDate, rsvTime, rsvMember, rsvComNo);
	if(row != 0){ 
		System.out.println("예약 정보 수정 완료");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/rsvComplexOne.jsp?rsvComNo="+rsvComNo);
	}else{
		System.out.println("예약 정보 수정 실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/rsvComplexOne.jsp?rsvComNo="+rsvComNo);
	}

%>