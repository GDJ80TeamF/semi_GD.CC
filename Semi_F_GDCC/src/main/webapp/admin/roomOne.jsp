<%@page import="gdcc.dao.RoomDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
<title>Insert title here</title>
</head>
<body>
<h1>룸 상세 정보</h1>
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
		<td><%=(Integer)(m.get("roomGrade"))%></td>
		<td><%=(Integer)(m.get("roomPrice"))%></td>
		<td><%=(String)(m.get("roomInfo"))%></td>
		<td><%=(Integer)(m.get("roomMax"))%></td>
		<td><%=(String)(m.get("roomState"))%></td>
		<td><img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>"></td>
	</tr>
	</table>
	<a href="/Semi_F_GDCC/admin/updateRoomForm.jsp?roomNo=<%=roomNo%>">수정하기</a>
</body>
</html>