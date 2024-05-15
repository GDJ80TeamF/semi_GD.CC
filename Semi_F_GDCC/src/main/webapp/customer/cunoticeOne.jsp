<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
	// parameter 값
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	// 디버깅
	System.out.println("noticeNo: " + noticeNo);
%>
<%
	HashMap<String, Object> m = NoticeDAO.selectNoticeOne(noticeNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세정보</title>
</head>
<body>
<h1>공지 상세정보</h1>
	<table border="1">
		<tr>
			<td>공지 번호</td>
			<td>공지 제목</td>
			<td>공지 내용</td>
		</tr>
		<tr>
			<td><%=(Integer)(m.get("noticeNo"))%></td>
			<td><%=(String)(m.get("noticeTitle"))%></td>
			<td><%=(String)(m.get("noticeContent"))%></td>
		</tr>
	</table>
</body>
</html>