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
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
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
				<td>
					현재 상태: <%=(String)(m.get("complexState"))%>
					<form method="post" action="/Semi_F_GDCC/admin/action/updateComplexStateAction.jsp?complexNo=<%=(Integer)(m.get("complexNo"))%>">				
						변경할 상태 선택하기: 
						<select name="complexState">
							<option value="사용가능">사용가능</option>
							<option value="수리중">수리중</option>
							<option value="휴장">휴장</option>
						</select>
						<button type="submit">변경하기</button>
					</form>
				</td>
			</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>