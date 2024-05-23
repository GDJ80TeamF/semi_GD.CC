<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	// 파라미터 complexNo
	int complexNo = Integer.parseInt(request.getParameter("complexNo"));
	
	// 디버깅
	System.out.println("complexNo: " + complexNo);
%>
<%
	HashMap<String, Object> m = ComplexDAO.selectComplexOne(complexNo); 
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


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>호텔 시설 상세정보</h1>
	<table border="1">
		<tr>
			<td>complexNO</td>
			<td><%=(Integer)(m.get("complexNo"))%></td>
		</tr>
		<tr>
			<td>complexName</td>
			<td><%=(String)(m.get("complexName"))%></td>
		</tr>
		<tr>
			<td>complexState</td>
			<td><%=(String)(m.get("complexState"))%></td>
		</tr>
		<tr>
			<td>complexInfo</td>
			<td><%=(String)(m.get("complexInfo"))%></td>
		</tr>
		<tr>
			<td>createDate</td>
			<td><%=(String)(m.get("createDate"))%></td>
		</tr>
		<tr>
			<td>updateDate</td>
			<td><%=(String)(m.get("updateDate"))%></td>
		</tr>
	</table>
	<br>
	<div class="text-center">
	<a href="/Semi_F_GDCC/admin/updateComplexForm.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>" class="btn btn-primary">수정</a>
	<a href="/Semi_F_GDCC/admin/deleteComplexForm.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>" class="btn btn-primary">삭제</a>
	</div>
	<br>
	<div class="text-center">
	<a href="/Semi_F_GDCC/admin/complexList.jsp">취소</a>
	</div>
	</div>
</body>
</html>