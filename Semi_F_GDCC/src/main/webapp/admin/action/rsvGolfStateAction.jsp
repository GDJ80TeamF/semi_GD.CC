<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%
	//변경상태,예약번호 가져오기
	
	String rsvState = request.getParameter("rsvState");
		System.out.println(rsvState + "<==rsvGolfStateAction.rsvState");
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==rsvGolfStateAction.rsvNo");
	//연결하기
	
	int updateRsvState = RsvGolfDAO.updateRsvGolfState(rsvState, rsvNo);
	
		System.out.println(updateRsvState + "<==updateRsvState");
		
	if(updateRsvState == 1){
		//변경성공
		System.out.println("변경성공");
		response.sendRedirect("/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?msg=T");
	}else{
		//변경실패
		System.out.println("변경실패");
		response.sendRedirect("/Semi_F_GDCC/admin/golf/rsvGolfList.jsp?msg=F");
	}	
	
%>