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
	// 세션에서 고객 mail가져오기
	HashMap<String,Object> login = (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
%>
<%
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	System.out.println(reviewNo + "<-- reviewNo updateGolfReviewForm.jsp param");
	
	// reviewNo에 따라GolfReview 출력하는 메서드
	HashMap<String, Object> m = ReviewDAO.selectGolfReviewOne(reviewNo);
	System.out.println(m + "<-- m updateGolfReviewForm.jsp param");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<h1>골프리뷰 수정</h1>
<form method="post" action="/Semi_F_GDCC/customer/action/updateGolfReviewAction.jsp">
	<table>
		<tr>
			<th>reviewNo :</th>
			<td><input type="text" value="<%=reviewNo%>" name="reviewNo"></td>
		</tr>
		<tr>
			<th>별점 :</th>
			<td><input type="text" value="<%=(String)(m.get("reviewScore"))%>" name="reviewScore"></td>
		</tr>
		<tr>
			<th>제목 :</th>
			<td><input type="text" value="<%=(String)(m.get("reviewTitle"))%>" name="reviewTitle"></td>
		</tr>
		<tr>
			<th>내용 :</th>
			<td><textarea  style="width: 550px; height: 300px;"
						 name="reviewContent"><%=(String)(m.get("reviewContent"))%></textarea></td>
		</tr>

		<tr>
			<td><button type="submit">수정</button></td>
		</tr>
	</table>
		
</form>		
</div>
</body>
</html>