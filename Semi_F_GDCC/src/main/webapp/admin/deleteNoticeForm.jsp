<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>  
<%
	// 공지번호
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
	<form method="post" action="/Semi_F_GDCC/admin/action/deleteCkNoticeAction.jsp?noticeNo=<%=noticeNo%>">
		<!-- 공지번호 -->
		<input type="text" name="noticeNo" value=<%=(Integer)(m.get("noticeNo"))%> style="display:none;">
		<div>공지를 진심으로 삭제하시겠습니까????????</div>
		<button type="submit">비밀번호 확인하고 삭제하기</button>
	</form>
	<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
</body>
</html>