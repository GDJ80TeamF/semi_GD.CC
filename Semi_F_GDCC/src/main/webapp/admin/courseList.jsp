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