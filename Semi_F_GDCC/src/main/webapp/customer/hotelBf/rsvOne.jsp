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
	ArrayList<HashMap<String, Object>> list = RsvBfDAO.selectRsvOne(rsvNo);
	
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
			<%
				for(HashMap m : list) {
			%>
			<tr>
				<td><%=(Integer)(m.get("rsvNo"))%></td>	
				<td><%=(String)(m.get("rsvDate"))%></td>	
				<td><%=(String)(m.get("rsvTime"))%></td>
				<td><%=(Integer)(m.get("rsvMember"))%></td>	
				<td><%=(String)(m.get("rsvState"))%></td>	
				<td><%=(String)(m.get("menuMain"))%></td>
				<td><%=(String)(m.get("menuInfo"))%></td>
				<td><%=(String)(m.get("menuImg"))%></td>
			</tr>

			<a href="/Semi_F_GDCC/customer/hotelBf/rsvUpdateForm.jsp?rsvNo=<%=rsvNo%>&
						rsvBfno=<%=(Integer)(m.get("rsvBfno"))%>">예약 수정</a>
			<br>
			<a href="/Semi_F_GDCC/customer/hotelBf/rsvDeleteForm.jsp?rsvNo=<%=rsvNo%>">예약 삭제</a>
			<%
				}
			%>
	</table>
	
</div>


</body>
</html>