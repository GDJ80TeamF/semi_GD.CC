<%@page import="gdcc.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
%>  
<%
	HashMap<String,Object>  loginAdmin = (HashMap<String,Object>) (session.getAttribute("loginAdmin"));
%>
<%
	// parameter 값
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	// 디버깅
	System.out.println("noticeNo: " + noticeNo);
%>
<% 
	HashMap<String, Object> m = NoticeDAO.selectNoticeOne(noticeNo);
	// 공지사항 넘겨진 값
	System.out.println(m);
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
  text-align:center;
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

div button {
  display: inline-block; /* 블록 요소에서 인라인-블록 요소로 변경 */
  vertical-align: middle; /* 버튼을 select 요소와 수직 정렬 */
  margin-left: 5px; /* select 요소와 버튼 사이의 간격 조정 */
  padding: 10px 20px;
  text-align: center;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  margin-bottom:10px;
}

div button:hover {
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


</style>
</head>
<body>
<jsp:include page="/admin/sidebar.jsp"></jsp:include>
	<div class="main-container">
		<jsp:include page="/admin/headerMainboard.jsp"></jsp:include>
	<hr>
	<form method="post" action="/Semi_F_GDCC/admin/action/updateNoticeAction.jsp">
		<table>
		<tr>
			<td>공지번호:</td>
			<td><input type="" name="noticeNo" value="<%=(Integer)(m.get("noticeNo"))%>" readonly="readonly"></td>		
		</tr>
		<tr>
			<td>관리자 이메일:</td>
			<td><input type="text" name="adminMail" value="<%=(String)(loginAdmin.get("adminMail"))%>" readonly="readonly"></td>		
		</tr>
		<tr>
			<td>공지번호:</td>
			<td><input type="text" name="noticeTitle" value="<%=(String)(m.get("noticeTitle"))%>"></td>		
		</tr>
		<tr>
			<td>공지 내용:</td>
			<td><textarea rows="5" cols="50" name="noticeContent"><%=(String)(m.get("noticeContent"))%></textarea></td>		
		</tr>
		
	
	</table>
		<div  style="text-align:center;">
			<button type="submit">수정하기</button>
		</div>
	</form>
		<div style="text-align:center;">
			<a href="/Semi_F_GDCC/admin/noticeList.jsp">취소</a>
		</div>
</div>
</body>
</html>