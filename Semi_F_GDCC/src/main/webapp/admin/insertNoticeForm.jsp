<%@page import="gdcc.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>)(session.getAttribute("loginAdmin"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>공지사항 추가</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/insertNoticeAction.jsp">
		<div>
			관리자 이메일:
			<input type="text" name="adminMail" value="<%=(String)(loginAdmin.get("adminMail"))%>" readonly="readonly">
		</div>
		<div>
			공지 제목:
			<input type="text" name="noticeTitle">
		</div>
		<div>
			공지 내용:
			<br>
			<textarea rows="5" cols="50" name="noticeContent"></textarea>
		</div>
		<div>
			<button type="submit">제출하기</button>
			<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
		</div>
	</form>
	</div>
</body>
</html>