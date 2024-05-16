<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	//로그인 인증분기
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<form action="/Semi_F_GDCC/admin/courseInfoForm.jsp">
		<h1>코스상세보기</h1>
			<table>
				<tr>
					<th>
						코스이름 : 
					</th>
					<td>
						<%=courseOne.get("name") %>
					</td>
				</tr>
				<tr>
					<th>
						코스상태 : 
					</th>
					<td>
						<%=courseOne.get("state") %>
					</td>
				</tr>
				<tr>
					<th>
						코스정보 : 
					</th>
					<td>
						<%=courseOne.get("info") %>
					</td>
				</tr>
				<tr>
					<th>
						생성일 : 
					</th>
					<td>
						<%=courseOne.get("createDate") %>
					</td>
				</tr>
				<tr>
					<th>
						변경일 : 
					</th>
					<td>
						<%=courseOne.get("updateDate") %>
					</td>
				</tr>
			</table>
			<input type="hidden" name="courseName" value="<%=courseOne.get("name") %>">
		<button type="submit">정보변경</button>
	</form>
	</div>
</body>
</html>