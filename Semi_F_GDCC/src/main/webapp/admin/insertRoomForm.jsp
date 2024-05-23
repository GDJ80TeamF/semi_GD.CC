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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<div class="text-center">
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
		<br>
		<div>
			<button type="submit" class="btn btn-primary">룸 추가</button>
			
		
		</div>
		
	</form>
	<br>
	<div class="text-center">
	<a href="/Semi_F_GDCC/admin/roomList.jsp">취소</a>
	</div>
	</div>
	</div>
</body>
</html>