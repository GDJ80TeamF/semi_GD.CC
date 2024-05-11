<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	HashMap<String, Object> m = NoticeDAO.selectNoticeOne(noticeNo);       
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- admin 비밀번호 입력 후 삭제 가능. -->
	<div>비밀번호를 입력하면 공지가 삭제됩니다.</div>
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteNoticeAction.jsp"> 
		<input type="text" name="noticeNo" value=<%=(Integer)(m.get("noticeNo"))%> style="display:none;">
		<input type="text" name="adminPw">
		<button type="submit">삭제하기</button>
	</form>
</body>
</html>