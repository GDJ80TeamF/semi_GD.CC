<%@page import="gdcc.dao.RoomDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	// 인증 분기 세션 변수 이름 : loginCustomer
	if(session.getAttribute("loginCustomer") != null){
		response.sendRedirect("/Semi_F_GDCC/customer/main.jsp");
		return;
	}
%> --%>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	// 공지 5개씩
	int rowPerPage = 5;
	int startRow = (currentPage-1) * rowPerPage;
%>
<%
	ArrayList<HashMap<String, Object>> List = RoomDAO.selectRoom(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>고객 룸 리스트</h1>
	<table border="1">
		<tr bgcolor="pink">
			<td>룸 no</td>
			<td>룸 등급</td>
			<td>룸 가격</td>
			<td>룸 최대 인원수</td>
			<td>룸 이미지</td>
		</tr>
			<%
				for(HashMap<String, Object> m : List){
					
			%>
				<tr>
					<td><a href="/Semi_F_GDCC/customer/curoomOne.jsp?roomNo=<%=(Integer)(m.get("roomNo"))%>"><%=(Integer)(m.get("roomNo"))%></a></td>
					<td><%=(String)(m.get("roomGrade"))%></td>
					<td><%=(Integer)(m.get("roomPrice"))%></td>
					<td><%=(Integer)(m.get("roomMax"))%></td>
					<td>
					<img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>">
					</td>
				</tr>
				
			<%
				}
			%>
	</table>
</body>
</html>