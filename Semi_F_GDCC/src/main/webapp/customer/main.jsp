<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") == null){
		response.sendRedirect("/Semi_F_GDCC/customer/customerLoginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 성공</h1>
<a href="/Semi_F_GDCC/customer/action/customerLogoutAction.jsp">로그아웃</a>
<a href="/Semi_F_GDCC/customer/myPage.jsp">마이페이지</a>
<a href="/Semi_F_GDCC/customer/golf/rsvGolfList.jsp">골프예약 상세페이지</a>
<br>
<a href="/Semi_F_GDCC/customer/QnAList.jsp">QnA</a>
<a href="/Semi_F_GDCC/customer/hotelReviewList.jsp">hotelReview</a>
<a href="/Semi_F_GDCC/customer/golfReviewList.jsp">golfReview</a>
</body>
</html>