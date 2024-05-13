<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*"%>
<%

	//입력할 값 받아오기
	int rsvNo= Integer.parseInt(request.getParameter("rsvNo"));
	String rsvDate = request.getParameter("rsvDate");
	int rsvPlace = Integer.parseInt(request.getParameter("rsvPlace"));
	String rsvTime = request.getParameter("rsvTime");
	int rsvMember = Integer.parseInt(request.getParameter("rsvMember"));

	//디버깅
	System.out.println(rsvNo);
	System.out.println(rsvDate);
	System.out.println(rsvPlace);
	System.out.println(rsvTime);
	System.out.println(rsvMember);
	
	int row = RsvComplexDAO.insertRsv(rsvNo, rsvDate, rsvPlace, rsvTime, rsvMember);
	
	if(row != 0){
		System.out.println("호텔 부가시설 예약 성공");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/rsvComplexList.jsp");
	}else{
		System.out.println("호텔 부가시설 예약 실패 ");
		response.sendRedirect("/Semi_F_GDCC/customer/hotelComplex/rsvComplexList.jsp");
	}






%>


