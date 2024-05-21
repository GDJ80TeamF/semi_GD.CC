<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdcc.dao.*" %>
<%@ page import="java.util.*" %>
<%
	//만약세션이 비어있다면 로그인이 되지 않은 것 -> 페이지에 접근 불가능 -> 로그인 폼으로 리다이렉
	if(session.getAttribute("loginAdmin") == null){
		response.sendRedirect("/Semi_F_GDCC/admin/adminLoginForm.jsp");
		return;
	}
	
	
	
	String adminMail = request.getParameter("adminMail");
	System.out.println(adminMail);
	//사원 개인정보 DAO
	HashMap<String,Object> m = AdminDAO.selectMyPage(adminMail);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
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
input[type=text] {
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
	<form method="post" action="/Semi_F_GDCC/admin/action/updateMyPageAction.jsp" enctype="multipart/form-data">
		<table>
		
		<tr>
			<td>아이디(메일)</td>
			<td><input name="adminMail" value="<%=(String)m.get("adminMail") %>" readonly type="text"></td>
		</tr>
		<tr>
			<td>사원 이름</td>
			<td><input name="adminName" value="<%=(String)m.get("adminName") %>" type="text"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%
					if(((String)m.get("adminGender")).equals("남")){
				%>
				
				<input type="radio" name="adminGender" value="남" id="남" checked>
				<label for="남">남</label>
				<input type="radio" name="adminGender" value="여" id="여">
				<label for="여">여</label>
				
				
				
				<%	
					}else{
				%>
				<input type="radio" name="adminGender" value="남" id="남">
				<label for="남">남</label>
				<input type="radio" name="adminGender" value="여" id="여" checked>
				<label for="여">여</label>
				
				
				
				<% 
					}
				%>
			
			</td>
		</tr>
		<tr>
			<td>사원 생년월일</td>
			<td><input name="adminBirth" value="<%=(String)m.get("adminBirth") %>" readonly type="text"></td>
		</tr>
		<tr>
			<td>사원 연락처</td>
			<td><input name="adminContact" value="<%=(String)m.get("adminContact") %>" type="text"></td>
		</tr>
		<tr>
			<td>사원 프로필 사진</td>
			<td>
			<input name="adminProfile" type="file" required>
			</td>
		</tr>
		
	
	
	</table>
	
		<button type="submit">수정하기! </button>
	</form>
	<a href="/Semi_F_GDCC/admin/myPage.jsp?adminMail=<%=adminMail%>">취소 </a>
	</div>
</body>
</html>