<%@page import="gdcc.dao.ComplexDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
	ArrayList<HashMap<String, Object>> List = ComplexDAO.selectComplex(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>complexList</title>
</head>
<body>
<h1>호텔 complex 리스트</h1>
	<table border="1">
		<tr>
			<td>complexNO</td>
			<td>complexName</td>
			<td>complexState</td>
		</tr>
		<%
			for(HashMap<String, Object> m : List){
		%>
			<tr>
				<td><a href="/Semi_F_GDCC/admin/complexOne.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>"><%=(Integer)(m.get("complexNo"))%></a></td>
				<td><%=(String)(m.get("complexName"))%></td>
				<td><%=(String)(m.get("complexState"))%></td>
			</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>