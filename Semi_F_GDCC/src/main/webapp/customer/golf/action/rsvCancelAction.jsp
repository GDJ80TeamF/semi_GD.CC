<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));	
		System.out.println(rsvNo + "넘어오는rsvNO");
		
	//예약 취소 쿼리 가져오기

	int cancel = RsvGolfDAO.deleteRsv(rsvNo);
		
	
	if(cancel == 1){
		//취소된거임
		response.sendRedirect("/Semi_F_GDCC/customer/golf/rsvGolfList.jsp");
		
	}else{
		response.sendRedirect("/Semi_F_GDCC/customer/golf/rsvCancelForm.jsp");
	}
%>