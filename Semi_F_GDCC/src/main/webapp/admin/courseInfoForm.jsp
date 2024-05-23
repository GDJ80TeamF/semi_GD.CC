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
<style>
h1{
	text-align:center;
}
/* 테이블 스타일 */
table {
  border-collapse: collapse;
  width: 100%;
}

/* 테이블 행 스타일 */
tr {
  border-bottom: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
td {
  padding: 8px;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f2f2f2;
}


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>코스 정보변경</h1>
	<br>
		<form action="/Semi_F_GDCC/admin/action/courseInfoAction.jsp">
			<input type="hidden" name="courseName" value="<%=courseOne.get("name")%>">
			
			<div class="text-center">
			<textarea rows="5" cols="40" name="courseInfo" class="text-center"><%=courseOne.get("info") %></textarea>
			</div>
			<br>
			<div class="text-center">
			<button type="submit" class="btn btn-primary">
			변경하기
			</button></div>
		</form>
	</div>
</body>
</html>