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
	String hs = ReviewDAO.hotelRsvState(cusMail);
	System.out.println(hs + "<-- hs reviewListPerCustomer.jsp param");
	// cusMail에 따라 golfRsvState 출력하는 메서드
	String gs = ReviewDAO.golfRsvState(cusMail);
	System.out.println(gs + "<-- gs reviewListPerCustomer.jsp param");
	
	// 고객이 예약한 호텔rsvNo 출력하는 메서드 / 리뷰작성리스트
	ArrayList<HashMap<String, Object>> hotelRsvNoList = ReviewDAO.selectHotelRsvNo(cusMail);
	// 고객이 예약한 호텔rsvNo 출력하는 메서드 / 리뷰작성리스트
	ArrayList<HashMap<String, Object>> golfRsvNoList = ReviewDAO.selectGolfRsvNo(cusMail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/Semi_F_GDCC/css/qnaListPerCustomer.css">
<style>
   	.rate{
		width: 121px;height: 20px;position: relative;
		}
	
	.rate span{
		position: absolute;
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
		width: auto;height: 20px;
		}
	a {
		text-decoration: none;
	}
	a:hover {
       background-color: #ddd;
       border-radius: 5px;
       text-decoration: underline;
   }
</style>
</head>
<body>
<div class="container">
	<h1>나의 호텔리뷰 목록</h1>
	<table border="1">
		<tr>
			<th>rsvNo</th>
			<th>reviewScore</th>
			<th>reviewTitle</th>
			<th>reviewContent</th>			
			<th>stayDate</th>
			<th>createDate</th>
			<th>updateDate</th>
			<th>&nbsp;</th>
		</tr>
		<%
			for(HashMap m : hotelReviewList) {				
		%>
			<tr>
				<td><%=(Integer)(m.get("rsvNo"))%></td>
				<td>
		        	<div class="rate">
		            	<% 
		                	int reviewScore = (Integer)(m.get("reviewScore"));
		                	int widthPercentage = reviewScore * 10;
		            	%>
		    	        <span style="width: <%= widthPercentage %>%"></span>
			        </div>
		        </td>
				<td><%=(String)(m.get("reviewTitle"))%></td>
				<td><%=(String)(m.get("reviewContent"))%></td>
				
				<td><%=(String)(m.get("checkinDate"))%> ~ <%=(String)(m.get("checkoutDate"))%></td>
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
				<td>
					<a class="update" href="/Semi_F_GDCC/customer/updateHotelReviewForm.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">리뷰 수정</a>		
					<br>
					<a class="delete" href="/Semi_F_GDCC/customer/action/deleteHotelReviewAction.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">리뷰 삭제</a>
				</td>			
			</tr>
		<%
			}
		%>
	</table>
	<table border="1">
		<tr>
			<th>rsvNo</th>
			<th>stayDate</th>
		</tr>
		<%
			for(HashMap m : hotelRsvNoList) {
				//리뷰 작성유무 확인시키는 메서드
				boolean reviewCk = ReviewDAO.hotelReviewCk(cusMail, (Integer)(m.get("rsvNo")));
		%>
		<tr>
			<td><%=(Integer)(m.get("rsvNo"))%></td>
			<td><%=(String)(m.get("checkinDate"))%> ~ <%=(String)(m.get("checkoutDate"))%></td>
			<%
				if(hs.equals("예약만료")) {		// 예약만료시에만 리뷰쓸수있게
					if(reviewCk == false) {	// 리뷰값이 없으면 쓸수있게
			%>

			<td>
				<a href="/Semi_F_GDCC/customer/insertHotelReviewForm.jsp?rsvNo=
							<%=(Integer)(m.get("rsvNo"))%>">리뷰 쓰기</a>
			</td>
			<%
					}
				}
			%>
		</tr>
		<%
			}
		%>
	</table>

	<table border="1">
	<h1>나의 골프리뷰 목록</h1>
		<tr>
			<th>rsvNo</th>
			<th>reviewScore</th>
			<th>reviewTitle</th>
			<th>reviewContent</th>			
			<th>rsvDate</th>
			<th>createDate</th>
			<th>updateDate</th>
			<th>&nbsp;</th>
		</tr>
		<%
			for(HashMap m : golfReviewList) {
		%>
			<tr>
				<td><%=(Integer)(m.get("rsvNo"))%></td>
				<td>
		        	<div class="rate">
		            	<% 
		                	int reviewScore = (Integer)(m.get("reviewScore"));
		                	int widthPercentage = reviewScore * 10;
		            	%>
		    	        <span style="width: <%= widthPercentage %>%"></span>
			        </div>
		        </td>
				<td><%=(String)(m.get("reviewTitle"))%></td>
				<td><%=(String)(m.get("reviewContent"))%></td>								
				<td><%=(String)(m.get("rsvDate"))%></td>	
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
				<td>
					<a class="update" href="/Semi_F_GDCC/customer/updateGolfReviewForm.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">리뷰 수정</a>
					<br>
					<a class="delete" href="/Semi_F_GDCC/customer/action/deleteGolfReviewAction.jsp?rsvNo=<%=(Integer)(m.get("rsvNo"))%>">리뷰 삭제</a>
				</td>
			</tr>
		<%
			}
		%>
	</table>
	<table border="1">
		<tr>
			<th>rsvNo</th>
			<th>startCourse</th>
			<th>rsvDate</th>
		</tr>
		<%
			for(HashMap m : golfRsvNoList) {
				//골프리뷰 작성유무 확인시키는 메서드
				boolean reviewCk = ReviewDAO.golfReviewCk(cusMail, (Integer)(m.get("rsvNo")));
		%>
		<tr>
			<td><%=(Integer)(m.get("rsvNo"))%></td>
			<td><%=(String)(m.get("rsvCourse"))%></td>
			<td><%=(String)(m.get("rsvDate"))%></td>
			<%
				if(gs.equals("예약만료")) {		// 예약만료시에만 리뷰쓸수있게 /이전건 리뷰작성안하고 새로운 예약시 이전리뷰는 작성못함
					if(reviewCk == false) {	// 리뷰값이 없으면 쓸수있게
			%>
				<td>
					<a href="/Semi_F_GDCC/customer/insertGolfReviewForm.jsp?rsvNo=
							<%=(Integer)(m.get("rsvNo"))%>">리뷰 쓰기</a>
				</td>
			<%
					}
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
</div>
</body>
</html>