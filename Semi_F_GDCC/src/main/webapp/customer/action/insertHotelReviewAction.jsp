<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo insertHotelReviewAction.jsp param");
	
	String reviewTitle = request.getParameter("title");
	System.out.println(reviewTitle + "<--reviewTitle insertHotelReviewAction.jsp param");
	
	String reviewContent = request.getParameter("content");
	System.out.println(reviewContent + "<--reviewContent insertHotelReviewAction.jsp param");
	
	int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
	System.out.println(reviewScore + "<--reviewScore insertHotelReviewAction.jsp param");
	// QnA 작성하는 메서드
	int row = ReviewDAO.insertHotelReview( rsvNo, reviewTitle, reviewContent, reviewScore);
	
	if(row == 1){
		System.out.println("입력성공");
		response.sendRedirect("/Semi_F_GDCC/customer/reviewListPerCustomer.jsp"); //성공시
	} else {
		System.out.println("입력실패");
		response.sendRedirect("/Semi_F_GDCC/customer/insertHotelReviewForm.jsp"); //실패시 다시 입력 페이지로			
	}

%>