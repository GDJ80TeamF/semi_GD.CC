<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="gdcc.dao.*" %>
<%
	ArrayList<HashMap<String,Object>> courseList
		= CourseDAO.selectCourseList();

	System.out.println(courseList + "<==courseList.course");
	
	//상태변경 실패할때 뜨는 메세지
	String msg = request.getParameter("msg");
	
	if(msg == null){
		msg ="";
	}
	if(msg.equals("F")){
		msg = "변경실패하였습니다";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스리스트</title>
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
	<h1>코스리스트</h1>
		<table>
			<tr>
				<th>코스</th>
				<th></th>
				<th>상태변경</th>
			</tr>
			<%
				for(HashMap<String,Object> m : courseList){
			%>
				<tr>
					<td>
						<%=m.get("courseName") %>
					</td>
					<td>
						<a href="/Semi_F_GDCC/admin/courseOne.jsp?courseName=<%=m.get("courseName")%>">
							상세보기
						</a>
					</td>
					<td>
						<form method="post" action="/Semi_F_GDCC/admin/action/updateCourseAction.jsp">
							<input type="hidden" name="courseName" value="<%=m.get("courseName") %>">
								<select name="courseState">
										<option value=<%=m.get("courseState")%>>현재 <%=m.get("courseState")%></option>
										<option value="이용가능">이용가능</option>
										<option value="보수중">보수중</option>
										<option value="휴장">휴장</option>
								</select>
							<button type="submit">변경</button>
							<%=msg %>
						</form>
					</td>
				</tr>
			<%
				}
			%>
			
		</table>
		</div>
</body>
</html>