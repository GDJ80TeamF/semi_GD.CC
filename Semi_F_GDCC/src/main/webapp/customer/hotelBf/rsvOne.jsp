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
	int rsvNo = Integer.parseInt(request.getParameter("rsvNo"));
	System.out.println(rsvNo + "<-- rsvNo rsvOne.jsp param ");

	// rsvNo에 따라 조식예약정보 출력하는 메서드 / 상세보기
	HashMap<String, Object> map = BfDAO.selectRsvOne(rsvNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
	<h1>조식예약 상세보기</h1>
		<table border="1">
			<tr>
				<th>rsvNo</th>
				<th>rsvDate</th>
				<th>rsvTime</th>
				<th>rsvMember</th>
				<th>rsvState</th>
				<th>menuMain</th>
				<th>menuInfo</th>
				<th>menuImg</th>
			</tr>
			<tr>
				<td><%=(Integer)(map.get("rsvNo"))%></td>	
				<td><%=(String)(map.get("rsvDate"))%></td>	
				<td><%=(String)(map.get("rsvTime"))%></td>
				<td><%=(Integer)(map.get("rsvMember"))%></td>	
				<td><%=(String)(map.get("rsvState"))%></td>	
				<td><%=(String)(map.get("menuMain"))%></td>
				<td><%=(String)(map.get("menuInfo"))%></td>
				<td><%=(String)(map.get("menuImg"))%></td>
			</tr>

			<a href="/Semi_F_GDCC/customer/hotelBf/rsvUpdateForm.jsp?rsvNo=<%=rsvNo%>">예약 수정</a>
			<br>
			<a href="/Semi_F_GDCC/customer/hotelBf/rsvDeleteForm.jsp?rsvNo=<%=rsvNo%>">예약 삭제</a>
	</table>
	
</div>


</body>
</html>