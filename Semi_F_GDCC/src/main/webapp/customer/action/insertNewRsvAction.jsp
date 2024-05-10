<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%@ page import="java.util.*" %>
<%
	//받아올 값들
	String rsvMail = request.getParameter("rsvMail");
		System.out.println(rsvMail + "<==insertNewRsvAction.rsvmail");
	String rsvDate = request.getParameter("rsvDate");
		System.out.println(rsvDate + "<==insertNewRsvAction.rsvDate");
	String rsvCourse = request.getParameter("rsvCourse");
		System.out.println(rsvCourse + "<==insertNewRsvAction.rsvCourse");
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
		System.out.println(rsvMember + "<==insertNewRsvAction.rsvMember");
	String rsvTtime = request.getParameter("rsvTtime");
		System.out.println(rsvTtime + "<==insertNewRsvAction.rsvTtime");
	String rsvRequest = request.getParameter("rsvRequest");
		System.out.println(rsvRequest + "<==rsvRequest");
		
		
	//inisert문 이용해서 테이블에 값 넣어주기
	
	int rsv = RsvGolfDAO.insertNewRsv(
			rsvCourse, rsvMail, rsvDate, rsvMember, rsvRequest, rsvTtime);
	
	if(rsv == 1){//추가성공 
		System.out.println("예약추가성공");
		response.sendRedirect("/Semi_F_GDCC/customer/golf/rsvGolfList.jsp");
	}else{
		System.out.println("예약추가실패");
		response.sendRedirect("/Semi_F_GDCC/customer/golf/insertNewRsvForm.jsp");
	}
%>