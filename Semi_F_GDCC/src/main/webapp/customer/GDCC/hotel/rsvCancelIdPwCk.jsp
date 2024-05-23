<%@page import="gdcc.dao.RsvHotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	String checkId = request.getParameter("checkId");
	String checkPw = request.getParameter("checkPw");
	
	// 디버깅
	System.out.println("rsvNo: " + rsvNo);
	System.out.println("checkId: " + checkId);
	System.out.println("checkPw: " + checkPw);
	
	boolean ck = RsvHotelDAO.cancelIdPw(checkId, checkPw);
	
	if(ck == true){
		System.out.println("비교 완료");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/rsvCancelForm.jsp?rsvNo=" + rsvNo + "&ck=T");
	}else{
		System.out.println("비교 실패");
		response.sendRedirect("/Semi_F_GDCC/customer/hotel/rsvCancelForm.jsp?rsvNo=" + rsvNo + "&ck=F");
	}
	
%>
