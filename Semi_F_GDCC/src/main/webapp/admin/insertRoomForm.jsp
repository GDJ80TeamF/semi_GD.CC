<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%-- <%
	//인증 분기 세션 변수 이름 : loginAdmin
	if(session.getAttribute("loginAdmin") == null){
	response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
	return;
	}
%> --%>
<%
	
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
	<form method="post" action="/Semi_F_GDCC/admin/action/insertRoomAction.jsp" enctype="multipart/form-data">
		<h1>호텔 룸 추가</h1>
		<div>
			룸 등급:
			<input type="text" name="roomGrade">
		</div>
		<div>
			룸 가격:
			<input type="text" name="roomPrice">
		</div>
		<div>
			룸 정보:<br>
			<textarea rows="5" cols="50" name="roomInfo"></textarea>
		</div>
		<div>
			룸 최대 인원수:
			<input type="text" name="roomMax">
		</div>
		<div>
			룸 상태:
			<input type="text" name="roomState">
		</div>
		<div>
			룸 이미지:
			<input type="file" name="roomImg">
		</div>
		<div>
			<button type="submit">룸 추가</button>
			<a href="/Semi_F_GDCC/admin/roomList.jsp">취소</a>
		</div>
	</form>
	</div>
</body>
</html>