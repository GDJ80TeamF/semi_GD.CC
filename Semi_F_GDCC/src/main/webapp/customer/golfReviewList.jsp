<%@ page import="gdcc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	HashMap<String,Object> loginMember 
	= (HashMap<String,Object>)(session.getAttribute("loginCustomer"));
	
	String cusMail = request.getParameter("cusMail");
	System.out.println(cusMail+ "<<==cusMail");
	
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	int rowPerPage = 10;
	int startRow = (currentPage-1) * rowPerPage;
	
	//int totalRow = 0;
	//int lastPage = 0;
	
	//골프리뷰 출력하는 메서드
	ArrayList<HashMap<String, Object>> golfReviewList = ReviewDAO.selectGolfReviewList(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
<h1>GolfRiview리스트</h1>
	<table border="1">
		<tr>
			<th>reviewNo</th>
			<th>reviewTitle</th>
		</tr>
		<%
			for(HashMap m : golfReviewList) {
		%>
			<tr>
				<td>
					<a href="/Semi_F_GDCC/customer/golfReviewOne.jsp?reviewNo=<%=(Integer)(m.get("reviewNo"))%>">
						<%=(Integer)(m.get("reviewNo"))%></a>
				</td>
				<td>
					<a href="/Semi_F_GDCC/customer/golfReviewOne.jsp?reviewNo=<%=(Integer)(m.get("reviewNo"))%>">
						<%=(String)(m.get("reviewTitle"))%></a>
				</td>
			</tr>
		<%
			}
		%>
		<!-- 위치조정필 ex 마이페이지  --><a href="/Semi_F_GDCC/customer/insertGolfReviewForm.jsp">리뷰 쓰기</a>
	</table>
</div>
</body>
</html>