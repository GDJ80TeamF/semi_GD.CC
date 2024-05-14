<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%

	int comNo = Integer.parseInt(request.getParameter("comNo"));
		System.out.println(comNo + "<==rsvComStateAction.comNo");
		
	String rsvState = request.getParameter("rsvState");
		System.out.println(rsvState + "<===rsvComStateAction.comNo");
		
	
	//update문 연결
	
	int update = RsvComplexDAO.updateRsvState(rsvState, comNo);
	
	
	if(update == 1){
		//변경성공
		System.out.println("변경성공");
		response.sendRedirect("/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex&msg=T");
		
	}else{
		System.out.println("변경실패");
		response.sendRedirect("/Semi_F_GDCC/admin/rsvHotelList.jsp?table=rsv_complex&msg=F");
	}
%>