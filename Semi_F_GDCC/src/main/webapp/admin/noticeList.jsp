<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginAdmin
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
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

<%
	for(HashMap<String, Object>  m : List){
%>
		<table border="1">
			<tr>
				<th>공지 번호</th>
				<th>관리자 번호</th>
				<th>공지 제목</th>
				<th>공지 내용</th>
			</tr>
			<tr>
				<td>
					<a href="/Semi_F_GDCC/admin/noticeOne.jsp?noticeNo=<%=(Integer)(m.get("noticeNo"))%>">
					<%=(Integer)(m.get("noticeNo"))%></a>
				</td>
				<td><%=(Integer)(m.get("adminNo"))%></td>
				<td><%=(String)(m.get("noticeTitle"))%></td>
				<td><%=(String)(m.get("noticeContent"))%></td>
			</tr>
		</table>
			
		<%
			}
		%>
	
	<a href="/Semi_F_GDCC/admin/insertNoticeForm.jsp">글 작성하기</a>
	<a href="/Semi_F_GDCC/admin/mainBoard.jsp">취소</a>
</body>
</html>																				                                                                                