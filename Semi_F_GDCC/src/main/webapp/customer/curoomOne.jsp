<%@page import="gdcc.dao.RoomDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int roomNo = Integer.parseInt(request.getParameter("roomNo"));
	System.out.println("roomNo: " + roomNo);
	
	HashMap<String, Object> m = RoomDAO.selectRoom(roomNo);		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 룸 상세 정보</title>
</head>
<body>
	<h1>고객 룸 상세 정보</h1>
	<table border="1">
		<tr>
			<td>룸 no</td>
			<td>룸 등급</td>
			<td>룸 가격</td>
			<td>룸 정보</td>
			<td>룸 최대 인원수</td>
			<td>룸 상태</td>
			<td>룸 이미지</td>
		</tr>
		<tr>
			<td><%=(Integer)(m.get("roomNo"))%></td>
			<td><%=(String)(m.get("roomGrade"))%></td>
			<td><%=(Integer)(m.get("roomPrice"))%></td>
			<td><%=(String)(m.get("roomInfo"))%></td>
			<td><%=(Integer)(m.get("roomMax"))%></td>
			<td><%=(String)(m.get("roomState"))%></td>
			<td><img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>"></td>
		</tr>
	</table>
		<%
			if((m.get("roomState")).equals("투숙가능")){
		%>
			<a href="/semi_F_GDCC/customer/insertNewRsvForm.jsp">예약하기</a>
		<%
			}
		%>
</body>
</html>