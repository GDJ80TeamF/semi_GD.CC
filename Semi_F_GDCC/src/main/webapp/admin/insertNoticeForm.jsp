<%@page import="gdcc.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>
<%
	HashMap<String,Object> loginAdmin = (HashMap<String,Object>)(session.getAttribute("loginAdmin"));
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
	<h1>공지사항 추가</h1>
	<form method="post" action="/Semi_F_GDCC/admin/action/insertNoticeAction.jsp">
	<table>
		<tr>
			<td>관리자 이메일:</td>
			<td><input type="text" name="adminMail" value="<%=(String)(loginAdmin.get("adminMail"))%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>공지 제목:</td>
			<td><input type="text" name="noticeTitle"></td>
		</tr>
		<tr>
			<td>공지 내용:</td>
			<td><textarea rows="5" cols="50" name="noticeContent"></textarea></td>
		</tr>
		
			
		
	</table>
	<div style="text-align:center;">
	<button type="submit" class="btnn">제출하기</button>
	<a href="/Semi_F_GDCC/admin/noticeList.jsp" class="btnn">취소</a>
	</div>
	</form>
	</div>
</body>
</html>