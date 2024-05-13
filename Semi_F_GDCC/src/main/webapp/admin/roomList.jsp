<%@page import="gdcc.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%-- <%
	// 인증 분기 세션 변수 이름 : loginAdmin
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
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
<title>룸 리스트</title>
</head>
<body>
	<h1>룸 리스트</h1>
	<a href="/Semi_F_GDCC/admin/insertRoomForm.jsp">글쓰기</a>
	<table border="1">
		<tr bgcolor="pink">
			<td>룸 no</td>
			<td>룸 등급</td>
			<td>룸 가격</td>
			<td>룸 최대 인원수</td>
			<td>룸 상태</td>
			<td>룸 이미지</td>
			<td>생성 날짜</td>
			<td>수정 날짜</td>
		</tr>
			<%
				for(HashMap<String, Object> m : List){
			%>
				<tr>
					<td><a href="/Semi_F_GDCC/admin/roomOne.jsp?roomNo=<%=(Integer)(m.get("roomNo"))%>"><%=(Integer)(m.get("roomNo"))%></a></td>
					<td><%=(Integer)(m.get("roomGrade"))%></td>
					<td><%=(Integer)(m.get("roomPrice"))%></td>
					<td><%=(Integer)(m.get("roomMax"))%></td>
					<td>
						현재상태: <%=(String)(m.get("roomState"))%><br>
						<form method="post" action="/Semi_F_GDCC/admin/action/updateRoomState.jsp?roomNo=<%=(Integer)(m.get("roomNo"))%>">
							변경할 상태 선택하기: 
							<select name="roomState">
								<option value="공사중">공사중</option>
								<option value="투숙가능">투숙가능</option>
							</select>
								<button type="submit">변경하기</button>
						</form>
						
					</td>
					<td>
					<img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>">
					</td>
					<td><%=(String)(m.get("create_date"))%></td>
					<td><%=(String)(m.get("update_date"))%></td>
				</tr>
			<%
				}
			%>
	</table>
</body>
</html>