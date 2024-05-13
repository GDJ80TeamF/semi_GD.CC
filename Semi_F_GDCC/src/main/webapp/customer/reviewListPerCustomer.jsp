<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%

	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<%
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	String cusMail = (String)(login.get("cusMail"));
	System.out.println(cusMail+ "<--cusMail reviewListPerCustomer.jsp param");
	
	//고객 본인이 작성한 hotelReview 조회하는 메서드
	ArrayList<HashMap<String, Object>> hotelReviewList = ReviewDAO.selectHotelReviewPerCus(cusMail);
	//고객 본인이 작성한 golfReview 조회하는 메서드
	ArrayList<HashMap<String, Object>> golfReviewList = ReviewDAO.selectGolfReviewPerCus(cusMail);
	
	// cusMail에 따라 hotelRsvState 출력하는 메서드
	String hs = ReviewDAO.golfRsvState(cusMail);
	System.out.println(hs + "<-- hs reviewListPerCustomer.jsp param");
	// cusMail에 따라 golfRsvState 출력하는 메서드
	String gs = ReviewDAO.golfRsvState(cusMail);
	System.out.println(gs + "<-- gs reviewListPerCustomer.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
<h1>나의 호텔리뷰 목록</h1>
	<table border="1">
		<%
			if(hs.equals("예약만료")) {
		%>
			<a href="/Semi_F_GDCC/customer/insertHotelReviewForm.jsp">리뷰 쓰기</a>
		<%
			}
		%>
		<tr>
			<th>reviewNo</th>
			<th>reviewTitle</th>
			<th>reviewContent</th>
			<th>reviewScore</th>
			<th>createDate</th>
			<th>updateDate</th>
		</tr>
		<%
			for(HashMap m : hotelReviewList) {
		%>
			<tr>
				<td><%=(String)(m.get("reviewNo"))%></td>
				<td><%=(String)(m.get("reviewTitle"))%></td>
				<td><%=(String)(m.get("reviewContent"))%></td>
				<td><%=(String)(m.get("reviewScore"))%></td>
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>
		<%
			}
		%>
	</table>
<h1>나의 골프리뷰 목록</h1>
	<table border="1">
		<%
			if(gs.equals("예약만료")) {
		%>
			<a href="/Semi_F_GDCC/customer/insertGolfReviewForm.jsp">리뷰 쓰기</a>
		<%
			}
		%>
		
		<tr>
			<th>reviewNo</th>
			<th>reviewTitle</th>
			<th>reviewContent</th>
			<th>reviewScore</th>
			<th>createDate</th>
			<th>updateDate</th>
		</tr>
		<%
			for(HashMap m : golfReviewList) {
		%>
			<tr>
				<td><%=(Integer)(m.get("reviewNo"))%></td>
				<td><%=(String)(m.get("reviewTitle"))%></td>
				<td><%=(String)(m.get("reviewContent"))%></td>
				<td><%=(Integer)(m.get("reviewScore"))%></td>
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>
		<%
			}
		%>
	</table>
</div>
</body>
</html>