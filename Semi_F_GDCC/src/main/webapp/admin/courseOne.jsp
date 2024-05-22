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
<style>
h1{
	text-align:center;
}
/* 테이블 전체 스타일 */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  background-color: #ffffff;
  margin-bottom: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* 테이블 헤더 스타일 */
th {
  background-color: #f2f2f2;
  color: black;
  font-weight: bold;
  padding: 15px;
  text-align: left;
  border-bottom: 2px solid #007bff;
}

/* 테이블 셀 스타일 */
td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #f2f2f2;
}

/* 짝수 행 배경색 지정 */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* 링크 스타일 */
a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  color: #0056b3;
  text-decoration: underline;
}

td button {
  display: inline-block; /* 블록 요소에서 인라인-블록 요소로 변경 */
  vertical-align: middle; /* 버튼을 select 요소와 수직 정렬 */
  margin-left: 5px; /* select 요소와 버튼 사이의 간격 조정 */
  padding: 10px 20px;
  text-align: center;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
}

td button:hover {
  background-color: #0056b3;
}


/* 입력 필드 스타일 */
input[type=text], select {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

/* 선택 박스 스타일 */
select {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: #f8f8f8;
}
</style>
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