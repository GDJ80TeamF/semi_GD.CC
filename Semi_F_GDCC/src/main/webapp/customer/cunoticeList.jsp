<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>
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
	ArrayList<HashMap<String, Object>> List = NoticeDAO.selectNotice(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항</h1>
		<table border="1">
			<tr>
				<th>공지 번호</th>
				<th>공지 제목</th>
			</tr>
			<%
				for(HashMap<String, Object>  m : List){
			%>
				<tr>
					<td>
						<a href="/Semi_F_GDCC/customer/cunoticeOne.jsp?noticeNo=<%=(Integer)(m.get("noticeNo"))%>">
						<%=(Integer)(m.get("noticeNo"))%></a>
					</td>
					<td><%=(String)(m.get("noticeTitle"))%></td>
				</tr>
			<%
				}
			%>
		</table>
</body>
</html>