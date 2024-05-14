<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<--rsvNo updateGolfReviewAction.jsp param");
	
	int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
	System.out.println(reviewScore + "<--reviewScore updateGolfReviewAction.jsp param");

	String reviewTitle = request.getParameter("reviewTitle");
	System.out.println(reviewTitle + "<--reviewTitle updateGolfReviewAction.jsp param");
	
	String reviewContent = request.getParameter("reviewContent");
	System.out.println(reviewContent + "<--reviewContent updateGolfReviewAction.jsp param");
	
	
	// reviewNo가 ?인 GolfReview 수정하는 메서드
	int row = ReviewDAO.updateGolfReview(reviewTitle, reviewContent, reviewScore, rsvNo);
	
	if(row == 1){
		System.out.println("수정성공");
		response.sendRedirect("/Semi_F_GDCC/customer/reviewListPerCustomer.jsp"); //성공시
	} else {
		System.out.println("수정실패");
		response.sendRedirect("/Semi_F_GDCC/customer/updateGolfReviewForm.jsp?rsvNo="+rsvNo); //실패시 다시 수정페이지로			
	}

%>