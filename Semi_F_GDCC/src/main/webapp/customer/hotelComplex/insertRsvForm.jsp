<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%

	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}

	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<table>
		<tr>
			<td>호텔 예약번호</td>
			<td></td>
		</tr>
		<tr>
			<td>예약날짜</td>
			<td></td>
		</tr>
		<tr>
			<td>이용 시설 </td>
			<td></td>
		</tr>
		<tr>
			<td>예약 시간</td>
			<td></td>
		</tr>
		<tr>
			<td>예약 인원 </td>
			<td></td>
		</tr>
	
	</table>
	<button type="submit"></button>
</form>
</body>
</html>