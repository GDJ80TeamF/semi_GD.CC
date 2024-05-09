<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	System.out.println(reviewNo + "<-- reviewNo hotelReviewOne.jsp param ");

	// reviewNo에 따라 review 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = ReviewDAO.selectHotelReviewOne(reviewNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
	<h1>hotelReview 상세보기</h1>
		<table border="1">
			<tr>
				<th>reviewNo</th>
				<th>rsvNo</th>
				<th>reviewTitle</th>
				<th>reviewContent</th>
				<th>reviewScore</th>
				<th>createDate</th>
				<th>updateDate</th>	
			</tr>
			<tr>
				<td><%=(Integer)(m.get("reviewNo"))%></td>
				<td><%=(Integer)(m.get("rsvNo"))%></td>	
				<td><%=(String)(m.get("reviewTitle"))%></td>	
				<td><%=(String)(m.get("reviewContent"))%></td>	
				<td><%=(String)(m.get("reviewScore"))%></td>	
				<td><%=(String)(m.get("createDate"))%></td>
				<td><%=(String)(m.get("updateDate"))%></td>
			</tr>

			<a href="/Semi_F_GDCC/customer/updateHotelReviewForm.jsp?reviewNo=<%=reviewNo%>">리뷰 수정</a>
			<br>
			<a href="/Semi_F_GDCC/customer/action/deleteHotelReviewAction.jsp?reviewNo=<%=reviewNo%>">리뷰 삭제</a>
		</table>
</div>

</body>
</html>