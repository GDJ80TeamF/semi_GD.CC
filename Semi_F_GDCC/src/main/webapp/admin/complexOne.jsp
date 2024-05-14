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
</head>
<body>
	<h1>호텔 complex 시설 상세정보</h1>
	<table border="1">
		<tr>
			<td>complexNO</td>
			<td>complexName</td>
			<td>complexState</td>
			<td>complexInfo</td>
			<td>createDate</td>
			<td>updateDate</td>
		</tr>
		<tr>
			<td><%=(Integer)(m.get("complexNo"))%></td>
			<td><%=(String)(m.get("complexName"))%></td>
			<td><%=(String)(m.get("complexState"))%></td>
			<td><%=(String)(m.get("complexInfo"))%></td>
			<td><%=(String)(m.get("createDate"))%></td>
			<td><%=(String)(m.get("updateDate"))%></td>
		</tr>
	</table>
	<a href="/Semi_F_GDCC/admin/complexList.jsp">취소</a>
	<a href="/Semi_F_GDCC/admin/updateComplexForm.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">수정</a>
	<a href="/Semi_F_GDCC/admin/deleteComplexForm.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">삭제</a>
</body>
</html>