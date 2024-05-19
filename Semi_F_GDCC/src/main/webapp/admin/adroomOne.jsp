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
<style>
h1{
	text-align:center;
}
/* 테이블 스타일 */
table {
  border-collapse: collapse;
  width: 100%;
}

/* 테이블 행 스타일 */
tr {
  border-bottom: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
td {
  padding: 8px;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* 링크 스타일 */
a {
  text-decoration: none;
  color: #007bff;
}

a:hover {
  text-decoration: underline;
  color: #0056b3;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
<h1>룸 상세 정보</h1>
	<table>
	<tr>
		<td>룸 no</td>
		<td><%=(Integer)(m.get("roomNo"))%></td>
	</tr>
	<tr>
		<td>룸 등급</td>
		<td><%=(String)(m.get("roomGrade"))%></td>
	</tr>
	<tr>
		<td>룸 가격</td>
		<td><%=(Integer)(m.get("roomPrice"))%></td>
	</tr>
	<tr>
		<td>룸 정보</td>
		<td><%=(String)(m.get("roomInfo"))%></td>
	</tr>
	<tr>
		<td>룸 최대 인원수</td>
		<td><%=(Integer)(m.get("roomMax"))%></td>
	</tr>
	<tr>
		<td>룸 상태</td>
		<td><%=(String)(m.get("roomState"))%></td>
	</tr>
	<tr>
		<td>룸 이미지</td>
		<td><img src="/Semi_F_GDCC/upload/<%=(String)(m.get("roomImg"))%>"></td>
	</tr>
		
	</table>
	<div style="text-align:center;margin-top:10px;margin-bottom:10px;">
	<a href="/Semi_F_GDCC/admin/updateRoomForm.jsp?roomNo=<%=roomNo%>" class="btn btn-success">수정하기</a>
	<a href="/Semi_F_GDCC/admin/adroomList.jsp" class="btn btn-success">돌아가기</a>
	</div>
	</div>
</body>
</html>