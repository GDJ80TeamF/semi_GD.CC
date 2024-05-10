<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%
	
	//form값 가져오기
	String rsvMail = request.getParameter("rsvMail");
		System.out.println(rsvMail + "<==updateRsvACtion.rsvMail");
	
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
		System.out.println(rsvNo + "<==updateRsvAction.rsvNo");
		
	String rsvDate = request.getParameter("rsvDate");
		System.out.println(rsvDate + "<==updateRsvAction.rsvDate");
		
	String rsvCourse = request.getParameter("rsvCourse");
		System.out.println(rsvCourse +"<==updateRsvAction.rsvCourse");
	
	String rsvTtime = request.getParameter("rsvTtime");
		System.out.println(rsvTtime + "<==updateRsvAction.rsvTtime");
		
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));
		System.out.println(rsvMember + "<==updateRsvAction.rsvMember");
		
	String rsvRequest = request.getParameter("rsvRequest");
		System.out.println(rsvRequest + "<==updateRsvAction.rsvRequest");
		
	//디버깅 확인완료!=>DAO페이지랑 연결
	
	int update = RsvGolfDAO.updateRsv(rsvCourse, rsvDate, rsvMember, rsvTtime, rsvNo);
		
		if(update == 1){
			//update성공
			System.out.println("업데이트성공");
			response.sendRedirect("/Semi_F_GDCC/customer/golf/rsvGolfOne.jsp?rsvNo="+rsvNo);
		}else{
			System.out.println("업데이트 실패!");
			response.sendRedirect("/Semi_F_GDCC/customer/golf/updateRsvForm.jsp?rsvNo="+rsvNo);
		}
	
%>