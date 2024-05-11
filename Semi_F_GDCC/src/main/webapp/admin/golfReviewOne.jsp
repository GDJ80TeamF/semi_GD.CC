<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 메인페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	System.out.println(reviewNo + "<-- reviewNo hotelReviewOne.jsp param ");

	// reviewNo에 따라 review 출력하는 메서드 / 상세보기
	HashMap<String, Object> m = ReviewDAO.selectGolfReviewOne(reviewNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
<h1>golfReview 상세보기</h1>
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
			
		<br>
		<a href="/Semi_F_GDCC/admin/action/deleteGolfReviewForm.jsp?reviewNo=<%=reviewNo%>">리뷰 삭제</a>
	</table>
</div>

</body>
</html>