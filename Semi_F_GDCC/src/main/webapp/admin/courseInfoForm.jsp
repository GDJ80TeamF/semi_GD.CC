<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//코스 불러오기
	String courseName = request.getParameter("courseName");
		System.out.println(courseName + "<==courseName");
		
	//코스 정보 가져오기
	HashMap<String,Object>courseOne = CourseDAO.selectCourse();
		System.out.println(courseOne + "<==courseOne");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스정보변경</title>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>코스 정보변경</h1>
		<form action="/Semi_F_GDCC/admin/action/courseInfoAction.jsp">
			<input type="hidden" name="courseName" value="<%=courseOne.get("name")%>">
				<textarea rows="5" cols="40" name="courseInfo"><%=courseOne.get("info") %></textarea>
					<br>
					<button type="submit">
						변경하기
					</button>
		</form>
	</div>
</body>
</html>