<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인증 분기 세션 변수 이름 : loginAdmin
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	// 공지 5개씩
	int rowPerPage = 5;
	int startRow = (currentPage-1) * rowPerPage;	
%>

<%
	ArrayList<HashMap<String, Object>> List = NoticeDAO.selectNotice(startRow, rowPerPage);
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
.btnn {
  display: inline-block;
  vertical-align: middle;
  padding: 6px 12px;
  font-size: 14px;
  text-align: center;
  border: 1px solid #007bff;
  background-color: green;
  color: #fff;
  border-radius: 3px;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
}
.btnn:hover {
  background-color: green;
  border-color: black;
  text-decoration: none;
}

</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<h1>공지사항</h1>
		<table>
			<tr>
				<th>공지 번호</th>
				<th>관리자 이메일</th>
				<th>공지 제목</th>
			</tr>
			<%
				for(HashMap<String, Object>  m : List){
			%>
				<tr>
					<td>
						<a href="/Semi_F_GDCC/admin/noticeOne.jsp?noticeNo=<%=(Integer)(m.get("noticeNo"))%>">
						<%=(Integer)(m.get("noticeNo"))%></a>
					</td>
					<td><%=(String)(m.get("adminMail"))%></td>
					<td><%=(String)(m.get("noticeTitle"))%></td>
				</tr>
			<%
				}
			%>
		</table>
	<div style="text-align:center;">
	<a href="/Semi_F_GDCC/admin/insertNoticeForm.jsp?adminMail=<%=(String)(loginAdmin.get("adminMail"))%>" class="btnn">글 작성하기</a>
	</div>
	</div>
</body>
</html>																				                                                                                