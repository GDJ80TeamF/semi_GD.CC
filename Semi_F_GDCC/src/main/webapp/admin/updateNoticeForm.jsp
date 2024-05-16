<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>  
<%
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>
<%
	// parameter 값
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	// 디버깅
	System.out.println("noticeNo: " + noticeNo);
%>
<% 
	HashMap<String, Object> m = NoticeDAO.selectNoticeOne(noticeNo);
	// 공지사항 넘겨진 값
	System.out.println(m);
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
	<form method="post" action="/Semi_F_GDCC/admin/action/updateNoticeAction.jsp">
		<div>
			공지번호:
			<input type="" name="noticeNo" value="<%=(Integer)(m.get("noticeNo"))%>" readonly="readonly">
		</div>
		<div>
			관리자 이메일:
			<input type="text" name="adminMail" value="<%=(String)(loginAdmin.get("adminMail"))%>" readonly="readonly">
		</div>
		<div>
			공지 제목:
			<input type="text" name="noticeTitle" value="<%=(String)(m.get("noticeTitle"))%>">
		</div>
		<div>
			공지 내용:
			<br>
			<textarea rows="5" cols="50" name="noticeContent"><%=(String)(m.get("noticeContent"))%></textarea>
		</div>
		<div>
			<button type="submit">수정하기</button>
		</div>
	</form>
			<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
</div>
</body>
</html>